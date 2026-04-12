import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ghana_tourism_app/ai/vision_service.dart';
import 'package:ghana_tourism_app/home/models/tourst_site.dart';
import 'package:ghana_tourism_app/home/views/site_detail_screen.dart';
import 'package:image_picker/image_picker.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen>
    with SingleTickerProviderStateMixin {
  // ── Constants ─────────────────────────────────────────────────────────────
  static const _gold = Color(0xFFFCD116);
  static const _red = Color(0xFFCE1126);
  static const _green = Color(0xFF006B3F);
  static const _dark = Color(0xFF1A1A2E);

  // ── State ─────────────────────────────────────────────────────────────────
  final _visionService = VisionService();
  final _picker = ImagePicker();

  File? _selectedImage;
  SiteDetectionResult? _result;
  TouristSite? _matchedSite;

  bool _isAnalysing = false;
  String _statusMessage = '';

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(_pulseController);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  // ── Image picking ─────────────────────────────────────────────────────────
  Future<void> _pickImage(ImageSource source) async {
    final picked = await _picker.pickImage(
      source: source,
      imageQuality: 85,
      maxWidth: 1024, // keep it reasonable for API
    );
    if (picked == null) return;

    setState(() {
      _selectedImage = File(picked.path);
      _result = null;
      _matchedSite = null;
    });

    await _analyseImage();
  }

  // ── Core: send to Claude Vision ───────────────────────────────────────────
  Future<void> _analyseImage() async {
    if (_selectedImage == null) return;

    setState(() {
      _isAnalysing = true;
      _statusMessage = 'Scanning image...';
    });

    try {
      setState(() => _statusMessage = 'Asking Claude to identify the site...');

      final result = await _visionService.identifySite(_selectedImage!);

      // Try to find a matching site in our local list
      TouristSite? matched;
      if (result.matchedSiteId != null) {
        try {
          matched = ghanaTopSites.firstWhere(
            (s) => s.id == result.matchedSiteId,
          );
        } catch (_) {
          matched = null;
        }
      }

      setState(() {
        _result = result;
        _matchedSite = matched;
        _isAnalysing = false;
        _statusMessage = '';
      });
    } catch (e) {
      setState(() {
        _isAnalysing = false;
        _statusMessage = '';
      });
      if (mounted) {
        print('-------- Error during image analysis: $e');

        _showError(e.toString().replaceAll('Exception: ', ''));
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: _red,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  // ── UI ────────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _dark,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: _selectedImage == null
                    ? _buildEmptyState()
                    : Column(
                        children: [
                          _buildImagePreview(),
                          if (_isAnalysing) _buildAnalysingState(),
                          if (_result != null && !_isAnalysing)
                            _buildResultCard(),
                          const SizedBox(height: 20),
                          _buildPickAgainButton(),
                          const SizedBox(height: 40),
                        ],
                      ),
              ),
            ),
            if (_selectedImage == null) _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  // ── Top bar ───────────────────────────────────────────────────────────────
  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Site Scanner',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Powered by Claude Vision',
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // Claude logo pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: _gold.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _gold.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.auto_awesome_rounded, size: 14, color: _gold),
                const SizedBox(width: 4),
                Text(
                  'Claude',
                  style: TextStyle(
                    color: _gold,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Empty state ───────────────────────────────────────────────────────────
  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          const SizedBox(height: 40),
          // Animated scan icon
          AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) =>
                Transform.scale(scale: _pulseAnimation.value, child: child),
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _gold.withOpacity(0.1),
                border: Border.all(color: _gold.withOpacity(0.3), width: 2),
              ),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _gold.withOpacity(0.15),
                    border: Border.all(color: _gold.withOpacity(0.5), width: 2),
                  ),
                  child: Icon(
                    Icons.document_scanner_rounded,
                    size: 48,
                    color: _gold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 36),
          const Text(
            'Identify Any\nGhana Tourist Site',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w900,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Take a photo or upload one from your gallery.\nClaude AI will identify the site and show\nyou everything about it.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white38, fontSize: 14, height: 1.6),
          ),
          const SizedBox(height: 40),
          // How it works steps
          _buildHowItWorks(),
        ],
      ),
    );
  }

  Widget _buildHowItWorks() {
    final steps = [
      (Icons.add_a_photo_rounded, 'Take or upload a photo'),
      (Icons.auto_awesome_rounded, 'Claude analyses the image'),
      (Icons.travel_explore_rounded, 'Get full site information'),
    ];
    return Column(
      children: steps.asMap().entries.map((entry) {
        final i = entry.key;
        final step = entry.value;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _gold.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(step.$1, color: _gold, size: 20),
              ),
              const SizedBox(width: 14),
              Text(
                '${i + 1}. ${step.$2}',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ── Image preview ─────────────────────────────────────────────────────────
  Widget _buildImagePreview() {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: _gold.withOpacity(0.15),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.file(
          _selectedImage!,
          width: double.infinity,
          height: 280,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // ── Analysing loader ──────────────────────────────────────────────────────
  Widget _buildAnalysingState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _gold.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 36,
              height: 36,
              child: CircularProgressIndicator(color: _gold, strokeWidth: 3),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Analysing...',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _statusMessage,
                    style: const TextStyle(color: Colors.white38, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Result card ───────────────────────────────────────────────────────────
  Widget _buildResultCard() {
    final result = _result!;
    final isMatched = _matchedSite != null;
    final isUnknown = result.detectedName == 'Unknown Site' || !isMatched;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // ── Detection summary ──────────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isUnknown ? Colors.white10 : _green.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isUnknown ? Colors.white12 : _green.withOpacity(0.3),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status row
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isUnknown
                            ? Colors.white10
                            : _green.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isUnknown
                            ? Icons.help_outline_rounded
                            : Icons.check_circle_rounded,
                        color: isUnknown ? Colors.white38 : _green,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isUnknown
                                ? 'Site Not Recognised'
                                : 'Site Identified!',
                            style: TextStyle(
                              color: isUnknown ? Colors.white38 : _green,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            result.detectedName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Confidence badge
                    _confidenceBadge(result.confidence),
                  ],
                ),
                const SizedBox(height: 14),
                // Claude's description
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.auto_awesome_rounded, size: 14, color: _gold),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          result.description,
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 13,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ── Matched site preview card ──────────────────────────────────
          if (isMatched) ...[
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SiteDetailScreen(site: _matchedSite!),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white12),
                ),
                child: Row(
                  children: [
                    // Thumbnail
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.network(
                        _matchedSite!.imageUrl,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 70,
                          height: 70,
                          color: Colors.white12,
                          child: const Icon(
                            Icons.image_not_supported,
                            color: Colors.white24,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    // Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _matchedSite!.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                size: 13,
                                color: _red,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                _matchedSite!.region,
                                style: const TextStyle(
                                  color: Colors.white38,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.star_rounded, size: 13, color: _gold),
                              const SizedBox(width: 3),
                              Text(
                                '${_matchedSite!.rating}  ·  ${_matchedSite!.entryFee.split('/').first.trim()}',
                                style: const TextStyle(
                                  color: Colors.white38,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Arrow
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: _red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // View full details button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SiteDetailScreen(site: _matchedSite!),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.travel_explore_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'View Full Site Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _confidenceBadge(String confidence) {
    final color = switch (confidence) {
      'high' => _green,
      'medium' => Colors.orange,
      _ => Colors.white38,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Text(
        confidence.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  // ── Pick again button ─────────────────────────────────────────────────────
  Widget _buildPickAgainButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          minimumSize: const Size(double.infinity, 48),
        ),
        onPressed: () => setState(() {
          _selectedImage = null;
          _result = null;
          _matchedSite = null;
        }),
        icon: const Icon(Icons.refresh_rounded, size: 18),
        label: const Text(
          'Try Another Image',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  // ── Bottom action buttons ─────────────────────────────────────────────────
  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      child: Column(
        children: [
          // Camera button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: _red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              onPressed: () => _pickImage(ImageSource.camera),
              icon: const Icon(Icons.camera_alt_rounded, color: Colors.white),
              label: const Text(
                'Take a Photo',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Gallery button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.white24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () => _pickImage(ImageSource.gallery),
              icon: const Icon(Icons.photo_library_rounded),
              label: const Text(
                'Choose from Gallery',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
