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


  TouristSite(
    id: '9',
    name: 'Kumasi Cultural Centre',
    region: 'Ashanti',
    category: 'artificial',
    imageUrl:
    'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Fort_Kumasi_and_Millitary_Museum_%2810%29.jpg/1920px-Fort_Kumasi_and_Millitary_Museum_%2810%29.jpg',
    galleryImages: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeshYqMuWClewFSYYnElNQFETsxWk5xwl-Rg&s',
    ],
    description:
    'A center for arts and culture where visitors can see traditional crafts such as kente weaving, wood carving, and pottery.',
    latitude: 9.2100,
    longitude: -1.6242,
    address: 'Kumasi, Ashanti Region, Ghana',
    openingTime: '08:00 AM',
    closingTime: '07:00 PM',
    entryFee: 'GHS 15 / ~\$1 USD (donation)',
    rating: 4.3,
    distanceKm: 610,
    bestTimeToVisit: 'November – December',
    pros: [
      'Promotes local culture and crafts',
      'Opportunity to buy handmade souvenirs',
      'Educational cultural experience'
    ],
    cons: [
      'Some shops may overprice items for tourists'
      'Infrastructure maintenance needs improvement',

    ],
    youtubeVideoId: 'youtu.be/7RHph9VcBNE'
  ),


  TouristSite(
      id: '11',
      name: 'Cape Coast Castle',
      region: 'Central',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/57/Cape_Coast_Castle%2C_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/1/12/Cape_Coast_Castle_Courtyard.jpg',
      ],
      description:
      'Cape Coast Castle is one of the most important historical monuments in Ghana. It was used during the trans-Atlantic slave trade and now serves as a museum and UNESCO World Heritage Site.',
      latitude: 5.1053,
      longitude: -1.2466,
      address: 'Cape Coast, Central Region, Ghana',
      openingTime: '09:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 40 / ~3 USD',
      rating: 4.7,
      distanceKm: 250,
      bestTimeToVisit: 'November – March',
      pros: [
        'Rich historical significance',
        'Educational guided tours',
        'UNESCO World Heritage Site'
      ],
      cons: [
        'Can be emotionally intense for visitors',
        'Crowded during peak tourist seasons'
      ],
      youtubeVideoId: 'dQw4w9WgXcQ'
  ),

  TouristSite(
      id: '12',
      name: 'Elmina Castle',
      region: 'Central',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Elmina_Castle.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/9/9a/Elmina_Castle_view.jpg',
      ],
      description:
      'Elmina Castle is the oldest European building in sub-Saharan Africa. Built by the Portuguese in 1482, it played a major role in the trans-Atlantic slave trade.',
      latitude: 5.0847,
      longitude: -1.3509,
      address: 'Elmina, Central Region, Ghana',
      openingTime: '09:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 40 / ~13 USD',
      rating: 4.7,
      distanceKm: 260,
      bestTimeToVisit: 'November – March',
      pros: [
        'Important historical landmark',
        'Educational museum exhibitions',
        'Beautiful coastal scenery'
      ],
      cons: [
        'Can be crowded',
        'Limited parking space'
      ],
      youtubeVideoId: '9cVQw0hY4gA'
  ),

  TouristSite(
      id: '13',
      name: 'Kakum National Park',
      region: 'Central',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Kakum_Canopy_Walkway.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/2b/Kakum_National_Park_Ghana.jpg',
      ],
      description:
      'Kakum National Park is famous for its canopy walkway suspended high above the rainforest. It protects diverse wildlife, birds, and plant species.',
      latitude: 5.4112,
      longitude: -1.3316,
      address: 'Near Abrafo, Central Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '04:00 PM',
      entryFee: 'GHS 60 / ~5 USD',
      rating: 4.8,
      distanceKm: 270,
      bestTimeToVisit: 'November – April',
      pros: [
        'Unique canopy walkway experience',
        'Rich biodiversity',
        'Great for eco-tourism and hiking'
      ],
      cons: [
        'Can be scary for visitors afraid of heights',
        'Hot and humid weather'
      ],
      youtubeVideoId: 'S9k6U2S5h9A'
  ),

  TouristSite(
      id: '14',
      name: 'Fort St. Jago',
      region: 'Central',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Fort_St_Jago.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/8/89/Fort_Sao_Jago_da_Mina.jpg',
      ],
      description:
      'Fort St. Jago was built by the Portuguese and later controlled by the Dutch. It sits on a hill overlooking Elmina and offers panoramic views of the town.',
      latitude: 5.0880,
      longitude: -1.3490,
      address: 'Elmina, Central Region, Ghana',
      openingTime: '09:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 20 / ~1.5 USD',
      rating: 4.4,
      distanceKm: 260,
      bestTimeToVisit: 'November – March',
      pros: [
        'Beautiful panoramic views',
        'Historical significance',
        'Less crowded than major castles'
      ],
      cons: [
        'Steep walk up the hill',
        'Limited facilities'
      ],
      youtubeVideoId: 'eX7X5Gz6F0E'
  ),

  TouristSite(
      id: '15',
      name: 'Hans Cottage Botel',
      region: 'Central',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/33/Hans_Cottage_Botel.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/8/8e/Hans_Cottage_Botel_lake.jpg',
      ],
      description:
      'Hans Cottage Botel is a popular tourist resort known for its crocodile pond where visitors can safely observe and sometimes touch crocodiles.',
      latitude: 5.2780,
      longitude: -1.0460,
      address: 'Cape Coast–Takoradi Highway, Central Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 30 / ~2 USD',
      rating: 4.3,
      distanceKm: 245,
      bestTimeToVisit: 'November – March',
      pros: [
        'Unique crocodile viewing experience',
        'Restaurant and accommodation available',
        'Good relaxation environment'
      ],
      cons: [
        'Limited activities besides crocodile viewing',
        'Can be crowded during weekends'
      ],
      youtubeVideoId: '5xH7vJxv3dE'
  ),

  TouristSite(
      id: '16',
      name: 'Assin Manso Slave River',
      region: 'Central',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/48/Assin_Manso_Slave_River.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/7/7c/Assin_Manso_memorial.jpg',
      ],
      description:
      'Assin Manso Slave River was the last bathing place for enslaved Africans before they were taken to the coastal slave castles.',
      latitude: 5.4430,
      longitude: -1.0500,
      address: 'Assin Manso, Central Region, Ghana',
      openingTime: '08:30 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 20 / ~1.5 USD',
      rating: 4.5,
      distanceKm: 230,
      bestTimeToVisit: 'November – March',
      pros: [
        'Powerful historical site',
        'Educational for students and tourists',
        'Memorials honoring enslaved Africans'
      ],
      cons: [
        'Emotionally heavy experience',
        'Limited visitor facilities'
      ],
      youtubeVideoId: '9a0f3yF2oYc'
  ),

  TouristSite(
      id: '17',
      name: 'Elmina Fishing Harbour',
      region: 'Central',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4c/Elmina_Fishing_Harbour.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/a/a7/Elmina_fishing_boats.jpg',
      ],
      description:
      'Elmina Fishing Harbour is one of the busiest fishing communities in Ghana where visitors can observe traditional fishing activities.',
      latitude: 5.0860,
      longitude: -1.3470,
      address: 'Elmina, Central Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.2,
      distanceKm: 260,
      bestTimeToVisit: 'Early morning',
      pros: [
        'Authentic local cultural experience',
        'Colorful fishing boats and markets',
        'Great photography location'
      ],
      cons: [
        'Strong fish smell',
        'Crowded and noisy'
      ],
      youtubeVideoId: 'Gk4j4n5Y7nU'
  ),

  TouristSite(
      id: '18',
      name: 'Brenu Beach',
      region: 'Central',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/e/e1/Brenu_Beach_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/b/b3/Brenu_Beach.jpg',
      ],
      description:
      'Brenu Beach is a peaceful beach destination near Elmina known for its long sandy shoreline and relaxing environment.',
      latitude: 5.0600,
      longitude: -1.4300,
      address: 'Brenu Akyinim, Central Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '07:00 PM',
      entryFee: 'GHS 10 / ~1 USD',
      rating: 4.3,
      distanceKm: 265,
      bestTimeToVisit: 'November – April',
      pros: [
        'Quiet and relaxing beach',
        'Beautiful sunset views',
        'Good for picnics and swimming'
      ],
      cons: [
        'Limited facilities',
        'Occasional strong waves'
      ],
      youtubeVideoId: '8M9rF8oY1l4'
  ),

  TouristSite(
      id: '19',
      name: 'Posuban Shrine',
      region: 'Central',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/77/Posuban_Shrine.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/6/6e/Posuban_shrine_elmina.jpg',
      ],
      description:
      'Posuban shrines are colorful monuments built by Asafo warrior groups in coastal towns of the Central Region.',
      latitude: 5.0840,
      longitude: -1.3500,
      address: 'Elmina, Central Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.1,
      distanceKm: 260,
      bestTimeToVisit: 'November – March',
      pros: [
        'Unique traditional architecture',
        'Strong cultural significance',
        'Great for photography'
      ],
      cons: [
        'Small attraction',
        'Limited visitor information'
      ],
      youtubeVideoId: 'F7j3H1x0mQk'
  ),

  TouristSite(
      id: '20',
      name: 'Komenda Fort',
      region: 'Central',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/9/90/Fort_Komenda.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/54/Fort_Komenda_Ghana.jpg',
      ],
      description:
      'Komenda Fort is a historic European fort built in the 17th century during colonial trade along the Gold Coast.',
      latitude: 5.0390,
      longitude: -1.4880,
      address: 'Komenda, Central Region, Ghana',
      openingTime: '09:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 15 / ~1 USD',
      rating: 4.0,
      distanceKm: 270,
      bestTimeToVisit: 'November – March',
      pros: [
        'Historical colonial architecture',
        'Less crowded tourist site',
        'Beautiful ocean views'
      ],
      cons: [
        'Partially ruined structure',
        'Limited maintenance'
      ],
      youtubeVideoId: 'o3Y9Kx1f9pE'
  ),


  TouristSite(
      id: '21',
      name: 'Bui National Park',
      region: 'Bono',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/7f/Bui_National_Park_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/34/Bui_National_Park_elephants.jpg',
      ],
      description:
      'Bui National Park is one of Ghana’s largest wildlife reserves and is known for its population of hippos along the Black Volta River.',
      latitude: 8.2750,
      longitude: -2.2500,
      address: 'Bui National Park, Bono Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 50 / ~4 USD',
      rating: 4.5,
      distanceKm: 120,
      bestTimeToVisit: 'November – April',
      pros: [
        'Rich wildlife including hippos',
        'Beautiful natural landscapes',
        'Good for eco-tourism and safaris'
      ],
      cons: [
        'Limited accommodation nearby',
        'Access roads can be rough'
      ],
      youtubeVideoId: '9a3gGq5Y8m0'
  ),

  TouristSite(
      id: '22',
      name: 'Bui Dam',
      region: 'Bono',
      category: 'artificial',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/84/Bui_Dam_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/31/Bui_Dam_reservoir.jpg',
      ],
      description:
      'Bui Dam is one of the largest hydroelectric dams in Ghana built on the Black Volta River to generate electricity.',
      latitude: 8.2770,
      longitude: -2.2480,
      address: 'Bui, Bono Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free',
      rating: 4.2,
      distanceKm: 125,
      bestTimeToVisit: 'November – March',
      pros: [
        'Important engineering project',
        'Beautiful reservoir scenery',
        'Educational for students'
      ],
      cons: [
        'Restricted access in some areas',
        'Few tourism facilities'
      ],
      youtubeVideoId: '5kH8Q0V1p2E'
  ),

  TouristSite(
      id: '23',
      name: 'Kintampo Waterfalls',
      region: 'Bono',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/64/Kintampo_Waterfalls_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/9/9a/Kintampo_falls_view.jpg',
      ],
      description:
      'Kintampo Waterfalls is one of the most beautiful waterfalls in Ghana, surrounded by forest vegetation and popular for relaxation and tourism.',
      latitude: 8.0560,
      longitude: -1.7280,
      address: 'Kintampo, Bono Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 20 / ~1.5 USD',
      rating: 4.6,
      distanceKm: 140,
      bestTimeToVisit: 'November – April',
      pros: [
        'Beautiful natural waterfall',
        'Good place for relaxation and photography',
        'Cool environment'
      ],
      cons: [
        'Slippery paths during rainy season',
        'Safety supervision sometimes limited'
      ],
      youtubeVideoId: 'nP8Q9uF1J7Y'
  ),

  TouristSite(
      id: '24',
      name: 'Fiema Monkey Sanctuary',
      region: 'Bono',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/0/04/Boabeng_Fiema_Monkey_Sanctuary.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/2f/Boabeng_fiema_monkeys.jpg',
      ],
      description:
      'Boabeng-Fiema Monkey Sanctuary protects sacred monkeys that are revered by the local community and live freely within the forest.',
      latitude: 7.7300,
      longitude: -1.7160,
      address: 'Boabeng-Fiema, Bono Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 30 / ~2 USD',
      rating: 4.5,
      distanceKm: 110,
      bestTimeToVisit: 'November – April',
      pros: [
        'Unique monkey conservation site',
        'Educational cultural experience',
        'Guided forest tours available'
      ],
      cons: [
        'Monkeys may grab food from visitors',
        'Limited accommodation nearby'
      ],
      youtubeVideoId: 'mY8tK2b6F8E'
  ),

  TouristSite(
      id: '25',
      name: 'Sunyani Palace',
      region: 'Bono',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5a/Sunyani_palace.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/1/1a/Sunyani_city_view.jpg',
      ],
      description:
      'Sunyani Palace is the traditional palace of the Sunyani Traditional Council and an important cultural center in the Bono Region.',
      latitude: 7.3390,
      longitude: -2.3260,
      address: 'Sunyani, Bono Region, Ghana',
      openingTime: '09:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free',
      rating: 4.1,
      distanceKm: 5,
      bestTimeToVisit: 'Any time of the year',
      pros: [
        'Important cultural landmark',
        'Good for learning Bono traditions',
        'Located in the regional capital'
      ],
      cons: [
        'Limited tourism activities',
        'Access depends on palace events'
      ],
      youtubeVideoId: 'R7c4X2Yb3nE'
  ),

  TouristSite(
      id: '26',
      name: 'Bono Manso Slave Market',
      region: 'Bono',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Bono_Manso.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/8/8c/Bono_Manso_site.jpg',
      ],
      description:
      'Bono Manso is an ancient town believed to have been a major trading center and slave market during the trans-Saharan trade.',
      latitude: 7.8090,
      longitude: -1.8970,
      address: 'Bono Manso, Bono Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10 / ~1 USD',
      rating: 4.0,
      distanceKm: 90,
      bestTimeToVisit: 'November – March',
      pros: [
        'Important historical trading center',
        'Educational heritage site',
        'Peaceful rural environment'
      ],
      cons: [
        'Few tourism facilities',
        'Limited visitor information'
      ],
      youtubeVideoId: '5yG1W3Hk2mQ'
  ),

  TouristSite(
      id: '27',
      name: 'Kintampo Slave Defence Wall',
      region: 'Bono',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Kintampo_wall.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/1/12/Kintampo_defense_wall.jpg',
      ],
      description:
      'The Kintampo Slave Defence Wall was built by local communities to protect themselves from slave raiders during the slave trade era.',
      latitude: 8.0565,
      longitude: -1.7270,
      address: 'Kintampo, Bono Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10 / ~1 USD',
      rating: 3.9,
      distanceKm: 140,
      bestTimeToVisit: 'November – March',
      pros: [
        'Important historical monument',
        'Educational for history students',
        'Unique defensive architecture'
      ],
      cons: [
        'Partially ruined structure',
        'Limited maintenance'
      ],
      youtubeVideoId: '8J3xK5b7YqA'
  ),

  TouristSite(
      id: '28',
      name: 'Sunyani Coronation Park',
      region: 'Bono',
      category: 'recreational',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/63/Sunyani_coronation_park.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/1/1b/Sunyani_park.jpg',
      ],
      description:
      'Coronation Park is a popular recreational park in Sunyani where cultural festivals, concerts, and public events are held.',
      latitude: 7.3399,
      longitude: -2.3270,
      address: 'Sunyani, Bono Region, Ghana',
      openingTime: '07:00 AM',
      closingTime: '08:00 PM',
      entryFee: 'Free',
      rating: 4.2,
      distanceKm: 4,
      bestTimeToVisit: 'Evenings and weekends',
      pros: [
        'Popular event venue',
        'Relaxation and recreation space',
        'Located in the city center'
      ],
      cons: [
        'Can be crowded during events',
        'Limited tourist facilities'
      ],
      youtubeVideoId: 'U8xP3t2L5QY'
  ),

  TouristSite(
      id: '29',
      name: 'Abesim Sacred Grove',
      region: 'Bono',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/20/Abesim_forest.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/5b/Abesim_grove.jpg',
      ],
      description:
      'Abesim Sacred Grove is a protected forest area with cultural and spiritual importance to the local community.',
      latitude: 7.3450,
      longitude: -2.3540,
      address: 'Abesim, Bono Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 5 / ~0.5 USD',
      rating: 3.8,
      distanceKm: 8,
      bestTimeToVisit: 'November – April',
      pros: [
        'Rich cultural and spiritual heritage',
        'Quiet natural environment',
        'Educational for cultural tourism'
      ],
      cons: [
        'Limited tourism infrastructure',
        'Not widely developed for tourism'
      ],
      youtubeVideoId: 'Y3bP7J2k5gQ'
  ),

  TouristSite(
      id: '30',
      name: 'Fofie Festival Grounds',
      region: 'Bono',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/8b/Fofie_festival.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/58/Fofie_festival_dance.jpg',
      ],
      description:
      'Fofie Festival is an important cultural celebration of the Bono people held annually in Techiman to remember their history and traditions.',
      latitude: 7.5900,
      longitude: -1.9400,
      address: 'Techiman, Bono Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '08:00 PM',
      entryFee: 'Free',
      rating: 4.3,
      distanceKm: 70,
      bestTimeToVisit: 'August (during festival)',
      pros: [
        'Rich cultural celebration',
        'Traditional music and dance',
        'Educational cultural experience'
      ],
      cons: [
        'Only active during festival period',
        'Large crowds during events'
      ],
      youtubeVideoId: '3pK7V2n8YxA'
  ),


  TouristSite(
      id: '31',
      name: 'Tano Boase Sacred Grove',
      region: 'Ahafo',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/63/Tano_Boase_Sacred_Grove.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/36/Tano_Boase_rocks.jpg',
      ],
      description:
      'Tano Boase Sacred Grove is a protected forest and spiritual site believed to be the ancestral home of the Bono people. The area contains caves, ancient trees, and unique rock formations.',
      latitude: 7.3000,
      longitude: -2.3500,
      address: 'Tano Boase, Ahafo Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10 / ~1 USD',
      rating: 4.4,
      distanceKm: 70,
      bestTimeToVisit: 'November – April',
      pros: [
        'Strong cultural and spiritual significance',
        'Beautiful natural environment',
        'Good for hiking and exploration'
      ],
      cons: [
        'Limited tourism infrastructure',
        'Some paths can be difficult to access'
      ],
      youtubeVideoId: '3pK7V2n8YxA'
  ),

  TouristSite(
      id: '32',
      name: 'Mim Timber Market',
      region: 'Ahafo',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/33/Mim_timber_market.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/44/Mim_wood_market.jpg',
      ],
      description:
      'Mim Timber Market is one of the largest timber trading centers in Ghana where visitors can observe wood processing and timber trading.',
      latitude: 7.0620,
      longitude: -2.4750,
      address: 'Mim, Ahafo Region, Ghana',
      openingTime: '07:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.0,
      distanceKm: 55,
      bestTimeToVisit: 'Morning hours',
      pros: [
        'Unique timber industry experience',
        'Educational for students',
        'Important economic activity in the region'
      ],
      cons: [
        'No formal tourist facilities',
        'Dusty environment'
      ],
      youtubeVideoId: '8J3xK5b7YqA'
  ),

  TouristSite(
      id: '33',
      name: 'Kenyasi Mining Site',
      region: 'Ahafo',
      category: 'industrial',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/72/Ahafo_mine.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/2c/Ahafo_gold_mine.jpg',
      ],
      description:
      'The Kenyasi mining site hosts one of Ghana’s largest gold mining operations and plays a key role in the local economy.',
      latitude: 7.0000,
      longitude: -2.6000,
      address: 'Kenyasi, Ahafo Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '04:00 PM',
      entryFee: 'Restricted Access',
      rating: 4.1,
      distanceKm: 60,
      bestTimeToVisit: 'Dry season',
      pros: [
        'Major mining industry site',
        'Educational for geology and mining students',
        'Important economic hub'
      ],
      cons: [
        'Restricted access for visitors',
        'Industrial environment'
      ],
      youtubeVideoId: '5kH8Q0V1p2E'
  ),

  TouristSite(
      id: '34',
      name: 'Hwidiem Market',
      region: 'Ahafo',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/1/11/Ghana_market_scene.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/50/Ghana_traditional_market.jpg',
      ],
      description:
      'Hwidiem Market is a vibrant traditional market where local farmers and traders sell agricultural products and handmade goods.',
      latitude: 6.9700,
      longitude: -2.4300,
      address: 'Hwidiem, Ahafo Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.0,
      distanceKm: 50,
      bestTimeToVisit: 'Market days',
      pros: [
        'Authentic local market experience',
        'Opportunity to buy fresh farm produce',
        'Cultural interaction with locals'
      ],
      cons: [
        'Crowded during peak hours',
        'Limited parking'
      ],
      youtubeVideoId: 'Gk4j4n5Y7nU'
  ),

  TouristSite(
      id: '35',
      name: 'Goaso Traditional Palace',
      region: 'Ahafo',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/20/Ghana_palace.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/6/6b/Ghana_chief_palace.jpg',
      ],
      description:
      'Goaso Traditional Palace is the seat of the Ahafo Traditional Council and an important cultural center in the region.',
      latitude: 6.8000,
      longitude: -2.5200,
      address: 'Goaso, Ahafo Region, Ghana',
      openingTime: '09:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free',
      rating: 4.1,
      distanceKm: 45,
      bestTimeToVisit: 'Festival seasons',
      pros: [
        'Important cultural heritage site',
        'Traditional ceremonies held here',
        'Educational cultural experience'
      ],
      cons: [
        'Limited tourism development',
        'Access may depend on palace activities'
      ],
      youtubeVideoId: 'R7c4X2Yb3nE'
  ),

  TouristSite(
      id: '36',
      name: 'Asumura Forest Reserve',
      region: 'Ahafo',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/8f/Ghana_forest_reserve.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/45/Ghana_rainforest.jpg',
      ],
      description:
      'Asumura Forest Reserve is a protected forest area rich in biodiversity, wildlife, and plant species.',
      latitude: 6.9000,
      longitude: -2.4000,
      address: 'Asumura, Ahafo Region, Ghana',
      openingTime: '07:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10 / ~1 USD',
      rating: 4.2,
      distanceKm: 65,
      bestTimeToVisit: 'November – April',
      pros: [
        'Rich biodiversity',
        'Great for nature walks',
        'Quiet natural environment'
      ],
      cons: [
        'Limited visitor facilities',
        'Access roads may be rough'
      ],
      youtubeVideoId: 'nP8Q9uF1J7Y'
  ),

  TouristSite(
      id: '37',
      name: 'Kukuom Cocoa Farms',
      region: 'Ahafo',
      category: 'agricultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/7b/Cocoa_farm_ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3f/Cocoa_pods_ghana.jpg',
      ],
      description:
      'Kukuom Cocoa Farms offer visitors the opportunity to see how cocoa is grown and harvested, showcasing Ghana’s important cocoa industry.',
      latitude: 6.9500,
      longitude: -2.6500,
      address: 'Kukuom, Ahafo Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 15 / ~1 USD',
      rating: 4.3,
      distanceKm: 80,
      bestTimeToVisit: 'Harvest season',
      pros: [
        'Educational agricultural experience',
        'Learn about cocoa production',
        'Interactive farm tours'
      ],
      cons: [
        'Limited tourism infrastructure',
        'Weather dependent'
      ],
      youtubeVideoId: 'Y3bP7J2k5gQ'
  ),

  TouristSite(
      id: '38',
      name: 'Goaso Market',
      region: 'Ahafo',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/0/02/Ghana_market.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/1/1a/Market_in_ghana.jpg',
      ],
      description:
      'Goaso Market is a busy commercial center where people trade agricultural products, textiles, and household goods.',
      latitude: 6.8000,
      longitude: -2.5200,
      address: 'Goaso, Ahafo Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.0,
      distanceKm: 45,
      bestTimeToVisit: 'Market days',
      pros: [
        'Authentic local trading environment',
        'Wide variety of goods',
        'Cultural experience'
      ],
      cons: [
        'Crowded and noisy',
        'Limited tourist facilities'
      ],
      youtubeVideoId: 'Gk4j4n5Y7nU'
  ),

  TouristSite(
      id: '39',
      name: 'Tano River',
      region: 'Ahafo',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/2f/Tano_river_ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/7/70/Ghana_river_forest.jpg',
      ],
      description:
      'The Tano River flows through several parts of the Ahafo Region and plays an important role in agriculture and local livelihoods.',
      latitude: 6.9000,
      longitude: -2.5000,
      address: 'Tano River Basin, Ahafo Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.1,
      distanceKm: 70,
      bestTimeToVisit: 'November – April',
      pros: [
        'Beautiful natural scenery',
        'Important cultural and environmental resource',
        'Good for relaxation and photography'
      ],
      cons: [
        'Limited tourism infrastructure',
        'Seasonal flooding in rainy season'
      ],
      youtubeVideoId: '8M9rF8oY1l4'
  ),

  TouristSite(
      id: '40',
      name: 'Ahafo Cultural Festival Grounds',
      region: 'Ahafo',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Ghana_festival.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/8/8a/Ghana_traditional_dance.jpg',
      ],
      description:
      'The Ahafo Cultural Festival Grounds host traditional festivals, music, dance performances, and community celebrations.',
      latitude: 6.8100,
      longitude: -2.5200,
      address: 'Goaso, Ahafo Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '08:00 PM',
      entryFee: 'Free',
      rating: 4.2,
      distanceKm: 45,
      bestTimeToVisit: 'Festival seasons',
      pros: [
        'Vibrant cultural celebrations',
        'Traditional music and dance',
        'Community gatherings'
      ],
      cons: [
        'Only active during events',
        'Large crowds during festivals'
      ],
      youtubeVideoId: '3pK7V2n8YxA'
  ),

  TouristSite(
      id: '41',
      name: 'Tano Boase Sacred Grove',
      region: 'Ahafo',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/2a/Tanoboase_Sacred_Grove.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/2a/Tanoboase_Sacred_Grove.jpg',
      ],
      description:
      'Tano Boase Sacred Grove is a spiritual and historical site associated with early Bono civilization and traditional worship.',
      latitude: 7.6400,
      longitude: -1.8800,
      address: 'Tanoboase, near Goaso, Ahafo Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10',
      rating: 4.5,
      distanceKm: 60,
      bestTimeToVisit: 'November – March',
      pros: [
        'Strong cultural heritage',
        'Peaceful forest environment',
        'Educational historical site'
      ],
      cons: [
        'Limited tourist facilities',
        'Requires local guide for full experience'
      ],
      youtubeVideoId: 'QYqzT4v1QJg'
  ),

  TouristSite(
      id: '42',
      name: 'Tano River',
      region: 'Ahafo',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Tano_River_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/6/6f/Tano_River_Ghana.jpg',
      ],
      description:
      'The Tano River is one of Ghana’s major rivers and holds strong cultural significance among local communities.',
      latitude: 6.8700,
      longitude: -2.4800,
      address: 'Near Goaso, Ahafo Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.1,
      distanceKm: 50,
      bestTimeToVisit: 'November – April',
      pros: [
        'Beautiful river scenery',
        'Important cultural heritage',
        'Ideal for photography'
      ],
      cons: [
        'Limited tourist facilities',
        'Access roads may be rough'
      ],
      youtubeVideoId: '3V1bM0pR1vU'
  ),

  TouristSite(
      id: '43',
      name: 'Goaso Traditional Palace',
      region: 'Ahafo',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/7e/Ghana_traditional_palace.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/7/7e/Ghana_traditional_palace.jpg',
      ],
      description:
      'The Goaso Traditional Palace is the seat of the Ahafo traditional authority and an important center for culture and heritage.',
      latitude: 6.8105,
      longitude: -2.5205,
      address: 'Goaso, Ahafo Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free',
      rating: 4.0,
      distanceKm: 45,
      bestTimeToVisit: 'During traditional festivals',
      pros: [
        'Rich traditional heritage',
        'Educational cultural experience',
        'Important community landmark'
      ],
      cons: [
        'Limited visitor activities',
        'Access may depend on palace events'
      ],
      youtubeVideoId: 'T4sP3F4gVQ0'
  ),

  TouristSite(
      id: '44',
      name: 'Asutifi Rock Formations',
      region: 'Ahafo',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5d/Ghana_rock_formations.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/5d/Ghana_rock_formations.jpg',
      ],
      description:
      'The Asutifi rock formations are unique geological structures that attract visitors interested in nature and hiking.',
      latitude: 6.9000,
      longitude: -2.3000,
      address: 'Asutifi District, Ahafo Region, Ghana',
      openingTime: '07:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.1,
      distanceKm: 70,
      bestTimeToVisit: 'November – April',
      pros: [
        'Great for hiking and exploration',
        'Beautiful rock landscape',
        'Quiet natural environment'
      ],
      cons: [
        'Limited tourist infrastructure',
        'Requires guide for some trails'
      ],
      youtubeVideoId: 'gZ4A2sY9kPw'
  ),

  TouristSite(
      id: '45',
      name: 'Ahafo Forest Reserve',
      region: 'Ahafo',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3c/Ghana_forest_reserve.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3c/Ghana_forest_reserve.jpg',
      ],
      description:
      'Ahafo Forest Reserve is a protected forest area with rich biodiversity and opportunities for eco-tourism.',
      latitude: 6.9500,
      longitude: -2.4200,
      address: 'Ahafo Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 10',
      rating: 4.3,
      distanceKm: 80,
      bestTimeToVisit: 'November – March',
      pros: [
        'Rich biodiversity',
        'Great for eco-tourism',
        'Cool forest environment'
      ],
      cons: [
        'Limited visitor facilities',
        'Some areas difficult to access'
      ],
      youtubeVideoId: 'k4QdXr5pL2A'
  ),

  TouristSite(
      id: '46',
      name: 'Goaso Central Market',
      region: 'Ahafo',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/27/Ghana_market_scene.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/27/Ghana_market_scene.jpg',
      ],
      description:
      'Goaso Central Market is a busy commercial center where visitors can experience the daily life, food, and trade culture of the Ahafo people.',
      latitude: 6.8110,
      longitude: -2.5190,
      address: 'Goaso, Ahafo Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '07:00 PM',
      entryFee: 'Free',
      rating: 4.0,
      distanceKm: 44,
      bestTimeToVisit: 'Morning hours',
      pros: [
        'Experience local culture',
        'Variety of local foods and crafts',
        'Vibrant market atmosphere'
      ],
      cons: [
        'Can be crowded',
        'Parking may be limited'
      ],
      youtubeVideoId: 'V8nQ9o6sKJc'
  ),

  TouristSite(
      id: '47',
      name: 'Hwidiem Cultural Center',
      region: 'Ahafo',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/8a/Ghana_traditional_dance.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/8/8a/Ghana_traditional_dance.jpg',
      ],
      description:
      'Hwidiem Cultural Center promotes local traditions, storytelling, dance, and crafts of the Ahafo people.',
      latitude: 6.7400,
      longitude: -2.3100,
      address: 'Hwidiem, Ahafo Region, Ghana',
      openingTime: '09:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 5',
      rating: 4.1,
      distanceKm: 65,
      bestTimeToVisit: 'During cultural events',
      pros: [
        'Promotes local traditions',
        'Educational for visitors',
        'Cultural performances'
      ],
      cons: [
        'Events not held daily',
        'Limited seating space'
      ],
      youtubeVideoId: 'm6Y8VZr1o7A'
  ),

  TouristSite(
      id: '48',
      name: 'Kenyasi Mining Heritage Site',
      region: 'Ahafo',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/50/Gold_mining_site.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/50/Gold_mining_site.jpg',
      ],
      description:
      'The Kenyasi mining area highlights the region’s importance in Ghana’s gold mining history and economic development.',
      latitude: 6.9400,
      longitude: -2.3300,
      address: 'Kenyasi, Ahafo Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free',
      rating: 3.9,
      distanceKm: 75,
      bestTimeToVisit: 'November – April',
      pros: [
        'Educational mining history',
        'Important economic landmark',
        'Unique industrial landscape'
      ],
      cons: [
        'Limited tourist infrastructure',
        'Some areas restricted'
      ],
      youtubeVideoId: '8y7pQF0Xy0I'
  ),

  TouristSite(
      id: '49',
      name: 'Ahafo Hills Scenic Area',
      region: 'Ahafo',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/66/Ghana_hills_landscape.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/6/66/Ghana_hills_landscape.jpg',
      ],
      description:
      'The Ahafo Hills Scenic Area provides breathtaking landscapes and viewpoints ideal for nature lovers and hikers.',
      latitude: 6.8800,
      longitude: -2.4600,
      address: 'Ahafo Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.3,
      distanceKm: 70,
      bestTimeToVisit: 'November – March',
      pros: [
        'Beautiful scenic views',
        'Great hiking experience',
        'Peaceful natural environment'
      ],
      cons: [
        'Limited visitor facilities',
        'Access roads may be rough'
      ],
      youtubeVideoId: 'S0m2P5eVYbE'
  ),

  TouristSite(
      id: '50',
      name: 'Ahafo Heritage Museum',
      region: 'Ahafo',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Ghana_museum_artifacts.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4a/Ghana_museum_artifacts.jpg',
      ],
      description:
      'The Ahafo Heritage Museum preserves artifacts, traditional objects, and historical records of the Ahafo people.',
      latitude: 6.8120,
      longitude: -2.5210,
      address: 'Goaso, Ahafo Region, Ghana',
      openingTime: '09:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 5',
      rating: 4.2,
      distanceKm: 45,
      bestTimeToVisit: 'All year round',
      pros: [
        'Educational historical exhibits',
        'Promotes local culture',
        'Great for students and researchers'
      ],
      cons: [
        'Small museum',
        'Limited artifacts compared to national museums'
      ],
      youtubeVideoId: 'Jd9W2y5oR1U'
  ),

  TouristSite(
      id: '51',
      name: 'Boti Falls',
      region: 'Eastern',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4e/Boti_Falls_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4e/Boti_Falls_Ghana.jpg',
      ],
      description:
      'Boti Falls is one of the most famous waterfalls in Ghana, consisting of twin waterfalls known as male and female falls.',
      latitude: 6.1667,
      longitude: -0.3000,
      address: 'Boti, Yilo Krobo District, Eastern Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 20',
      rating: 4.7,
      distanceKm: 90,
      bestTimeToVisit: 'June – August',
      pros: [
        'Beautiful twin waterfalls',
        'Good hiking experience',
        'Popular tourist attraction'
      ],
      cons: [
        'Long staircase access',
        'Crowded during holidays'
      ],
      youtubeVideoId: '1c6v5rY2A6E'
  ),

  TouristSite(
      id: '52',
      name: 'Umbrella Rock',
      region: 'Eastern',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/9/98/Umbrella_Rock_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/9/98/Umbrella_Rock_Ghana.jpg',
      ],
      description:
      'Umbrella Rock is a unique rock formation shaped like an umbrella located near Boti Falls.',
      latitude: 6.1680,
      longitude: -0.3050,
      address: 'Near Boti Falls, Eastern Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 20',
      rating: 4.6,
      distanceKm: 92,
      bestTimeToVisit: 'June – August',
      pros: [
        'Unique natural rock formation',
        'Great photography spot',
        'Adventure hiking trail'
      ],
      cons: [
        'Steep hiking path',
        'Limited visitor facilities'
      ],
      youtubeVideoId: 'P2fT3L1zQdA'
  ),

  TouristSite(
      id: '53',
      name: 'Aburi Botanical Gardens',
      region: 'Eastern',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6e/Aburi_Botanical_Gardens.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/6/6e/Aburi_Botanical_Gardens.jpg',
      ],
      description:
      'Aburi Botanical Gardens is a peaceful garden with a wide variety of tropical plants and historic colonial trees.',
      latitude: 5.8480,
      longitude: -0.1740,
      address: 'Aburi, Eastern Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 10',
      rating: 4.6,
      distanceKm: 70,
      bestTimeToVisit: 'All year round',
      pros: [
        'Beautiful gardens',
        'Great picnic location',
        'Educational plant species'
      ],
      cons: [
        'Some areas need maintenance',
        'Busy during weekends'
      ],
      youtubeVideoId: 'tXyX3P6R6sA'
  ),

  TouristSite(
      id: '54',
      name: 'Akaa Falls',
      region: 'Eastern',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Akaa_Falls_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/5f/Akaa_Falls_Ghana.jpg',
      ],
      description:
      'Akaa Falls is a scenic waterfall near Boti Falls known for its quiet and less crowded environment.',
      latitude: 6.1600,
      longitude: -0.3100,
      address: 'Near Boti, Eastern Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10',
      rating: 4.3,
      distanceKm: 95,
      bestTimeToVisit: 'June – August',
      pros: [
        'Peaceful environment',
        'Beautiful waterfall scenery',
        'Less crowded than Boti Falls'
      ],
      cons: [
        'Limited facilities',
        'Road access may be rough'
      ],
      youtubeVideoId: '5Fh7bZxV3pA'
  ),

  TouristSite(
      id: '55',
      name: 'Okomfo Anokye Sword Site',
      region: 'Eastern',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4c/Okomfo_Anokye_sword.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4c/Okomfo_Anokye_sword.jpg',
      ],
      description:
      'The Okomfo Anokye Sword Site marks the historic location where the legendary priest planted a sword that cannot be removed.',
      latitude: 6.6880,
      longitude: -0.2750,
      address: 'Awukugua, Eastern Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 5',
      rating: 4.2,
      distanceKm: 100,
      bestTimeToVisit: 'All year round',
      pros: [
        'Important historical landmark',
        'Strong cultural heritage',
        'Educational experience'
      ],
      cons: [
        'Small tourist site',
        'Limited visitor facilities'
      ],
      youtubeVideoId: '9o2p1kW1Q9g'
  ),

  TouristSite(
      id: '56',
      name: 'Tetteh Quarshie Cocoa Farm',
      region: 'Eastern',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/2f/Tetteh_Quarshie_Cocoa_Farm.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/2f/Tetteh_Quarshie_Cocoa_Farm.jpg',
      ],
      description:
      'This is the historic cocoa farm where Tetteh Quarshie first introduced cocoa into Ghana.',
      latitude: 5.9400,
      longitude: -0.0900,
      address: 'Mampong-Akuapem, Eastern Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 20',
      rating: 4.5,
      distanceKm: 65,
      bestTimeToVisit: 'All year round',
      pros: [
        'Important agricultural history',
        'Educational cocoa tours',
        'Good for students'
      ],
      cons: [
        'Small site',
        'Limited tourist facilities'
      ],
      youtubeVideoId: 'y0xTn5GdFvE'
  ),

  TouristSite(
      id: '57',
      name: 'Akosombo Dam',
      region: 'Eastern',
      category: 'artificial',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Akosombo_Dam.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/0/0c/Akosombo_Dam.jpg',
      ],
      description:
      'Akosombo Dam is a major hydroelectric dam on the Volta River that created Lake Volta, the largest man-made lake in the world.',
      latitude: 6.3010,
      longitude: 0.0580,
      address: 'Akosombo, Eastern Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free',
      rating: 4.5,
      distanceKm: 120,
      bestTimeToVisit: 'November – March',
      pros: [
        'Major engineering landmark',
        'Beautiful lake scenery',
        'Educational tours available'
      ],
      cons: [
        'Restricted areas',
        'Limited public access zones'
      ],
      youtubeVideoId: 'hY7d2wK2c0E'
  ),

  TouristSite(
      id: '58',
      name: 'Mount Afadja Viewpoints',
      region: 'Eastern',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6a/Mount_Afadja.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/6/6a/Mount_Afadja.jpg',
      ],
      description:
      'The mountain viewpoints around the Akuapem range provide breathtaking scenery and hiking opportunities.',
      latitude: 5.9000,
      longitude: -0.1800,
      address: 'Akuapem Hills, Eastern Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.4,
      distanceKm: 85,
      bestTimeToVisit: 'November – March',
      pros: [
        'Great hiking experience',
        'Beautiful mountain views',
        'Cool weather environment'
      ],
      cons: [
        'Steep hiking trails',
        'Limited visitor services'
      ],
      youtubeVideoId: '6XqH9m5n4dQ'
  ),

  TouristSite(
      id: '59',
      name: 'Aburi Craft Village',
      region: 'Eastern',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Ghana_craft_market.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4f/Ghana_craft_market.jpg',
      ],
      description:
      'Aburi Craft Village is a cultural marketplace where visitors can buy handmade crafts such as beads, carvings, and kente.',
      latitude: 5.8450,
      longitude: -0.1700,
      address: 'Aburi, Eastern Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.2,
      distanceKm: 70,
      bestTimeToVisit: 'All year round',
      pros: [
        'Local handmade crafts',
        'Supports local artisans',
        'Great souvenir shopping'
      ],
      cons: [
        'Prices may be higher for tourists',
        'Crowded on weekends'
      ],
      youtubeVideoId: 'gF0gk3F9tR0'
  ),

  TouristSite(
      id: '60',
      name: 'Nsutapong Waterfall',
      region: 'Eastern',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Ghana_waterfall.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/7/7c/Ghana_waterfall.jpg',
      ],
      description:
      'Nsutapong Waterfall is a hidden waterfall surrounded by forest vegetation in the Eastern Region.',
      latitude: 6.1500,
      longitude: -0.3400,
      address: 'Nsutapong, Eastern Region, Ghana',
      openingTime: '07:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10',
      rating: 4.1,
      distanceKm: 100,
      bestTimeToVisit: 'June – August',
      pros: [
        'Peaceful natural location',
        'Beautiful waterfall scenery',
        'Less crowded tourist site'
      ],
      cons: [
        'Limited road access',
        'Few visitor facilities'
      ],
      youtubeVideoId: '4R1mVt0pXQ8'
  ),

  TouristSite(
      id: '61',
      name: 'Gbele Resource Reserve',
      region: 'North East',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Gbele_Reserve.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4f/Gbele_Reserve.jpg',
      ],
      description:
      'Gbele Resource Reserve is a wildlife conservation area known for antelopes, birds, and savannah vegetation.',
      latitude: 10.7000,
      longitude: -2.5000,
      address: 'Near Tumu, North East Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 20',
      rating: 4.3,
      distanceKm: 450,
      bestTimeToVisit: 'November – March',
      pros: [
        'Rich wildlife and bird species',
        'Good for eco-tourism',
        'Peaceful natural environment'
      ],
      cons: [
        'Remote location',
        'Limited tourist facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '62',
      name: 'Nalerigu Slave Defence Wall',
      region: 'North East',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Nalerigu_wall.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/6/6f/Nalerigu_wall.jpg',
      ],
      description:
      'The Nalerigu Slave Defence Wall was built to protect communities from slave raiders during pre-colonial times.',
      latitude: 10.5250,
      longitude: -0.3690,
      address: 'Nalerigu, North East Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 5',
      rating: 4.2,
      distanceKm: 420,
      bestTimeToVisit: 'November – March',
      pros: [
        'Important historical site',
        'Educational for students',
        'Cultural heritage landmark'
      ],
      cons: [
        'Partially ruined structure',
        'Limited visitor information'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '63',
      name: 'Nakpanduri Scarp',
      region: 'North East',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Nakpanduri_scarp.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3a/Nakpanduri_scarp.jpg',
      ],
      description:
      'Nakpanduri Scarp offers breathtaking views of valleys and is one of the most scenic spots in northern Ghana.',
      latitude: 10.8200,
      longitude: -0.1300,
      address: 'Nakpanduri, North East Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.6,
      distanceKm: 430,
      bestTimeToVisit: 'November – March',
      pros: [
        'Amazing panoramic views',
        'Great for photography',
        'Cool breeze and relaxing environment'
      ],
      cons: [
        'Difficult access road',
        'No major facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '64',
      name: 'Zabzugu Cultural Site',
      region: 'North East',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/2f/Ghana_cultural_dance.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/2f/Ghana_cultural_dance.jpg',
      ],
      description:
      'Zabzugu Cultural Site showcases traditional dances, festivals, and the culture of the Dagomba people.',
      latitude: 9.7150,
      longitude: -0.1750,
      address: 'Zabzugu, North East Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.1,
      distanceKm: 380,
      bestTimeToVisit: 'Festival seasons',
      pros: [
        'Rich cultural performances',
        'Traditional music and dance',
        'Community experience'
      ],
      cons: [
        'Only active during events',
        'Limited tourist infrastructure'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '65',
      name: 'Wenchiki Forest Reserve',
      region: 'North East',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Ghana_forest.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/5c/Ghana_forest.jpg',
      ],
      description:
      'Wenchiki Forest Reserve is a protected area with diverse flora and fauna in the savannah zone.',
      latitude: 10.4500,
      longitude: -0.3000,
      address: 'Wenchiki, North East Region, Ghana',
      openingTime: '07:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10',
      rating: 4.0,
      distanceKm: 410,
      bestTimeToVisit: 'November – March',
      pros: [
        'Good for nature lovers',
        'Bird watching opportunities',
        'Peaceful environment'
      ],
      cons: [
        'Limited accessibility',
        'Few tourist facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '66',
      name: 'Bunkpurugu Cultural Grounds',
      region: 'North East',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Ghana_festival.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/1/1f/Ghana_festival.jpg',
      ],
      description:
      'Bunkpurugu Cultural Grounds host traditional festivals and community celebrations of the Mamprusi people.',
      latitude: 10.2500,
      longitude: -0.3400,
      address: 'Bunkpurugu, North East Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '08:00 PM',
      entryFee: 'Free',
      rating: 4.2,
      distanceKm: 390,
      bestTimeToVisit: 'Festival season',
      pros: [
        'Vibrant cultural festivals',
        'Traditional drumming and dancing',
        'Community participation'
      ],
      cons: [
        'Only active during festivals',
        'Large crowds during events'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '67',
      name: 'Yunyoo Rock Formations',
      region: 'North East',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Ghana_rocks.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4a/Ghana_rocks.jpg',
      ],
      description:
      'Yunyoo Rock Formations are natural stone structures that attract hikers and adventure tourists.',
      latitude: 10.4000,
      longitude: -0.5000,
      address: 'Yunyoo, North East Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.0,
      distanceKm: 420,
      bestTimeToVisit: 'November – March',
      pros: [
        'Great hiking experience',
        'Unique rock formations',
        'Quiet natural environment'
      ],
      cons: [
        'No visitor facilities',
        'Difficult terrain'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '68',
      name: 'Walewale Market',
      region: 'North East',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/27/Ghana_market.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/27/Ghana_market.jpg',
      ],
      description:
      'Walewale Market is a major trading center where agricultural goods and livestock are sold.',
      latitude: 10.3500,
      longitude: -0.8000,
      address: 'Walewale, North East Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.1,
      distanceKm: 360,
      bestTimeToVisit: 'Market days',
      pros: [
        'Authentic local trading experience',
        'Wide variety of goods',
        'Cultural interaction'
      ],
      cons: [
        'Very crowded',
        'Noisy environment'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '69',
      name: 'Tamale–Bolgatanga Savannah Plains View',
      region: 'North East',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6a/Savannah_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/6/6a/Savannah_Ghana.jpg',
      ],
      description:
      'The savannah plains offer wide landscapes, wildlife sightings, and scenic views typical of northern Ghana.',
      latitude: 10.6000,
      longitude: -0.4500,
      address: 'North East Savannah Zone, Ghana',
      openingTime: 'Any time',
      closingTime: 'Any time',
      entryFee: 'Free',
      rating: 4.3,
      distanceKm: 400,
      bestTimeToVisit: 'November – March',
      pros: [
        'Wide scenic landscapes',
        'Great photography location',
        'Peaceful environment'
      ],
      cons: [
        'Hot weather conditions',
        'No facilities nearby'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '70',
      name: 'Gambaga Escarpment',
      region: 'North East',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Gambaga_escarpment.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/9/9b/Gambaga_escarpment.jpg',
      ],
      description:
      'The Gambaga Escarpment is a dramatic cliff landscape offering scenic views and historical significance.',
      latitude: 10.5300,
      longitude: -0.3800,
      address: 'Gambaga, North East Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.4,
      distanceKm: 415,
      bestTimeToVisit: 'November – March',
      pros: [
        'Stunning cliff views',
        'Great for hiking',
        'Natural beauty'
      ],
      cons: [
        'Dangerous edges if careless',
        'No safety barriers in some areas'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '71',
      name: 'Mole National Park',
      region: 'Northern',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Mole_National_Park_Elephants.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/5f/Mole_National_Park_Elephants.jpg',
      ],
      description:
      'Mole National Park is the largest wildlife park in Ghana, known for elephants, antelopes, and rich savannah biodiversity.',
      latitude: 9.7850,
      longitude: -1.6660,
      address: 'Damongo, Northern Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 40',
      rating: 4.7,
      distanceKm: 380,
      bestTimeToVisit: 'November – March',
      pros: [
        'Large wildlife population',
        'Safari experience',
        'Great for photography'
      ],
      cons: [
        'Long travel distance',
        'Accommodation inside park is limited'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '72',
      name: 'Larabanga Mosque',
      region: 'Northern',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Larabanga_Mosque_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3a/Larabanga_Mosque_Ghana.jpg',
      ],
      description:
      'Larabanga Mosque is the oldest mosque in Ghana and one of the oldest in West Africa, built in Sudano-Sahelian architecture.',
      latitude: 9.5500,
      longitude: -1.7870,
      address: 'Larabanga, Northern Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free (donations)',
      rating: 4.6,
      distanceKm: 370,
      bestTimeToVisit: 'All year round',
      pros: [
        'Rich Islamic history',
        'Unique architecture',
        'Cultural significance'
      ],
      cons: [
        'Strict dress code',
        'Limited visitor facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '73',
      name: 'Mystic Stone (Larabanga)',
      region: 'Northern',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6a/Mystic_Stone_Larabanga.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/6/6a/Mystic_Stone_Larabanga.jpg',
      ],
      description:
      'The Mystic Stone is a sacred rock that played a role in the founding history of Larabanga.',
      latitude: 9.5530,
      longitude: -1.7850,
      address: 'Larabanga, Northern Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free',
      rating: 4.3,
      distanceKm: 370,
      bestTimeToVisit: 'All year round',
      pros: [
        'Spiritual significance',
        'Historical importance',
        'Near Larabanga Mosque'
      ],
      cons: [
        'Small site',
        'Limited interpretation signage'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '74',
      name: 'Tamale Cultural Centre',
      region: 'Northern',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Tamale_Cultural_Centre.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/1/1f/Tamale_Cultural_Centre.jpg',
      ],
      description:
      'The Tamale Cultural Centre hosts traditional dances, art exhibitions, and cultural performances of northern Ghana.',
      latitude: 9.4040,
      longitude: -0.8420,
      address: 'Tamale, Northern Region, Ghana',
      openingTime: '09:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 10',
      rating: 4.2,
      distanceKm: 320,
      bestTimeToVisit: 'Festival seasons',
      pros: [
        'Cultural performances',
        'Local crafts and arts',
        'Educational experience'
      ],
      cons: [
        'Activities not daily',
        'Limited maintenance'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '75',
      name: 'Sagnarigu Craft Market',
      region: 'Northern',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/27/Ghana_market.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/27/Ghana_market.jpg',
      ],
      description:
      'Sagnarigu Craft Market is a vibrant place where local artisans sell pottery, baskets, and traditional crafts.',
      latitude: 9.4300,
      longitude: -0.8500,
      address: 'Sagnarigu, Tamale, Northern Region, Ghana',
      openingTime: '07:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.0,
      distanceKm: 318,
      bestTimeToVisit: 'Morning hours',
      pros: [
        'Local handmade crafts',
        'Cultural interaction',
        'Affordable souvenirs'
      ],
      cons: [
        'Can be crowded',
        'Price bargaining required'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '76',
      name: 'Salaga Slave Market Site',
      region: 'Northern',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Salaga_slave_market.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4f/Salaga_slave_market.jpg',
      ],
      description:
      'Salaga was one of the major slave trading centers in West Africa during the trans-Saharan and trans-Atlantic slave trade.',
      latitude: 8.5500,
      longitude: -0.5170,
      address: 'Salaga, Northern Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 5',
      rating: 4.5,
      distanceKm: 260,
      bestTimeToVisit: 'All year round',
      pros: [
        'Deep historical significance',
        'Educational tours',
        'Important heritage site'
      ],
      cons: [
        'Limited preservation structures',
        'Remote location'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '77',
      name: 'Zayaa Mosque (Witch Mosque)',
      region: 'Northern',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3c/Zayaa_Mosque.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3c/Zayaa_Mosque.jpg',
      ],
      description:
      'Zayaa Mosque, also called the Witch Mosque, is a unique historical structure surrounded by local legends.',
      latitude: 9.1600,
      longitude: -0.8510,
      address: 'Wulugu, Northern Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free',
      rating: 4.3,
      distanceKm: 300,
      bestTimeToVisit: 'All year round',
      pros: [
        'Unique architecture',
        'Interesting local legends',
        'Cultural importance'
      ],
      cons: [
        'Small site',
        'Limited tourism facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '78',
      name: 'Gurugu Hills',
      region: 'Northern',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Gurugu_Hills.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/5c/Gurugu_Hills.jpg',
      ],
      description:
      'Gurugu Hills offer panoramic views of Tamale and surrounding savannah landscapes.',
      latitude: 9.4200,
      longitude: -0.8400,
      address: 'Tamale, Northern Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.4,
      distanceKm: 315,
      bestTimeToVisit: 'November – March',
      pros: [
        'Great sunset views',
        'Hiking opportunity',
        'Cool evening breeze'
      ],
      cons: [
        'No safety barriers',
        'Limited facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '79',
      name: 'Mognori Eco Village',
      region: 'Northern',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Mognori_Eco_Village.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/7/7a/Mognori_Eco_Village.jpg',
      ],
      description:
      'Mognori Eco Village offers canoe rides, batik making, and eco-tourism experiences near Mole National Park.',
      latitude: 9.7500,
      longitude: -1.7000,
      address: 'Near Mole National Park, Northern Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 25',
      rating: 4.6,
      distanceKm: 385,
      bestTimeToVisit: 'November – March',
      pros: [
        'Eco-tourism activities',
        'Cultural immersion',
        'Great nature experience'
      ],
      cons: [
        'Remote location',
        'Limited accommodation'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '80',
      name: 'Daboya Salt Mining Site',
      region: 'Northern',
      category: 'industrial',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Daboya_salt_site.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/6/6f/Daboya_salt_site.jpg',
      ],
      description:
      'Daboya is known for traditional salt mining and weaving, contributing to local economy and culture.',
      latitude: 9.6500,
      longitude: -1.6000,
      address: 'Daboya, Northern Region, Ghana',
      openingTime: '07:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free',
      rating: 4.1,
      distanceKm: 340,
      bestTimeToVisit: 'All year round',
      pros: [
        'Traditional salt mining',
        'Cultural weaving industry',
        'Educational experience'
      ],
      cons: [
        'Industrial environment',
        'Limited tourist facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '81',
      name: 'Kyabobo National Park',
      region: 'Oti',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Kyabobo_National_Park.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/6/6b/Kyabobo_National_Park.jpg',
      ],
      description:
      'Kyabobo National Park is a mountainous wildlife park known for hiking trails, scenic landscapes, and diverse flora and fauna.',
      latitude: 8.3500,
      longitude: 0.6000,
      address: 'Jasikan District, Oti Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 30',
      rating: 4.6,
      distanceKm: 500,
      bestTimeToVisit: 'November – March',
      pros: [
        'Great hiking experience',
        'Rich biodiversity',
        'Beautiful mountain views'
      ],
      cons: [
        'Remote location',
        'Limited accommodation'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '82',
      name: 'Wli Waterfalls (Upper Access via Oti Route)',
      region: 'Oti',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Wli_Waterfalls.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3a/Wli_Waterfalls.jpg',
      ],
      description:
      'Wli Waterfalls is the highest waterfall in West Africa, surrounded by lush forest and wildlife.',
      latitude: 7.1330,
      longitude: 0.5670,
      address: 'Near Hohoe access route, Oti Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 20',
      rating: 4.8,
      distanceKm: 420,
      bestTimeToVisit: 'May – October',
      pros: [
        'Tallest waterfall in West Africa',
        'Beautiful forest scenery',
        'Great hiking experience'
      ],
      cons: [
        'Long walk to base',
        'Can be slippery during rainy season'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '83',
      name: 'Shiare Mountain Settlement',
      region: 'Oti',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/2b/Shiare_Mountain_Village.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/2b/Shiare_Mountain_Village.jpg',
      ],
      description:
      'Shiare is a mountain-top settlement known for its unique lifestyle and breathtaking views of surrounding valleys.',
      latitude: 7.8500,
      longitude: 0.6500,
      address: 'Jasikan District, Oti Region, Ghana',
      openingTime: '07:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.5,
      distanceKm: 510,
      bestTimeToVisit: 'November – March',
      pros: [
        'Unique mountain community',
        'Amazing scenic views',
        'Cultural experience'
      ],
      cons: [
        'Difficult access road',
        'No major facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '84',
      name: 'Amedzofe Forest Trail Extension (Oti Access)',
      region: 'Oti',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Ghana_forest_trail.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/5e/Ghana_forest_trail.jpg',
      ],
      description:
      'This forest trail connects eco-tourism routes through Oti’s lush greenery and mountain landscape.',
      latitude: 7.9000,
      longitude: 0.5500,
      address: 'Oti forest belt, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 10',
      rating: 4.4,
      distanceKm: 480,
      bestTimeToVisit: 'November – March',
      pros: [
        'Great hiking trails',
        'Rich forest biodiversity',
        'Peaceful environment'
      ],
      cons: [
        'Limited signage',
        'Requires guide'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '85',
      name: 'Nkwanta Cultural Grounds',
      region: 'Oti',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Ghana_cultural_festival.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4f/Ghana_cultural_festival.jpg',
      ],
      description:
      'Nkwanta Cultural Grounds host traditional festivals of the local Akan and Guan communities.',
      latitude: 8.1200,
      longitude: 0.6170,
      address: 'Nkwanta, Oti Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '08:00 PM',
      entryFee: 'Free',
      rating: 4.2,
      distanceKm: 450,
      bestTimeToVisit: 'Festival seasons',
      pros: [
        'Rich cultural festivals',
        'Traditional drumming and dance',
        'Community engagement'
      ],
      cons: [
        'Only active during events',
        'Crowded during festivals'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '86',
      name: 'Togbui Waterfalls',
      region: 'Oti',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Ghana_waterfall_forest.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3f/Ghana_waterfall_forest.jpg',
      ],
      description:
      'Togbui Waterfalls is a hidden natural attraction surrounded by dense forest vegetation.',
      latitude: 7.6000,
      longitude: 0.5000,
      address: 'Oti Region, Ghana',
      openingTime: '07:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10',
      rating: 4.3,
      distanceKm: 470,
      bestTimeToVisit: 'May – October',
      pros: [
        'Peaceful environment',
        'Hidden natural gem',
        'Great for photography'
      ],
      cons: [
        'Difficult access',
        'No tourist facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '87',
      name: 'Kete Krachi Town & Volta Lake Shore',
      region: 'Oti',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Lake_Volta_shore.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/5c/Lake_Volta_shore.jpg',
      ],
      description:
      'Kete Krachi is a historic town on the shores of Lake Volta known for fishing and trade activities.',
      latitude: 7.8000,
      longitude: 0.0500,
      address: 'Kete Krachi, Oti Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.4,
      distanceKm: 520,
      bestTimeToVisit: 'All year round',
      pros: [
        'Beautiful lake scenery',
        'Fishing activities',
        'Historical town'
      ],
      cons: [
        'Hot climate',
        'Limited tourism facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '88',
      name: 'Dambai Waterfront',
      region: 'Oti',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Lake_Volta_boat.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/6/6f/Lake_Volta_boat.jpg',
      ],
      description:
      'Dambai Waterfront is a scenic area along Lake Volta used for fishing, transport, and relaxation.',
      latitude: 8.0700,
      longitude: 0.1700,
      address: 'Dambai, Oti Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.2,
      distanceKm: 460,
      bestTimeToVisit: 'Morning or sunset',
      pros: [
        'Beautiful lake views',
        'Boat activities',
        'Relaxing atmosphere'
      ],
      cons: [
        'Hot weather',
        'Limited seating areas'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '89',
      name: 'Nkonya Hills',
      region: 'Oti',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4c/Ghana_hills_landscape.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4c/Ghana_hills_landscape.jpg',
      ],
      description:
      'Nkonya Hills offer beautiful elevated views of forests and valleys in the Oti Region.',
      latitude: 7.7000,
      longitude: 0.3000,
      address: 'Nkonya area, Oti Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.3,
      distanceKm: 490,
      bestTimeToVisit: 'November – March',
      pros: [
        'Scenic hill views',
        'Good for hiking',
        'Cool breeze'
      ],
      cons: [
        'Rough access roads',
        'No tourist facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '90',
      name: 'Oti River Basin Landscape',
      region: 'Oti',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/7a/River_landscape_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/7/7a/River_landscape_Ghana.jpg',
      ],
      description:
      'The Oti River Basin is known for its fertile lands, fishing communities, and natural beauty.',
      latitude: 8.3000,
      longitude: 0.1000,
      address: 'Oti River Basin, Ghana',
      openingTime: 'Any time',
      closingTime: 'Any time',
      entryFee: 'Free',
      rating: 4.5,
      distanceKm: 500,
      bestTimeToVisit: 'November – March',
      pros: [
        'Wide scenic river views',
        'Fishing culture',
        'Peaceful environment'
      ],
      cons: [
        'Flooding during rainy season',
        'Limited infrastructure'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '91',
      name: 'Mole National Park',
      region: 'Savannah',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Mole_National_Park_Elephants.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/5f/Mole_National_Park_Elephants.jpg',
      ],
      description:
      'Mole National Park is the largest wildlife park in Ghana, known for elephants, antelopes, and safari experiences.',
      latitude: 9.7850,
      longitude: -1.6660,
      address: 'Damongo, Savannah Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 40',
      rating: 4.8,
      distanceKm: 420,
      bestTimeToVisit: 'November – March',
      pros: [
        'Best safari park in Ghana',
        'Rich wildlife experience',
        'Great for photography'
      ],
      cons: [
        'Long travel distance',
        'Limited accommodation options'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '92',
      name: 'Larabanga Mosque',
      region: 'Savannah',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Larabanga_Mosque_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3a/Larabanga_Mosque_Ghana.jpg',
      ],
      description:
      'Larabanga Mosque is the oldest mosque in Ghana and one of the oldest in West Africa, built in Sudanese-Sahelian style.',
      latitude: 9.5500,
      longitude: -1.7870,
      address: 'Larabanga, Savannah Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free (donation)',
      rating: 4.7,
      distanceKm: 410,
      bestTimeToVisit: 'All year round',
      pros: [
        'Rich Islamic history',
        'Unique architecture',
        'Cultural heritage site'
      ],
      cons: [
        'Strict dress code',
        'Limited visitor facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '93',
      name: 'Mystic Stone (Larabanga)',
      region: 'Savannah',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6a/Mystic_Stone_Larabanga.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/6/6a/Mystic_Stone_Larabanga.jpg',
      ],
      description:
      'The Mystic Stone is a sacred rock tied to the founding legend of Larabanga.',
      latitude: 9.5530,
      longitude: -1.7850,
      address: 'Larabanga, Savannah Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free',
      rating: 4.3,
      distanceKm: 410,
      bestTimeToVisit: 'All year round',
      pros: [
        'Spiritual significance',
        'Cultural storytelling site',
        'Near Larabanga Mosque'
      ],
      cons: [
        'Small site',
        'Limited tourism infrastructure'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '94',
      name: 'Mognori Eco Village',
      region: 'Savannah',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Mognori_Eco_Village.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/7/7a/Mognori_Eco_Village.jpg',
      ],
      description:
      'Mognori Eco Village offers canoe rides, batik making, and cultural tourism near Mole National Park.',
      latitude: 9.7500,
      longitude: -1.7000,
      address: 'Near Mole National Park, Savannah Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 25',
      rating: 4.6,
      distanceKm: 430,
      bestTimeToVisit: 'November – March',
      pros: [
        'Eco-tourism activities',
        'Cultural experience',
        'Nature and wildlife access'
      ],
      cons: [
        'Remote location',
        'Limited accommodation'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '95',
      name: 'Daboya Weaving Village',
      region: 'Savannah',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Kente_weaving_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3f/Kente_weaving_Ghana.jpg',
      ],
      description:
      'Daboya is famous for traditional smock weaving, producing some of Ghana’s finest handmade textiles.',
      latitude: 9.6500,
      longitude: -1.6000,
      address: 'Daboya, Savannah Region, Ghana',
      openingTime: '07:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.4,
      distanceKm: 380,
      bestTimeToVisit: 'All year round',
      pros: [
        'Traditional weaving culture',
        'Great souvenir shopping',
        'Cultural learning experience'
      ],
      cons: [
        'Hot climate',
        'Limited tourist facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '96',
      name: 'Bui National Park',
      region: 'Savannah',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/2e/Bui_National_Park_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/2e/Bui_National_Park_Ghana.jpg',
      ],
      description:
      'Bui National Park is home to wildlife such as antelopes, hippos, and scenic river landscapes along the Black Volta.',
      latitude: 8.3167,
      longitude: -2.3095,
      address: 'Bui area, Savannah Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 30',
      rating: 4.6,
      distanceKm: 450,
      bestTimeToVisit: 'November – March',
      pros: [
        'Wildlife safari experience',
        'Beautiful river scenery',
        'Eco-tourism opportunities'
      ],
      cons: [
        'Remote access',
        'Limited facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '97',
      name: 'Bui Dam',
      region: 'Savannah',
      category: 'artificial',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Bui_Dam_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4d/Bui_Dam_Ghana.jpg',
      ],
      description:
      'Bui Dam is a hydroelectric dam on the Black Volta River and an important engineering landmark in Ghana.',
      latitude: 8.2792,
      longitude: -2.2363,
      address: 'Bui, Savannah Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free',
      rating: 4.3,
      distanceKm: 455,
      bestTimeToVisit: 'November – March',
      pros: [
        'Engineering landmark',
        'Scenic reservoir views',
        'Educational tours'
      ],
      cons: [
        'Restricted access areas',
        'Limited tourism facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '98',
      name: 'Damongo Town & Market',
      region: 'Savannah',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/27/Ghana_market.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/27/Ghana_market.jpg',
      ],
      description:
      'Damongo is the capital of the Savannah Region and known for its vibrant market and local culture.',
      latitude: 9.0800,
      longitude: -1.8200,
      address: 'Damongo, Savannah Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.2,
      distanceKm: 390,
      bestTimeToVisit: 'Market days',
      pros: [
        'Local cultural experience',
        'Fresh agricultural products',
        'Friendly community'
      ],
      cons: [
        'Hot weather',
        'Crowded market days'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '99',
      name: 'Kparigu Waterfalls',
      region: 'Savannah',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Ghana_waterfall_forest.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/7/7c/Ghana_waterfall_forest.jpg',
      ],
      description:
      'Kparigu Waterfalls is a hidden natural waterfall surrounded by savannah vegetation.',
      latitude: 10.0200,
      longitude: -1.3500,
      address: 'Kparigu, Savannah Region, Ghana',
      openingTime: '07:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10',
      rating: 4.2,
      distanceKm: 480,
      bestTimeToVisit: 'May – October',
      pros: [
        'Natural hidden gem',
        'Peaceful environment',
        'Great for photography'
      ],
      cons: [
        'Difficult access roads',
        'No tourist facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '100',
      name: 'Savannah Savannah Plains Viewpoint',
      region: 'Savannah',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6a/Savannah_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/6/6a/Savannah_Ghana.jpg',
      ],
      description:
      'This viewpoint offers wide scenic savannah landscapes typical of northern Ghana.',
      latitude: 9.5000,
      longitude: -1.5000,
      address: 'Savannah Region, Ghana',
      openingTime: 'Any time',
      closingTime: 'Any time',
      entryFee: 'Free',
      rating: 4.4,
      distanceKm: 400,
      bestTimeToVisit: 'November – March',
      pros: [
        'Wide scenic views',
        'Great for photography',
        'Peaceful environment'
      ],
      cons: [
        'Hot weather',
        'No facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '101',
      name: 'Paga Crocodile Pond',
      region: 'Upper East',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/2b/Paga_Crocodile_Pond.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/2b/Paga_Crocodile_Pond.jpg',
      ],
      description:
      'Paga Crocodile Pond is a sacred site where crocodiles are considered friendly and can be interacted with by visitors.',
      latitude: 10.9950,
      longitude: -1.1010,
      address: 'Paga, Kassena-Nankana West, Upper East Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 20',
      rating: 4.7,
      distanceKm: 700,
      bestTimeToVisit: 'November – March',
      pros: [
        'Unique crocodile interaction',
        'Cultural significance',
        'Great tourist experience'
      ],
      cons: [
        'Can be crowded',
        'Hot weather conditions'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '102',
      name: 'Bolgatanga Craft Market',
      region: 'Upper East',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Bolgatanga_craft_market.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4a/Bolgatanga_craft_market.jpg',
      ],
      description:
      'Bolgatanga Craft Market is famous for handcrafted baskets, leather goods, and traditional arts.',
      latitude: 10.7860,
      longitude: -0.8510,
      address: 'Bolgatanga, Upper East Region, Ghana',
      openingTime: '07:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.5,
      distanceKm: 650,
      bestTimeToVisit: 'All year round',
      pros: [
        'Beautiful handmade crafts',
        'Affordable souvenirs',
        'Cultural experience'
      ],
      cons: [
        'Price bargaining required',
        'Can be busy'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '103',
      name: 'Tongo Hills',
      region: 'Upper East',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Tongo_Hills_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/6/6f/Tongo_Hills_Ghana.jpg',
      ],
      description:
      'Tongo Hills are ancient rock formations with caves, shrines, and scenic landscapes.',
      latitude: 10.7855,
      longitude: -0.7830,
      address: 'Tongo, Upper East Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 10',
      rating: 4.6,
      distanceKm: 655,
      bestTimeToVisit: 'November – March',
      pros: [
        'Unique rock formations',
        'Cultural shrines',
        'Great hiking experience'
      ],
      cons: [
        'Rough terrain',
        'Requires guide'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '104',
      name: 'Sirigu Wall Paintings Village',
      region: 'Upper East',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Sirigu_wall_paintings.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/5f/Sirigu_wall_paintings.jpg',
      ],
      description:
      'Sirigu is known for its traditional wall paintings and unique artistic cultural expression by women.',
      latitude: 10.6000,
      longitude: -1.0000,
      address: 'Sirigu, Upper East Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 5',
      rating: 4.4,
      distanceKm: 640,
      bestTimeToVisit: 'All year round',
      pros: [
        'Unique traditional art',
        'Cultural heritage village',
        'Educational experience'
      ],
      cons: [
        'Limited tourist facilities',
        'Small village setting'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '105',
      name: 'Navrongo Cathedral',
      region: 'Upper East',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3b/Navrongo_Cathedral.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3b/Navrongo_Cathedral.jpg',
      ],
      description:
      'Navrongo Cathedral is one of the oldest Catholic churches in Ghana, built using traditional mud architecture.',
      latitude: 10.8950,
      longitude: -1.0920,
      address: 'Navrongo, Upper East Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free',
      rating: 4.5,
      distanceKm: 690,
      bestTimeToVisit: 'All year round',
      pros: [
        'Historic architecture',
        'Religious significance',
        'Peaceful environment'
      ],
      cons: [
        'Limited visitor facilities',
        'Small site'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '106',
      name: 'Navrongo Earth Architecture Houses',
      region: 'Upper East',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Navrongo_earth_houses.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/7/7a/Navrongo_earth_houses.jpg',
      ],
      description:
      'These traditional mud houses represent ancient Kassena architecture and cultural heritage.',
      latitude: 10.8900,
      longitude: -1.0900,
      address: 'Navrongo, Upper East Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free',
      rating: 4.3,
      distanceKm: 690,
      bestTimeToVisit: 'All year round',
      pros: [
        'Unique architecture',
        'Cultural preservation',
        'Educational value'
      ],
      cons: [
        'Needs preservation support',
        'Limited tourist interpretation'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '107',
      name: 'Pikworo Slave Camp',
      region: 'Upper East',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Pikworo_Slave_Camp.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4f/Pikworo_Slave_Camp.jpg',
      ],
      description:
      'Pikworo Slave Camp is a historic site used during the trans-Saharan slave trade.',
      latitude: 10.9000,
      longitude: -1.1000,
      address: 'Nania, Upper East Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 5',
      rating: 4.6,
      distanceKm: 695,
      bestTimeToVisit: 'All year round',
      pros: [
        'Important historical significance',
        'Educational tours',
        'Cultural awareness'
      ],
      cons: [
        'Emotional experience',
        'Limited infrastructure'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '108',
      name: 'White Volta River (Upper East Section)',
      region: 'Upper East',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3d/White_Volta_River.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3d/White_Volta_River.jpg',
      ],
      description:
      'The White Volta River flows through the Upper East Region and supports farming and fishing communities.',
      latitude: 10.8500,
      longitude: -0.9000,
      address: 'Upper East Region, Ghana',
      openingTime: 'Any time',
      closingTime: 'Any time',
      entryFee: 'Free',
      rating: 4.2,
      distanceKm: 680,
      bestTimeToVisit: 'November – March',
      pros: [
        'Natural river scenery',
        'Fishing activities',
        'Agricultural importance'
      ],
      cons: [
        'Flooding in rainy season',
        'No developed tourist sites'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '109',
      name: 'Zaare Bat Sanctuary',
      region: 'Upper East',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/2f/Bat_cave_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/2f/Bat_cave_Ghana.jpg',
      ],
      description:
      'Zaare Bat Sanctuary is home to thousands of bats living in natural rock caves.',
      latitude: 10.7800,
      longitude: -0.8800,
      address: 'Zaare, Upper East Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.1,
      distanceKm: 650,
      bestTimeToVisit: 'November – March',
      pros: [
        'Unique wildlife experience',
        'Natural cave ecosystem',
        'Good for adventure tourism'
      ],
      cons: [
        'Strong bat odor',
        'Requires caution'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '110',
      name: 'Bolga Independence Square',
      region: 'Upper East',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Independence_Square_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/5c/Independence_Square_Ghana.jpg',
      ],
      description:
      'Bolgatanga Independence Square is a public gathering place for national celebrations and events.',
      latitude: 10.7865,
      longitude: -0.8505,
      address: 'Bolgatanga, Upper East Region, Ghana',
      openingTime: 'Any time',
      closingTime: 'Any time',
      entryFee: 'Free',
      rating: 4.0,
      distanceKm: 650,
      bestTimeToVisit: 'National holidays',
      pros: [
        'Public event space',
        'Cultural gatherings',
        'Central location'
      ],
      cons: [
        'Not a major tourist attraction',
        'Limited facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '111',
      name: 'Wechiau Hippo Sanctuary',
      region: 'Upper West',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Wechiau_Hippo_Sanctuary.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4f/Wechiau_Hippo_Sanctuary.jpg',
      ],
      description:
      'Wechiau Hippo Sanctuary is home to one of the few remaining hippopotamus populations in Ghana along the Black Volta River.',
      latitude: 9.8040,
      longitude: -2.6850,
      address: 'Wechiau, Upper West Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 30',
      rating: 4.7,
      distanceKm: 720,
      bestTimeToVisit: 'November – March',
      pros: [
        'Rare hippo sightings',
        'Boat safari experience',
        'Eco-tourism site'
      ],
      cons: [
        'Remote location',
        'Limited accommodation'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '112',
      name: 'Wa Naa’s Palace',
      region: 'Upper West',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Wa_Naa_Palace.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3f/Wa_Naa_Palace.jpg',
      ],
      description:
      'Wa Naa’s Palace is the traditional seat of the Wa chief and an important cultural heritage site.',
      latitude: 10.0600,
      longitude: -2.5000,
      address: 'Wa, Upper West Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free (donation)',
      rating: 4.5,
      distanceKm: 750,
      bestTimeToVisit: 'All year round',
      pros: [
        'Rich cultural heritage',
        'Traditional leadership history',
        'Educational tours'
      ],
      cons: [
        'Limited visitor facilities',
        'Restricted inner palace access'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '113',
      name: 'Gwollu Slave Defence Walls',
      region: 'Upper West',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Gwollu_Walls.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/6/6f/Gwollu_Walls.jpg',
      ],
      description:
      'Gwollu Slave Defence Walls were built to protect communities from slave raiders in the 19th century.',
      latitude: 10.3000,
      longitude: -2.7200,
      address: 'Gwollu, Upper West Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 5',
      rating: 4.6,
      distanceKm: 780,
      bestTimeToVisit: 'All year round',
      pros: [
        'Important slave trade history',
        'Educational significance',
        'Cultural heritage site'
      ],
      cons: [
        'Partially ruined structures',
        'Limited information boards'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '114',
      name: 'Jirapa Naa’s Palace',
      region: 'Upper West',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/2f/Jirapa_Palace.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/2f/Jirapa_Palace.jpg',
      ],
      description:
      'Jirapa Naa’s Palace is the traditional home of the Jirapa chief and a symbol of local authority.',
      latitude: 10.2500,
      longitude: -2.7000,
      address: 'Jirapa, Upper West Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free',
      rating: 4.3,
      distanceKm: 770,
      bestTimeToVisit: 'All year round',
      pros: [
        'Cultural significance',
        'Traditional architecture',
        'Community heritage'
      ],
      cons: [
        'Limited tourist access',
        'Small site'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '115',
      name: 'Nandom Cathedral',
      region: 'Upper West',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Nandom_Cathedral.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/5c/Nandom_Cathedral.jpg',
      ],
      description:
      'Nandom Cathedral is a historic Catholic church built with traditional Sudanese-style architecture.',
      latitude: 10.8500,
      longitude: -2.6800,
      address: 'Nandom, Upper West Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free',
      rating: 4.5,
      distanceKm: 800,
      bestTimeToVisit: 'All year round',
      pros: [
        'Historic religious site',
        'Unique architecture',
        'Peaceful environment'
      ],
      cons: [
        'Limited facilities',
        'Small tourist area'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '116',
      name: 'Black Volta River (Upper West Section)',
      region: 'Upper West',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Black_Volta_River.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3d/Black_Volta_River.jpg',
      ],
      description:
      'The Black Volta River forms part of Ghana’s border and supports fishing and farming communities.',
      latitude: 9.9000,
      longitude: -2.6000,
      address: 'Upper West Region, Ghana',
      openingTime: 'Any time',
      closingTime: 'Any time',
      entryFee: 'Free',
      rating: 4.4,
      distanceKm: 740,
      bestTimeToVisit: 'November – March',
      pros: [
        'Fishing activities',
        'Scenic river views',
        'Agricultural importance'
      ],
      cons: [
        'Flooding in rainy season',
        'Limited tourism facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '117',
      name: 'Hamile Border Market',
      region: 'Upper West',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/27/Ghana_market.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/27/Ghana_market.jpg',
      ],
      description:
      'Hamile Border Market is a busy trading hub between Ghana and Burkina Faso.',
      latitude: 10.0500,
      longitude: -2.6500,
      address: 'Hamile, Upper West Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.2,
      distanceKm: 760,
      bestTimeToVisit: 'Market days',
      pros: [
        'Cross-border trade experience',
        'Cultural exchange',
        'Wide variety of goods'
      ],
      cons: [
        'Crowded environment',
        'Security checks'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '118',
      name: 'Sissala East Hills',
      region: 'Upper West',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4c/Ghana_hills_landscape.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4c/Ghana_hills_landscape.jpg',
      ],
      description:
      'The Sissala East Hills offer scenic views of valleys and savannah landscapes.',
      latitude: 10.4500,
      longitude: -2.4500,
      address: 'Tumu, Upper West Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.3,
      distanceKm: 730,
      bestTimeToVisit: 'November – March',
      pros: [
        'Beautiful hill scenery',
        'Great for hiking',
        'Peaceful environment'
      ],
      cons: [
        'No tourist facilities',
        'Rough access roads'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '119',
      name: 'Tumu Chief’s Palace',
      region: 'Upper West',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Chief_Palace_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/1/1f/Chief_Palace_Ghana.jpg',
      ],
      description:
      'Tumu Chief’s Palace is the traditional seat of the Tumu paramount chief.',
      latitude: 10.8700,
      longitude: -2.0200,
      address: 'Tumu, Upper West Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free',
      rating: 4.3,
      distanceKm: 760,
      bestTimeToVisit: 'All year round',
      pros: [
        'Cultural heritage',
        'Traditional leadership history',
        'Educational tours'
      ],
      cons: [
        'Limited tourism infrastructure',
        'Restricted access areas'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '120',
      name: 'Daffiama Hippopotamus Sanctuary Area',
      region: 'Upper West',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Wechiau_Hippo_Sanctuary.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4f/Wechiau_Hippo_Sanctuary.jpg',
      ],
      description:
      'The Daffiama area supports hippo populations and river ecosystem conservation along the Black Volta.',
      latitude: 9.7500,
      longitude: -2.7000,
      address: 'Daffiama, Upper West Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 20',
      rating: 4.5,
      distanceKm: 720,
      bestTimeToVisit: 'November – March',
      pros: [
        'Wildlife conservation area',
        'Boat safari opportunities',
        'Eco-tourism experience'
      ],
      cons: [
        'Remote location',
        'Limited infrastructure'
      ],
      youtubeVideoId: ''
  ),


  TouristSite(
      id: '121',
      name: 'Wli Waterfalls',
      region: 'Volta',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Wli_Waterfalls.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3a/Wli_Waterfalls.jpg',
      ],
      description:
      'Wli Waterfalls is the highest waterfall in West Africa, surrounded by lush forest and rich biodiversity.',
      latitude: 7.1330,
      longitude: 0.5670,
      address: 'Hohoe, Volta Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 20',
      rating: 4.8,
      distanceKm: 430,
      bestTimeToVisit: 'May – October',
      pros: [
        'Highest waterfall in West Africa',
        'Beautiful hiking trails',
        'Rich forest biodiversity'
      ],
      cons: [
        'Long walk to base',
        'Slippery during rainy season'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '122',
      name: 'Amedzofe Mountain Village',
      region: 'Volta',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Amedzofe_Village.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/5c/Amedzofe_Village.jpg',
      ],
      description:
      'Amedzofe is one of the highest settlements in Ghana, known for cool weather and scenic mountain views.',
      latitude: 7.0830,
      longitude: 0.6330,
      address: 'Amedzofe, Volta Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.6,
      distanceKm: 410,
      bestTimeToVisit: 'November – March',
      pros: [
        'Cool weather',
        'Mountain hiking experience',
        'Scenic views'
      ],
      cons: [
        'Steep roads',
        'Limited accommodation'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '123',
      name: 'Tafi Atome Monkey Sanctuary',
      region: 'Volta',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/2f/Tafi_Atome_Monkey_Sanctuary.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/2f/Tafi_Atome_Monkey_Sanctuary.jpg',
      ],
      description:
      'A sacred forest where Mona monkeys live freely and are protected by the local community.',
      latitude: 7.0660,
      longitude: 0.3160,
      address: 'Tafi Atome, Volta Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10',
      rating: 4.5,
      distanceKm: 420,
      bestTimeToVisit: 'All year round',
      pros: [
        'Friendly monkeys',
        'Eco-tourism experience',
        'Cultural conservation site'
      ],
      cons: [
        'Small forest area',
        'Limited facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '124',
      name: 'Mount Afadja (Afadjato)',
      region: 'Volta',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Mount_Afadja.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/6/6f/Mount_Afadja.jpg',
      ],
      description:
      'Mount Afadja is the highest mountain in Ghana, popular for hiking and adventure tourism.',
      latitude: 7.1520,
      longitude: 0.6080,
      address: 'Liati Wote, Volta Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 10',
      rating: 4.7,
      distanceKm: 440,
      bestTimeToVisit: 'November – March',
      pros: [
        'Highest peak in Ghana',
        'Great hiking experience',
        'Panoramic views'
      ],
      cons: [
        'Steep climb',
        'Requires fitness'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '125',
      name: 'Tagbo Falls',
      region: 'Volta',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Tagbo_Falls.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4f/Tagbo_Falls.jpg',
      ],
      description:
      'Tagbo Falls is a beautiful waterfall near Mount Afadja, surrounded by forest vegetation.',
      latitude: 7.1525,
      longitude: 0.6090,
      address: 'Liati Wote, Volta Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10',
      rating: 4.4,
      distanceKm: 442,
      bestTimeToVisit: 'May – October',
      pros: [
        'Scenic waterfall',
        'Close to Afadjato',
        'Peaceful environment'
      ],
      cons: [
        'Slippery paths',
        'Limited signage'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '126',
      name: 'Keta Lagoon',
      region: 'Volta',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Keta_Lagoon.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3d/Keta_Lagoon.jpg',
      ],
      description:
      'Keta Lagoon is one of the largest lagoons in West Africa, supporting fishing and birdlife.',
      latitude: 5.9167,
      longitude: 0.9833,
      address: 'Keta, Volta Region, Ghana',
      openingTime: 'Any time',
      closingTime: 'Any time',
      entryFee: 'Free',
      rating: 4.5,
      distanceKm: 480,
      bestTimeToVisit: 'November – March',
      pros: [
        'Bird watching',
        'Fishing activities',
        'Beautiful coastal views'
      ],
      cons: [
        'Flooding risk',
        'Hot weather'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '127',
      name: 'Fort Prinzenstein',
      region: 'Volta',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4c/Fort_Prinzenstein.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4c/Fort_Prinzenstein.jpg',
      ],
      description:
      'Fort Prinzenstein is a historical slave fort built by the Danes in the 18th century.',
      latitude: 5.9160,
      longitude: 0.9830,
      address: 'Keta, Volta Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 5',
      rating: 4.4,
      distanceKm: 485,
      bestTimeToVisit: 'All year round',
      pros: [
        'Historical slave trade site',
        'Educational tours',
        'Coastal location'
      ],
      cons: [
        'Partially ruined structure',
        'Limited preservation'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '128',
      name: 'Wegbe Kpalime Forest Reserve',
      region: 'Volta',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Ghana_forest_trail.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/5e/Ghana_forest_trail.jpg',
      ],
      description:
      'A forest reserve known for hiking trails, bird watching, and biodiversity.',
      latitude: 6.9000,
      longitude: 0.4500,
      address: 'Wegbe, Volta Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 10',
      rating: 4.3,
      distanceKm: 415,
      bestTimeToVisit: 'November – March',
      pros: [
        'Great hiking trails',
        'Rich biodiversity',
        'Bird watching'
      ],
      cons: [
        'Limited signage',
        'Requires guide'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '129',
      name: 'Ho Peaceful Gardens',
      region: 'Volta',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/27/Ghana_garden.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/27/Ghana_garden.jpg',
      ],
      description:
      'A recreational park in Ho used for relaxation, events, and community gatherings.',
      latitude: 6.6000,
      longitude: 0.4700,
      address: 'Ho, Volta Region, Ghana',
      openingTime: '07:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.1,
      distanceKm: 390,
      bestTimeToVisit: 'Evenings',
      pros: [
        'Relaxation spot',
        'Family friendly',
        'Events venue'
      ],
      cons: [
        'Basic facilities',
        'Can be crowded during events'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '130',
      name: 'Tsatsadu Falls',
      region: 'Volta',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Ghana_waterfall_forest.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3f/Ghana_waterfall_forest.jpg',
      ],
      description:
      'Tsatsadu Falls is a hidden waterfall in the Volta Region surrounded by dense forest.',
      latitude: 7.0000,
      longitude: 0.5500,
      address: 'Wli area, Volta Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10',
      rating: 4.4,
      distanceKm: 435,
      bestTimeToVisit: 'May – October',
      pros: [
        'Hidden natural gem',
        'Peaceful environment',
        'Great photography spot'
      ],
      cons: [
        'Difficult access',
        'No tourist facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '131',
      name: 'Nzulezo Stilt Village',
      region: 'Western',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/2f/Nzulezo_Stilt_Village.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/2f/Nzulezo_Stilt_Village.jpg',
      ],
      description:
      'Nzulezo is a unique village built entirely on stilts over Lake Tadane, where residents live, work, and travel by canoe.',
      latitude: 4.9000,
      longitude: -2.4200,
      address: 'Jomoro District, Western Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 30',
      rating: 4.8,
      distanceKm: 550,
      bestTimeToVisit: 'November – March',
      pros: [
        'Unique stilt village experience',
        'Boat ride adventure',
        'Rich cultural heritage'
      ],
      cons: [
        'Requires canoe transport',
        'Remote location'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '132',
      name: 'Busua Beach',
      region: 'Western',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Busua_Beach.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/5c/Busua_Beach.jpg',
      ],
      description:
      'Busua Beach is one of Ghana’s most popular beaches, known for surfing, relaxation, and tourism resorts.',
      latitude: 4.8050,
      longitude: -1.9350,
      address: 'Busua, Western Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.7,
      distanceKm: 510,
      bestTimeToVisit: 'November – April',
      pros: [
        'Beautiful sandy beach',
        'Surfing opportunities',
        'Beach resorts'
      ],
      cons: [
        'Can be crowded on weekends',
        'Strong waves sometimes'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '133',
      name: 'Fort Metal Cross (Dixcove)',
      region: 'Western',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3b/Fort_Metal_Cross.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3b/Fort_Metal_Cross.jpg',
      ],
      description:
      'Fort Metal Cross is a historic European fort built during the trans-Atlantic slave trade era.',
      latitude: 4.7770,
      longitude: -1.9370,
      address: 'Dixcove, Western Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10',
      rating: 4.5,
      distanceKm: 505,
      bestTimeToVisit: 'All year round',
      pros: [
        'Historical slave trade site',
        'Coastal scenery',
        'Educational tours'
      ],
      cons: [
        'Partially damaged structure',
        'Limited maintenance'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '134',
      name: 'Bia National Park',
      region: 'Western',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4e/Bia_National_Park.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4e/Bia_National_Park.jpg',
      ],
      description:
      'Bia National Park is a rainforest reserve home to rare wildlife, birds, and medicinal plants.',
      latitude: 6.4667,
      longitude: -2.6833,
      address: 'Sefwi area, Western Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 25',
      rating: 4.6,
      distanceKm: 620,
      bestTimeToVisit: 'May – October',
      pros: [
        'Rich rainforest biodiversity',
        'Bird watching',
        'Eco-tourism site'
      ],
      cons: [
        'Difficult access roads',
        'Limited accommodation'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '135',
      name: 'Ankobra River',
      region: 'Western',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Ankobra_River.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3a/Ankobra_River.jpg',
      ],
      description:
      'The Ankobra River is an important waterway used for fishing and transportation in the Western Region.',
      latitude: 5.2000,
      longitude: -2.2000,
      address: 'Western Region, Ghana',
      openingTime: 'Any time',
      closingTime: 'Any time',
      entryFee: 'Free',
      rating: 4.3,
      distanceKm: 530,
      bestTimeToVisit: 'November – March',
      pros: [
        'Fishing activities',
        'Scenic river views',
        'Local transportation'
      ],
      cons: [
        'Pollution in some areas',
        'Flood risk in rainy season'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '136',
      name: 'Axim Beach',
      region: 'Western',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/2b/Axim_Beach.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/2b/Axim_Beach.jpg',
      ],
      description:
      'Axim Beach is a calm coastal beach known for its palm trees and historic fort nearby.',
      latitude: 4.8667,
      longitude: -2.2333,
      address: 'Axim, Western Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.6,
      distanceKm: 520,
      bestTimeToVisit: 'November – April',
      pros: [
        'Calm beach environment',
        'Palm tree scenery',
        'Nearby historical sites'
      ],
      cons: [
        'Limited facilities',
        'Can be quiet off-season'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '137',
      name: 'Fort Saint Anthony (Axim)',
      region: 'Western',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Fort_Saint_Anthony_Axim.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3d/Fort_Saint_Anthony_Axim.jpg',
      ],
      description:
      'Fort Saint Anthony is one of the oldest European forts in Ghana, built by the Portuguese in the 1500s.',
      latitude: 4.8660,
      longitude: -2.2320,
      address: 'Axim, Western Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10',
      rating: 4.5,
      distanceKm: 522,
      bestTimeToVisit: 'All year round',
      pros: [
        'Very old historical fort',
        'Coastal views',
        'Cultural heritage site'
      ],
      cons: [
        'Needs restoration',
        'Limited visitor facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '138',
      name: 'Takoradi Harbour',
      region: 'Western',
      category: 'industrial',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Takoradi_Harbour.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4b/Takoradi_Harbour.jpg',
      ],
      description:
      'Takoradi Harbour is Ghana’s first deep-water port and an important industrial and trade center.',
      latitude: 4.9010,
      longitude: -1.7510,
      address: 'Takoradi, Western Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.4,
      distanceKm: 500,
      bestTimeToVisit: 'All year round',
      pros: [
        'Major port city',
        'Economic importance',
        'Industrial tourism'
      ],
      cons: [
        'Restricted areas',
        'Busy industrial zone'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '139',
      name: 'Butre Village & Fort Batenstein',
      region: 'Western',
      category: 'historical',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Fort_Batenstein.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3f/Fort_Batenstein.jpg',
      ],
      description:
      'Butre is a coastal village with Fort Batenstein, a Dutch-built fort used during colonial trade.',
      latitude: 4.7330,
      longitude: -1.9370,
      address: 'Butre, Western Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 5',
      rating: 4.4,
      distanceKm: 515,
      bestTimeToVisit: 'All year round',
      pros: [
        'Historical coastal village',
        'Scenic views',
        'Cultural heritage'
      ],
      cons: [
        'Poor road access',
        'Limited tourist facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '140',
      name: 'Esiama Mangrove Forest',
      region: 'Western',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Mangrove_forest_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4a/Mangrove_forest_Ghana.jpg',
      ],
      description:
      'Esiama Mangrove Forest is an ecological site supporting marine life and coastal biodiversity.',
      latitude: 5.0833,
      longitude: -2.3500,
      address: 'Esiama, Western Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.3,
      distanceKm: 540,
      bestTimeToVisit: 'November – March',
      pros: [
        'Rich mangrove ecosystem',
        'Bird watching',
        'Eco-tourism experience'
      ],
      cons: [
        'Swampy terrain',
        'Limited access paths'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '141',
      name: 'Bia National Park (North Section)',
      region: 'Western North',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4e/Bia_National_Park.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4e/Bia_National_Park.jpg',
      ],
      description:
      'Bia National Park is a rainforest reserve known for rare wildlife, birds, and rich biodiversity in Western North.',
      latitude: 6.4667,
      longitude: -2.6833,
      address: 'Sefwi Bia, Western North Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 25',
      rating: 4.7,
      distanceKm: 580,
      bestTimeToVisit: 'May – October',
      pros: [
        'Rich rainforest biodiversity',
        'Bird watching opportunities',
        'Eco-tourism experience'
      ],
      cons: [
        'Remote location',
        'Limited infrastructure'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '142',
      name: 'Bodi Waterfalls',
      region: 'Western North',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Ghana_waterfall_forest.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3f/Ghana_waterfall_forest.jpg',
      ],
      description:
      'Bodi Waterfalls is a hidden natural waterfall surrounded by dense forest and wildlife.',
      latitude: 6.2500,
      longitude: -2.5000,
      address: 'Bodi, Western North Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10',
      rating: 4.3,
      distanceKm: 600,
      bestTimeToVisit: 'May – October',
      pros: [
        'Beautiful waterfall scenery',
        'Peaceful environment',
        'Great for photography'
      ],
      cons: [
        'Difficult access roads',
        'No tourist facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '143',
      name: 'Sefwi Wiawso Forest Reserve',
      region: 'Western North',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Ghana_forest_reserve.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/5e/Ghana_forest_reserve.jpg',
      ],
      description:
      'A protected forest reserve known for timber resources, wildlife, and eco-tourism potential.',
      latitude: 6.2167,
      longitude: -2.4833,
      address: 'Sefwi Wiawso, Western North Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 15',
      rating: 4.4,
      distanceKm: 590,
      bestTimeToVisit: 'November – March',
      pros: [
        'Rich forest ecosystem',
        'Wildlife sightings',
        'Nature walks'
      ],
      cons: [
        'Limited infrastructure',
        'Requires guide'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '144',
      name: 'Sefwi Anhwiaso Shrine Forest',
      region: 'Western North',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Sacred_forest_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4f/Sacred_forest_Ghana.jpg',
      ],
      description:
      'A sacred forest used for traditional rituals and cultural heritage preservation.',
      latitude: 6.3000,
      longitude: -2.6000,
      address: 'Anhwiaso, Western North Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Free (donation)',
      rating: 4.5,
      distanceKm: 610,
      bestTimeToVisit: 'All year round',
      pros: [
        'Strong cultural heritage',
        'Spiritual significance',
        'Traditional rituals'
      ],
      cons: [
        'Restricted areas',
        'Limited tourist access'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '145',
      name: 'Juaboso Forest Reserve',
      region: 'Western North',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/5/5a/Ghana_rainforest.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/5/5a/Ghana_rainforest.jpg',
      ],
      description:
      'A dense tropical forest reserve with diverse flora and fauna in Western North.',
      latitude: 6.3500,
      longitude: -2.8000,
      address: 'Juaboso, Western North Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 10',
      rating: 4.3,
      distanceKm: 620,
      bestTimeToVisit: 'November – March',
      pros: [
        'Rich biodiversity',
        'Nature walks',
        'Bird watching'
      ],
      cons: [
        'Poor road access',
        'No tourist facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '146',
      name: 'Bibiani Gold Mines Area',
      region: 'Western North',
      category: 'industrial',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3c/Gold_mining_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3c/Gold_mining_Ghana.jpg',
      ],
      description:
      'Bibiani is a major gold mining town with industrial mining operations and history.',
      latitude: 6.4667,
      longitude: -2.3333,
      address: 'Bibiani, Western North Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Restricted access',
      rating: 4.2,
      distanceKm: 570,
      bestTimeToVisit: 'All year round',
      pros: [
        'Mining industry insight',
        'Economic importance',
        'Educational tours'
      ],
      cons: [
        'Restricted mining areas',
        'Industrial pollution concerns'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '147',
      name: 'Sefwi Bekwai Town Center',
      region: 'Western North',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/27/Ghana_town_market.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/27/Ghana_town_market.jpg',
      ],
      description:
      'A lively town center known for trading, culture, and community life in Western North.',
      latitude: 6.2833,
      longitude: -2.7167,
      address: 'Sefwi Bekwai, Western North Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.2,
      distanceKm: 600,
      bestTimeToVisit: 'Market days',
      pros: [
        'Cultural experience',
        'Local markets',
        'Friendly community'
      ],
      cons: [
        'Busy market environment',
        'Limited tourist attractions'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '148',
      name: 'Akontombra Forest Area',
      region: 'Western North',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Forest_trail_Ghana.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/4/4a/Forest_trail_Ghana.jpg',
      ],
      description:
      'A forested area with natural vegetation and small-scale farming communities.',
      latitude: 6.0833,
      longitude: -2.7167,
      address: 'Akontombra, Western North Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.1,
      distanceKm: 610,
      bestTimeToVisit: 'November – March',
      pros: [
        'Natural scenery',
        'Agricultural landscape',
        'Peaceful environment'
      ],
      cons: [
        'Poor infrastructure',
        'Limited tourism facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '149',
      name: 'Asankragwa Town',
      region: 'Western North',
      category: 'cultural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/27/Ghana_market.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/2/27/Ghana_market.jpg',
      ],
      description:
      'Asankragwa is a growing town known for trade, farming, and local culture.',
      latitude: 5.9500,
      longitude: -2.6833,
      address: 'Asankragwa, Western North Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.2,
      distanceKm: 620,
      bestTimeToVisit: 'All year round',
      pros: [
        'Local market experience',
        'Agricultural trade',
        'Community life'
      ],
      cons: [
        'Busy trading center',
        'Limited tourist infrastructure'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '150',
      name: 'Sefwi Akura Falls',
      region: 'Western North',
      category: 'natural',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Ghana_waterfall_forest.jpg',
      galleryImages: [
        'https://upload.wikimedia.org/wikipedia/commons/3/3f/Ghana_waterfall_forest.jpg',
      ],
      description:
      'A hidden waterfall surrounded by forest vegetation in Western North Region.',
      latitude: 6.2000,
      longitude: -2.5500,
      address: 'Sefwi Akura, Western North Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10',
      rating: 4.3,
      distanceKm: 605,
      bestTimeToVisit: 'May – October',
      pros: [
        'Hidden natural waterfall',
        'Peaceful environment',
        'Great photography spot'
      ],
      cons: [
        'Difficult access',
        'No facilities'
      ],
      youtubeVideoId: ''
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