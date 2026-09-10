import 'package:flutter_test/flutter_test.dart';
import 'package:ghana_tourism_app/home/models/tourst_site.dart';
import 'package:ghana_tourism_app/home/repositories/tourist_site_repository.dart';

void main() {
  final fallback = <TouristSite>[ghanaTopSites.first];

  test('maps non-empty Supabase rows to TouristSite values', () async {
    final repository = TouristSiteRepository(
      fallbackSites: fallback,
      loadRows: () async => [_touristSiteRow],
    );

    final sites = await repository.getTouristSites();

    expect(sites, hasLength(1));
    expect(sites.single.id, 'remote-1');
    expect(sites.single.name, 'Remote Site');
    expect(sites.single.galleryImages, ['gallery.jpg']);
    expect(sites.single.distanceKm, 12.5);
  });

  test('uses hardcoded sites when Supabase returns no rows', () async {
    final repository = TouristSiteRepository(
      fallbackSites: fallback,
      loadRows: () async => [],
    );

    expect(await repository.getTouristSites(), same(fallback));
  });

  test('uses hardcoded sites when the Supabase request fails', () async {
    final repository = TouristSiteRepository(
      fallbackSites: fallback,
      loadRows: () async => throw Exception('offline'),
    );

    expect(await repository.getTouristSites(), same(fallback));
  });
}

final _touristSiteRow = <String, dynamic>{
  'id': 'remote-1',
  'name': 'Remote Site',
  'region': 'Greater Accra',
  'category': 'nature',
  'image_url': 'cover.jpg',
  'description': 'Loaded from Supabase',
  'distance_km': 12.5,
  'latitude': 5.6037,
  'longitude': -0.187,
  'opening_time': '08:00 AM',
  'closing_time': '06:00 PM',
  'entry_fee': 'Free',
  'rating': 4.5,
  'gallery_images': ['gallery.jpg'],
  'pros': ['Accessible'],
  'cons': ['Busy'],
  'youtube_video_id': null,
  'address': 'Accra, Ghana',
  'best_time_to_visit': 'Year-round',
};
