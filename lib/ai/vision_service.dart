import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SiteDetectionResult {
  final String detectedName;
  final String confidence;
  final String description;
  final String? matchedSiteId;
  final bool fromCache;

  const SiteDetectionResult({
    required this.detectedName,
    required this.confidence,
    required this.description,
    this.matchedSiteId,
    this.fromCache = false,
  });

  // So we can save/load from shared_preferences as JSON
  Map<String, dynamic> toJson() => {
    'detectedName': detectedName,
    'confidence': confidence,
    'description': description,
    'matchedSiteId': matchedSiteId,
  };

  factory SiteDetectionResult.fromJson(Map<String, dynamic> json) =>
      SiteDetectionResult(
        detectedName: json['detectedName'] as String,
        confidence: json['confidence'] as String,
        description: json['description'] as String,
        matchedSiteId: json['matchedSiteId'] as String?,
        fromCache: true,
      );
}

class VisionService {
  static const _apiUrl = 'https://api.anthropic.com/v1/messages';
  static const _model = 'claude-sonnet-4-20250514';
  static const _cachePrefix = 'vision_cache_'; // key prefix in prefs

  // Session-level memory cache (faster than hitting disk every time)
  static final Map<String, SiteDetectionResult> _memoryCache = {};

  static const Map<String, String> _siteKeywords = {
    'kwame nkrumah': '1',
    'nkrumah': '1',
    'mausoleum': '1',
    'memorial park': '1',
    'labadi': '2',
    'la pleasure beach': '2',
    'labadi beach': '2',
    'cape coast castle': '3',
    'cape coast': '3',
    'kakum': '4',
    'kakum national park': '4',
    'canopy walkway': '4',
    'boti falls': '5',
    'boti': '5',
    'elmina': '6',
    'elmina castle': '6',
    "st george's castle": '6',
    'mole national park': '7',
    'mole': '7',
    'larabanga': '8',
    'larabanga mosque': '8',
  };

  Future<SiteDetectionResult> identifySite(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    final hash = md5.convert(bytes).toString();

    // ── 1. Check memory cache first (instant) ─────────────────────────────
    if (_memoryCache.containsKey(hash)) {
      return _memoryCache[hash]!;
    }

    // ── 2. Check persistent storage (survives app restarts) ───────────────
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('$_cachePrefix$hash');
    if (saved != null) {
      final result = SiteDetectionResult.fromJson(
        jsonDecode(saved) as Map<String, dynamic>,
      );
      _memoryCache[hash] = result; // warm up memory cache too
      return result;
    }

    // ── 3. Nothing cached → call Claude API ───────────────────────────────
    final apiKey = dotenv.get('ANTHROPIC_API_KEY', fallback: '');
    if (apiKey.isEmpty) {
      throw Exception('ANTHROPIC_API_KEY missing from .env file.');
    }

    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': apiKey,
        'anthropic-version': '2023-06-01',
      },
      body: jsonEncode({
        'model': _model,
        'max_tokens': 300,
        'system': '''
You are an expert guide for Ghanaian tourist sites.
Known sites: Kwame Nkrumah Mausoleum (Greater Accra), Labadi Beach (Greater Accra),
Cape Coast Castle (Central), Kakum National Park (Central), Boti Falls (Eastern),
Elmina Castle (Central), Mole National Park (Savannah), Larabanga Mosque (Savannah).
Respond with ONLY valid JSON — no markdown, no extra text.
''',
        'messages': [
          {
            'role': 'user',
            'content': [
              {
                'type': 'image',
                'source': {
                  'type': 'base64',
                  'media_type': _mediaType(imageFile.path),
                  'data': base64Encode(bytes),
                },
              },
              {
                'type': 'text',
                'text': '''Identify the Ghanaian tourist site in this image.
Respond with this exact JSON:
{
  "detected_name": "site name or Unknown Site",
  "confidence": "high or medium or low",
  "description": "one sentence of what you see",
  "is_ghana_site": true or false
}''',
              },
            ],
          },
        ],
      }),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Claude API error ${response.statusCode}: ${response.body}',
      );
    }

    final raw =
        (jsonDecode(response.body)['content'] as List).first['text'] as String;
    final parsed =
        jsonDecode(raw.replaceAll('```json', '').replaceAll('```', '').trim())
            as Map<String, dynamic>;

    final result = SiteDetectionResult(
      detectedName: parsed['detected_name'] as String? ?? 'Unknown Site',
      confidence: parsed['confidence'] as String? ?? 'low',
      description: parsed['description'] as String? ?? '',
      matchedSiteId: _matchId(parsed['detected_name'] as String? ?? ''),
      fromCache: false,
    );

    // ── 4. Save to both memory + persistent storage ────────────────────────
    _memoryCache[hash] = result;
    await prefs.setString('$_cachePrefix$hash', jsonEncode(result.toJson()));

    return result;
  }

  String? _matchId(String name) {
    final lower = name.toLowerCase();
    for (final entry in _siteKeywords.entries) {
      if (lower.contains(entry.key)) return entry.value;
    }
    return null;
  }

  String _mediaType(String path) {
    switch (path.toLowerCase().split('.').last) {
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'webp':
        return 'image/webp';
      default:
        return 'image/jpeg';
    }
  }
}
