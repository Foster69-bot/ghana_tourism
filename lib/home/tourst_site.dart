class TouristSite {
  final String id;
  final String name;
  final String region;
  final String category; // 'nature' or 'artificial'
  final String imageUrl;
  final String description;
  final double? distanceKm;

  const TouristSite({
    required this.id,
    required this.name,
    required this.region,
    required this.category,
    required this.imageUrl,
    required this.description,
    this.distanceKm,
  });
}

// Sample data — replace with Supabase fetch later
final List<TouristSite> ghanaTopSites = [
  TouristSite(
    id: '1',
    name: 'Kwame Nkrumah Mausoleum',
    region: 'Greater Accra',
    category: 'artificial',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Kwame_nkrumah_grave_accra_ghana.jpg/500px-Kwame_nkrumah_grave_accra_ghana.jpg',
    description: 'Historic memorial park dedicated to Ghana\'s first president.',
    distanceKm: 5,
  ),
  TouristSite(
    id: '2',
    name: 'Labadi Beach',
    region: 'Greater Accra',
    category: 'nature',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Solnedgang_p%C3%A5_Labadi_beach.jpg/500px-Solnedgang_p%C3%A5_Labadi_beach.jpg',
    description: 'Popular sandy beach along the Atlantic coast.',
    distanceKm: 8,
  ),
  TouristSite(
    id: '3',
    name: 'Cape Coast Castle',
    region: 'Central',
    category: 'artificial',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/a/a0/Cape_Coast_Castle%2C_Cape_Coast%2C_Ghana.JPG',
    description: 'UNESCO World Heritage slave trade castle.',
    distanceKm: 145,
  ),
  TouristSite(
    id: '4',
    name: 'Kakum National Park',
    region: 'Central',
    category: 'nature',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/1/16/Kakum.jpg',
    description: 'Tropical rainforest with canopy walkways.',
    distanceKm: 150,
  ),
  TouristSite(
    id: '5',
    name: 'Boti Falls',
    region: 'Eastern',
    category: 'nature',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Boti_Falls%2C_Eastern_Region.JPG/1920px-Boti_Falls%2C_Eastern_Region.JPG',
    description: 'Twin waterfalls surrounded by lush forest.',
    distanceKm: 90,
  ),
  TouristSite(
    id: '6',
    name: 'Elmina Castle',
    region: 'Central',
    category: 'artificial',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Elmina_Castle_-_Ghana.jpg/1920px-Elmina_Castle_-_Ghana.jpg',
    description: 'Oldest European building in sub-Saharan Africa.',
    distanceKm: 155,
  ),
  TouristSite(
    id: '7',
    name: 'Mole National Park',
    region: 'Savannah',
    category: 'nature',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Elmina_Castle_-_Ghana.jpg/1920px-Elmina_Castle_-_Ghana.jpg',
    description: 'Ghana\'s largest wildlife sanctuary.',
    distanceKm: 600,
  ),
  TouristSite(
    id: '8',
    name: 'Larabanga Mosque',
    region: 'Savannah',
    category: 'artificial',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Larabanga_Mosque_Ghana.jpg/1920px-Larabanga_Mosque_Ghana.jpg',
    description: 'One of the oldest mosques in West Africa.',
    distanceKm: 610,
  ),
];

const List<String> ghanaRegions = [
  'Greater Accra',
  'Ashanti',
  'Western',
  'Eastern',
  'Central',
  'Volta',
  'Northern',
  'Upper East',
  'Upper West',
  'Bono',
  'Bono East',
  'Ahafo',
  'Savannah',
  'North East',
  'Oti',
  'Western North',
];
