class TouristSite {
  final String id;
  final String name;
  final String region;
  final String category; // 'nature' | 'artificial'
  final String imageUrl;
  final String description;
  final double? distanceKm;

  // ── Rich detail fields ────────────────────────────────────────────────────
  final double latitude;
  final double longitude;
  final String openingTime;     // e.g. "08:00 AM"
  final String closingTime;     // e.g. "06:00 PM"
  final String entryFee;        // e.g. "GHS 50 / $5 USD"
  final double rating;          // 1.0 – 5.0
  final List<String> galleryImages;
  final List<String> pros;
  final List<String> cons;
  final String? youtubeVideoId; // 11-char YouTube ID
  final String address;
  final String bestTimeToVisit;

  const TouristSite({
    required this.id,
    required this.name,
    required this.region,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.openingTime,
    required this.closingTime,
    required this.entryFee,
    required this.rating,
    required this.galleryImages,
    required this.pros,
    required this.cons,
    required this.address,
    required this.bestTimeToVisit,
    this.distanceKm,
    this.youtubeVideoId,
  });

  // ── Supabase / JSON support ───────────────────────────────────────────────
  factory TouristSite.fromJson(Map<String, dynamic> json) {
    return TouristSite(
      id: json['id'] as String,
      name: json['name'] as String,
      region: json['region'] as String,
      category: json['category'] as String,
      imageUrl: json['image_url'] as String,
      description: json['description'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      openingTime: json['opening_time'] as String,
      closingTime: json['closing_time'] as String,
      entryFee: json['entry_fee'] as String,
      rating: (json['rating'] as num).toDouble(),
      galleryImages: List<String>.from(json['gallery_images'] ?? []),
      pros: List<String>.from(json['pros'] ?? []),
      cons: List<String>.from(json['cons'] ?? []),
      address: json['address'] as String,
      bestTimeToVisit: json['best_time_to_visit'] as String,
      distanceKm: json['distance_km'] != null
          ? (json['distance_km'] as num).toDouble()
          : null,
      youtubeVideoId: json['youtube_video_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'region': region,
      'category': category,
      'image_url': imageUrl,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'opening_time': openingTime,
      'closing_time': closingTime,
      'entry_fee': entryFee,
      'rating': rating,
      'gallery_images': galleryImages,
      'pros': pros,
      'cons': cons,
      'address': address,
      'best_time_to_visit': bestTimeToVisit,
      'distance_km': distanceKm,
      'youtube_video_id': youtubeVideoId,
    };
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Sample data — replace with Supabase fetch later
// ─────────────────────────────────────────────────────────────────────────────
final List<TouristSite> ghanaTopSites = [

  TouristSite(
    id: '1',
    name: 'Kwame Nkrumah Mausoleum',
    region: 'Greater Accra',
    category: 'artificial',
    imageUrl:
    'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Kwame_nkrumah_grave_accra_ghana.jpg/500px-Kwame_nkrumah_grave_accra_ghana.jpg',
    galleryImages: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Kwame_nkrumah_grave_accra_ghana.jpg/500px-Kwame_nkrumah_grave_accra_ghana.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Kwame_nkrumah_grave_accra_ghana.jpg/500px-Kwame_nkrumah_grave_accra_ghana.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Kwame_nkrumah_grave_accra_ghana.jpg/500px-Kwame_nkrumah_grave_accra_ghana.jpg',
    ],
    description:
    'The Kwame Nkrumah Memorial Park & Mausoleum is a state monument built in memory of Ghana\'s first president and pan-African visionary, Osagyefo Dr. Kwame Nkrumah. Located in the heart of Accra, this 5-acre park is the final resting place of Nkrumah and his wife Fathia. The site features a striking fountain, marble statues, and a small museum housing personal artefacts, photographs, and historical documents that trace Nkrumah\'s remarkable life and political career.',
    latitude: 5.5446290099401825,
    longitude: -0.20261654653710098,
    address: 'Nkrumah Avenue, Accra, Greater Accra Region',
    openingTime: '08:00 AM',
    closingTime: '06:00 PM',
    entryFee: 'GHS 40 / ~\$3 USD',
    rating: 4.6,
    distanceKm: 5,
    bestTimeToVisit: 'November – March (dry season)',
    pros: [
      'Rich historical significance',
      'Well-maintained grounds & fountain',
      'Small but fascinating museum',
      'Central location in Accra',
      'Affordable entry fee',
    ],
    cons: [
      'Museum can feel small',
      'Can be crowded on weekends',
      'Limited parking nearby',
    ],
    youtubeVideoId: 'SSEyvuG9FrU',
  ),


  TouristSite(
    id: '2',
    name: 'Labadi Beach',
    region: 'Greater Accra',
    category: 'nature',
    imageUrl:
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Labadi_Beach.jpg/640px-Labadi_Beach.jpg',
    galleryImages: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Labadi_Beach.jpg/640px-Labadi_Beach.jpg',
    ],
    description:
    'Labadi Beach, officially known as La Pleasure Beach, is one of the most popular public beaches in Accra. Stretching along the Atlantic coast, it is famed for its vibrant atmosphere, live music, horse rides, and fresh seafood. Locals and tourists flock here especially on weekends to enjoy the warm ocean breeze, lively drumming sessions, and colourful beach culture that truly embodies the spirit of Accra.',
    latitude: 5.5713,
    longitude: -0.1516,
    address: 'Labadi Rd, La, Accra',
    openingTime: '08:00 AM',
    closingTime: '10:00 PM',
    entryFee: 'GHS 20 / ~\$1.5 USD',
    rating: 4.2,
    distanceKm: 8,
    bestTimeToVisit: 'October – March',
    pros: [
      'Vibrant beach atmosphere',
      'Live music & drumming',
      'Horse & camel rides available',
      'Fresh seafood vendors',
      'Great for families & groups',
    ],
    cons: [
      'Can be very crowded on weekends',
      'Some vendors can be pushy',
      'Water quality varies by season',
    ],
    youtubeVideoId: 'SSEyvuG9FrU',
  ),
  TouristSite(
    id: '3',
    name: 'Cape Coast Castle',
    region: 'Central',
    category: 'artificial',
    imageUrl:
    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Cape_Coast_Castle.jpg/640px-Cape_Coast_Castle.jpg',
    galleryImages: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Cape_Coast_Castle.jpg/640px-Cape_Coast_Castle.jpg',
    ],
    description:
    'Cape Coast Castle is a UNESCO World Heritage Site and one of about forty "slave castles" built on the Gold Coast of West Africa. Originally built by the Swedes in 1653 and later controlled by the British, it served as a holding site for enslaved Africans before they were shipped across the Atlantic. Today it is a powerful museum and memorial, offering guided tours through the infamous "Door of No Return" and dungeons that once held thousands of captives.',
    latitude: 5.1053,
    longitude: -1.2432,
    address: 'Victoria Rd, Cape Coast, Central Region',
    openingTime: '09:00 AM',
    closingTime: '05:00 PM',
    entryFee: 'GHS 80 / ~\$5.5 USD',
    rating: 4.8,
    distanceKm: 145,
    bestTimeToVisit: 'Year-round (avoid heavy rains: Jun–Sep)',
    pros: [
      'UNESCO World Heritage Site',
      'Deeply moving & educational',
      'Excellent guided tours',
      'Stunning ocean views from ramparts',
      'Well-preserved architecture',
    ],
    cons: [
      'Emotionally intense experience',
      '~3 hour drive from Accra',
      'Can be hot inside the dungeons',
      'Tours fill up quickly',
    ],
    youtubeVideoId: 'BhraZLNPSNM',
  ),
  TouristSite(
    id: '4',
    name: 'Kakum National Park',
    region: 'Central',
    category: 'nature',
    imageUrl:
    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Kakum_NP.jpg/640px-Kakum_NP.jpg',
    galleryImages: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Kakum_NP.jpg/640px-Kakum_NP.jpg',
    ],
    description:
    'Kakum National Park is a 375 sq km protected area of tropical rainforest in Ghana\'s Central Region. Its crown jewel is the famous canopy walkway — a series of seven bridges suspended 30 metres above the forest floor, offering a breathtaking bird\'s-eye view of the rainforest canopy. The park is home to forest elephants, bongos, over 400 bird species, and numerous primates, making it a haven for wildlife lovers and birders.',
    latitude: 5.3500,
    longitude: -1.3833,
    address: 'Kakum National Park, Cape Coast, Central Region',
    openingTime: '07:00 AM',
    closingTime: '05:00 PM',
    entryFee: 'GHS 100 / ~\$7 USD (incl. canopy walk)',
    rating: 4.7,
    distanceKm: 150,
    bestTimeToVisit: 'November – March (dry season)',
    pros: [
      'Unique suspended canopy walkway',
      'Over 400 bird species',
      'Diverse wildlife including elephants',
      'Knowledgeable guides available',
      'Educational & adventurous',
    ],
    cons: [
      'Canopy walk not for the faint-hearted',
      'Best wildlife sightings are early morning',
      'Roads can be rough in rainy season',
    ],
    youtubeVideoId: 'Y5HbJq-_xh4',
  ),
  TouristSite(
    id: '5',
    name: 'Boti Falls',
    region: 'Eastern',
    category: 'nature',
    imageUrl:
    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Boti_Falls.jpg/640px-Boti_Falls.jpg',
    galleryImages: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Boti_Falls.jpg/640px-Boti_Falls.jpg',
    ],
    description:
    'Boti Falls is a stunning twin waterfall located within the Boti Forest Reserve in the Eastern Region of Ghana. The falls flow from two separate streams — a "male" and "female" waterfall — that merge during the rainy season to form a spectacular single cascade. According to local legend, the two falls represent a couple forever united. Surrounded by lush tropical forest and unique umbrella rocks, it is one of Ghana\'s most scenic natural wonders.',
    latitude: 6.6833,
    longitude: -0.1167,
    address: 'Boti, Yilo Krobo District, Eastern Region',
    openingTime: '08:00 AM',
    closingTime: '05:00 PM',
    entryFee: 'GHS 30 / ~\$2 USD',
    rating: 4.4,
    distanceKm: 90,
    bestTimeToVisit: 'July – September (peak flow in rainy season)',
    pros: [
      'Breathtaking twin waterfall',
      'Lush forest surroundings',
      'Interesting local folklore',
      'Unique umbrella rocks nearby',
      'Swimming possible at the base',
    ],
    cons: [
      'Road access can be rough',
      'Falls are weaker in dry season',
      'Limited accommodation nearby',
    ],
    youtubeVideoId: null,
  ),
  TouristSite(
    id: '6',
    name: 'Elmina Castle',
    region: 'Central',
    category: 'artificial',
    imageUrl:
    'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Elmina_Castle.jpg/640px-Elmina_Castle.jpg',
    galleryImages: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Elmina_Castle.jpg/640px-Elmina_Castle.jpg',
    ],
    description:
    'Elmina Castle, also known as St. George\'s Castle, is the oldest European building in sub-Saharan Africa, constructed by the Portuguese in 1482. Designated a UNESCO World Heritage Site, it served as a major hub of the Atlantic slave trade for over three centuries. The castle offers sobering but essential guided tours through its dungeons, the governor\'s quarters, and the harrowing "Door of No Return."',
    latitude: 5.0843,
    longitude: -1.3481,
    address: 'Elmina, Central Region, Ghana',
    openingTime: '09:00 AM',
    closingTime: '05:00 PM',
    entryFee: 'GHS 80 / ~\$5.5 USD',
    rating: 4.7,
    distanceKm: 155,
    bestTimeToVisit: 'November – March',
    pros: [
      'Oldest European building in sub-Saharan Africa',
      'UNESCO World Heritage Site',
      'Powerful historical experience',
      'Scenic coastal location',
      'Excellent guided tours',
    ],
    cons: [
      'Heavy emotional weight of the history',
      'Long drive from Accra',
      'Some areas are very cramped',
    ],
    youtubeVideoId: 'J8hYQFk8uws',
  ),
  TouristSite(
    id: '7',
    name: 'Mole National Park',
    region: 'Savannah',
    category: 'nature',
    imageUrl:
    'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Mole_National_Park.jpg/640px-Mole_National_Park.jpg',
    galleryImages: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Mole_National_Park.jpg/640px-Mole_National_Park.jpg',
    ],
    description:
    'Mole National Park is Ghana\'s largest and most important wildlife sanctuary, covering over 4,840 sq km in the Northern Savannah. It is home to Africa\'s largest population of West African elephants alongside leopards, waterbucks, warthogs, kob antelopes, and over 300 bird species. Walking safaris and jeep safaris are available, and the Mole Motel\'s poolside elephant viewing is one of West Africa\'s most unique experiences.',
    latitude: 9.2600,
    longitude: -1.8549,
    address: 'Mole National Park, Savannah Region, Ghana',
    openingTime: '06:00 AM',
    closingTime: '06:00 PM',
    entryFee: 'GHS 120 / ~\$8 USD',
    rating: 4.6,
    distanceKm: 600,
    bestTimeToVisit: 'December – April (dry season)',
    pros: [
      'Ghana\'s largest wildlife reserve',
      'Walking safaris with rangers',
      'Elephant sightings almost guaranteed',
      'Over 300 bird species',
      'Unique poolside elephant viewing',
    ],
    cons: [
      '~10 hour drive from Accra',
      'Accommodation is very limited',
      'Roads can be rough',
      'Very hot in dry season',
    ],
    youtubeVideoId: 'C29oYSHBMKE',
  ),
  TouristSite(
    id: '8',
    name: 'Larabanga Mosque',
    region: 'Savannah',
    category: 'artificial',
    imageUrl:
    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Larabanga_Mosque.jpg/640px-Larabanga_Mosque.jpg',
    galleryImages: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Larabanga_Mosque.jpg/640px-Larabanga_Mosque.jpg',
    ],
    description:
    'The Larabanga Mosque is one of the oldest mosques in West Africa and Ghana\'s oldest Islamic structure, believed to date back to the 15th century. Built in the Sudanese architectural style using mud and timber, it is often called the "Mecca of West Africa." Located in the village of Larabanga near Mole National Park, it is an active place of worship and a pilgrimage site.',
    latitude: 9.2100,
    longitude: -1.9500,
    address: 'Larabanga, Savannah Region, Ghana',
    openingTime: '09:00 AM',
    closingTime: '05:00 PM',
    entryFee: 'GHS 15 / ~\$1 USD (donation)',
    rating: 4.3,
    distanceKm: 610,
    bestTimeToVisit: 'November – March',
    pros: [
      'One of the oldest mosques in West Africa',
      'Unique Sudanese mud architecture',
      'Deep spiritual & cultural significance',
      'Friendly local community',
      'Often combined with Mole Park visit',
    ],
    cons: [
      'Very remote location',
      'Limited facilities nearby',
      'Non-Muslims may have restricted access',
    ],
    youtubeVideoId: null,
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
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