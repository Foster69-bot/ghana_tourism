import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/tourst_site.dart';

typedef TouristSiteRowsLoader = Future<List<Map<String, dynamic>>> Function();

class TouristSiteRepository {
  TouristSiteRepository({
    SupabaseClient? supabase,
    TouristSiteRowsLoader? loadRows,
    List<TouristSite>? fallbackSites,
  }) : _fallbackSites = fallbackSites ?? ghanaTopSites,
       _loadRows =
           loadRows ??
           (() async {
             final client = supabase ?? Supabase.instance.client;
             final rows = await client
                 .from('tourist_sites')
                 .select('''
                   id,
                   name,
                   region,
                   category,
                   image_url,
                   description,
                   distance_km,
                   latitude,
                   longitude,
                   opening_time,
                   closing_time,
                   entry_fee,
                   rating,
                   gallery_images,
                   pros,
                   cons,
                   youtube_video_id,
                   address,
                   best_time_to_visit
                 ''')
                 .order('sort_order');

             return rows
                 .map((row) => Map<String, dynamic>.from(row))
                 .toList(growable: false);
           });

  final TouristSiteRowsLoader _loadRows;
  final List<TouristSite> _fallbackSites;

  Future<List<TouristSite>> getTouristSites() async {
    try {
      final rows = await _loadRows();
      if (rows.isEmpty) return _fallbackSites;

      return rows.map(TouristSite.fromJson).toList(growable: false);
    } on Object {
      return _fallbackSites;
    }
  }
}
