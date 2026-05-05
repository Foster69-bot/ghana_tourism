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
    'https://i.pinimg.com/736x/d5/2b/39/d52b3913abcce3b48c9f728fbe4c3290.jpg',
    galleryImages: [
      'https://i.pinimg.com/1200x/d2/93/af/d293afab182f82eb63a941365bae5525.jpg',
      'https://i.pinimg.com/1200x/f7/1e/e1/f71ee1eee963ea8a8595fcd0a6fc9eb4.jpg',
      'https://i.pinimg.com/236x/45/d9/23/45d923b3d5f839399e31a3a3783b9549.jpg',
      'https://i.pinimg.com/236x/45/d9/23/45d923b3d5f839399e31a3a3783b9549.jpg',
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
    id: '5',
    name: 'Boti Falls',
    region: 'Eastern',
    category: 'nature',
    imageUrl:
    'https://i.pinimg.com/1200x/bf/1f/2d/bf1f2d0b2ccb158f0b1b67b856157aca.jpg',
    galleryImages: [
      'https://i.pinimg.com/1200x/bf/1f/2d/bf1f2d0b2ccb158f0b1b67b856157aca.jpg',
      'https://i.pinimg.com/1200x/cb/4c/cc/cb4ccc28b633922f40f933294f0a0bb4.jpg',
      'https://i.pinimg.com/1200x/cb/4c/cc/cb4ccc28b633922f40f933294f0a0bb4.jpg',
      'https://i.pinimg.com/1200x/c5/3f/28/c53f284c9c02898b56456caef0a927b2.jpg'

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
  // TouristSite(
  //   id: '6',
  //   name: 'Elmina Castle',
  //   region: 'Central',
  //   category: 'artificial',
  //   imageUrl:
  //   'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Elmina_Castle.jpg/640px-Elmina_Castle.jpg',
  //   galleryImages: [
  //     'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Elmina_Castle.jpg/640px-Elmina_Castle.jpg',
  //   ],
  //   description:
  //   'Elmina Castle, also known as St. George\'s Castle, is the oldest European building in sub-Saharan Africa, constructed by the Portuguese in 1482. Designated a UNESCO World Heritage Site, it served as a major hub of the Atlantic slave trade for over three centuries. The castle offers sobering but essential guided tours through its dungeons, the governor\'s quarters, and the harrowing "Door of No Return."',
  //   latitude: 5.0843,
  //   longitude: -1.3481,
  //   address: 'Elmina, Central Region, Ghana',
  //   openingTime: '09:00 AM',
  //   closingTime: '05:00 PM',
  //   entryFee: 'GHS 80 / ~\$5.5 USD',
  //   rating: 4.7,
  //   distanceKm: 155,
  //   bestTimeToVisit: 'November – March',
  //   pros: [
  //     'Oldest European building in sub-Saharan Africa',
  //     'UNESCO World Heritage Site',
  //     'Powerful historical experience',
  //     'Scenic coastal location',
  //     'Excellent guided tours',
  //   ],
  //   cons: [
  //     'Heavy emotional weight of the history',
  //     'Long drive from Accra',
  //     'Some areas are very cramped',
  //   ],
  //   youtubeVideoId: 'J8hYQFk8uws',
  // ),

  TouristSite(
    id: '7',
    name: 'Mole National Park',
    region: 'Savannah',
    category: 'nature',
    imageUrl:
    'https://i.pinimg.com/1200x/e0/4c/64/e04c640471c913bbb4aa50aa51a6812e.jpg',
    galleryImages: [
      'https://i.pinimg.com/1200x/e0/4c/64/e04c640471c913bbb4aa50aa51a6812e.jpg',
      'https://i.pinimg.com/736x/de/97/8b/de978b377bd20e4db1151cc2af37d3da.jpg',
      'https://i.pinimg.com/1200x/48/29/ea/4829ea61f26659c87beb2becaa666361.jpg',
      'https://i.pinimg.com/1200x/ea/e1/e1/eae1e176638da9824b7852d8381e3c7a.jpg',
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
    'https://i.pinimg.com/1200x/fb/35/8d/fb358dbd29b34de65a11184d0ee6370e.jpg',
    galleryImages: [
      'https://i.pinimg.com/1200x/72/0c/7f/720c7f7a44f075dde6d986254fbbcf6c.jpg',
      'https://i.pinimg.com/1200x/f6/6a/c7/f66ac7560c6d6f27be18dbaa58467397.jpg',
      'https://i.pinimg.com/1200x/df/b6/14/dfb6149e7850c524c8fcbd4b773918c7.jpg',
      'https://i.pinimg.com/736x/4c/18/56/4c1856c1cecd48dfd89614c5921bb6be.jpg'

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
    'https://i.pinimg.com/736x/8c/28/21/8c282160043a803593a3958ed9c01c08.jpg',
    galleryImages: [
      'https://i.pinimg.com/1200x/d9/1f/a0/d91fa03ef22d5479b7fe1e04217fb71b.jpg',
      'https://i.pinimg.com/1200x/8c/b7/b2/8cb7b2f45110b2178aca09352ffd617a.jpg',
      'https://i.pinimg.com/1200x/22/a6/e0/22a6e04e0af1ecbdd6efbf46bc5d3fc8.jpg',
      'https://i.pinimg.com/736x/c3/39/e7/c339e79a71ef3b1239babf7f35228c90.jpg'
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
      imageUrl: 'https://i.pinimg.com/736x/d5/8f/83/d58f83e76d8989f8d7f1a9b52c6aa1bd.jpg',
      galleryImages: [
        'https://i.pinimg.com/236x/01/a3/e7/01a3e776a80e57c57d4162a5e5b4aa2e.jpg',
        'https://i.pinimg.com/1200x/a5/68/98/a568989e029bf669397bab884d017e88.jpg',
        'https://i.pinimg.com/1200x/62/dd/64/62dd64b0012c0ccad72f18011a8737e1.jpg',
        'https://i.pinimg.com/1200x/b2/85/f3/b285f31ade7322280e622510ed7a98df.jpg'
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
      imageUrl: 'https://i.pinimg.com/1200x/42/e8/eb/42e8eb6f6475acd017b507a5c793c2da.jpg',
      galleryImages: [
        'https://i.pinimg.com/1200x/9f/af/94/9faf9480d353ef59da122057923de97f.jpg',
        'https://i.pinimg.com/1200x/58/37/08/583708b0c7290e8dd6a352067a6a456f.jpg',
        'https://i.pinimg.com/1200x/eb/a2/3f/eba23fc39bdf403c44a06aee0349962d.jpg',
        'https://i.pinimg.com/736x/38/2f/ad/382fad1d1cc1c1df9fdf1bd28c6a9c56.jpg'
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
      imageUrl: 'https://i.pinimg.com/736x/96/e2/6b/96e26b9b67849fef116f500850715f63.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/be/19/cd/be19cd7ea6fb6d104e4753ab77739b48.jpg',
        'https://i.pinimg.com/1200x/1c/5d/7c/1c5d7c70489d3927b5dd6faf2c946cd7.jpg',
        'https://i.pinimg.com/736x/16/8e/b8/168eb86fec80c2e4366e40e342d7e16e.jpg',
        'https://i.pinimg.com/1200x/6d/93/24/6d9324f053adae203384a124034c2957.jpg',

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
      imageUrl: 'https://i.pinimg.com/736x/2a/51/52/2a5152915a67b35e4bc962c500732ec6.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/34/d6/a7/34d6a772bab715ff3c5c59ea06ecf321.jpg',
        'https://i.pinimg.com/736x/34/d6/a7/34d6a772bab715ff3c5c59ea06ecf321.jpg',
        'https://i.pinimg.com/1200x/5c/da/c6/5cdac6f89e786b6c5e29045211bfd9a6.jpg',
        'https://i.pinimg.com/1200x/e9/56/f8/e956f89692b3298d3c3eceb4e7883598.jpg',
        '',
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
      imageUrl: 'https://i.pinimg.com/1200x/68/9e/19/689e19aebf4006f48b647f50c5fb8ef0.jpg',
      galleryImages: [
        'https://i.pinimg.com/1200x/78/e4/d3/78e4d32c327a5b34d7be0311a0309e1e.jpg',
        'https://i.pinimg.com/1200x/b2/fe/45/b2fe45c5fd4b3de1b630d1652c6515aa.jpg',
        'https://i.pinimg.com/1200x/03/04/a9/0304a93ffb755e6ed5cafe602671ee0a.jpg',
        'https://i.pinimg.com/1200x/03/04/a9/0304a93ffb755e6ed5cafe602671ee0a.jpg'
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
      imageUrl: 'https://i.pinimg.com/1200x/25/28/d9/2528d98b6ced82bfe5e7424de5bbbfcc.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/ce/32/5b/ce325bd2ba1536baa6261faa1f7a1bcc.jpg',
        'https://i.pinimg.com/1200x/7c/0a/9c/7c0a9caa89bfb4ec2c5b667869df7d53.jpg',
        'https://i.pinimg.com/1200x/ca/eb/ee/caebeed1f0566f693bc984f7851ff0d2.jpg',
        'https://i.pinimg.com/736x/d3/5b/37/d35b37f5ee2f6462550a83dd4e635ade.jpg',

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
      imageUrl: 'https://i.pinimg.com/1200x/38/c0/12/38c012e9706a4d19e39d74d08220a7ec.jpg',
      galleryImages: [
        'https://i.pinimg.com/1200x/32/bf/65/32bf652265cdeacdf8aeb5c42875c404.jpg',
        'https://i.pinimg.com/1200x/6d/9e/70/6d9e70cf03310e7cd2021e8a331e3aaf.jpg',
        'https://i.pinimg.com/1200x/80/3d/0f/803d0fb406d50db281dc972d7e1b2903.jpg',
        'https://i.pinimg.com/1200x/c2/19/46/c219467c8c95fd236412899b42cc0e9c.jpg'
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
      imageUrl: 'https://i.pinimg.com/736x/d6/dc/47/d6dc474fdc324a10832e50cc6165d4f8.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/ab/96/d9/ab96d99f50ba1bfdb73f5011005adde5.jpg',
        'https://i.pinimg.com/736x/f1/d6/cd/f1d6cdd8f78e00e790494c50c0dcfa45.jpg',
        'https://i.pinimg.com/736x/1f/4e/91/1f4e912148707435032a63f352ad4fc6.jpg',
        'https://i.pinimg.com/1200x/e6/33/08/e63308e90c76fd1d2fbd292b2449354f.jpg',
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
      imageUrl: 'https://i.pinimg.com/736x/74/f3/03/74f303b8c8cfa896158947396f0b609e.jpg',
      galleryImages: [
        'https://i.pinimg.com/1200x/32/99/99/329999f41a2c2540d3cef838bdb93a96.jpg',
        'https://i.pinimg.com/1200x/77/f6/b3/77f6b33aaaf22b309b8fe584101c5a09.jpg',
        'https://i.pinimg.com/1200x/60/b7/15/60b715640c9ca3b6bbfb3a4abae7b03b.jpg',
        'https://i.pinimg.com/736x/75/91/88/7591880c598a22c436f20e642f2c5ca2.jpg',
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
      imageUrl: 'https://i.pinimg.com/736x/94/8f/c3/948fc3e287ce8223e8f46529bdb9daae.jpg',
      galleryImages: [
        'https://i.pinimg.com/1200x/34/a3/74/34a37443f8caa3cad5d26e47208827cf.jpg',
        'https://i.pinimg.com/1200x/87/88/e1/8788e10ccf07dd77056a902763b77c71.jpg',
        'https://i.pinimg.com/1200x/87/88/e1/8788e10ccf07dd77056a902763b77c71.jpg',
        'https://i.pinimg.com/236x/37/fe/5b/37fe5b37e7838e306bc66939c245e067.jpg'
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


  // BONO REGION
  TouristSite(
      id: '21',
      name: 'Bui National Park',
      region: 'Bono',
      category: 'natural',
      imageUrl: 'https://i.pinimg.com/736x/b2/92/58/b2925853ecf25e4fc08af6095cabf2f8.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/49/4b/53/494b530400db132b17532f1434ed0195.jpg',
        'https://i.pinimg.com/736x/ac/ed/a2/aceda2de66c82efcfd39a130c458453e.jpg',
        'https://i.pinimg.com/736x/1b/3c/44/1b3c449a1c1c400998e528bfa9f22b95.jpg',
        'https://i.pinimg.com/736x/2f/ac/78/2fac78c9594a64481c6e670cfc5cae8b.jpg',
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
      imageUrl: 'https://i.pinimg.com/736x/01/fb/19/01fb197b1408e02b85494b236cfb8672.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/88/d5/01/88d501ce0d44f5f9b6600887a83fb4e8.jpg',
        'https://i.pinimg.com/736x/04/ad/6b/04ad6b31c13cdfc7d30d6d6f2450d29e.jpg',
        'https://i.pinimg.com/736x/e7/00/53/e70053058bc0beee8c3c55ed92584f7d.jpg',
        'https://i.pinimg.com/736x/b7/60/9e/b7609e932a10dda4f9256d59b55e2fbc.jpg',
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
      imageUrl: 'https://i.pinimg.com/1200x/00/6c/5e/006c5e5812dd885bf034d4601e344a0d.jpg',
      galleryImages: [
        'https://i.pinimg.com/1200x/00/6c/5e/006c5e5812dd885bf034d4601e344a0d.jpg',
        'https://i.pinimg.com/1200x/7a/6b/65/7a6b65ffb6e18b9166de6f48a0fdf0bd.jpg',
        'https://i.pinimg.com/1200x/c2/00/8c/c2008c1c4d4b2499a3f2ceb7b182ba52.jpg',
        'https://i.pinimg.com/1200x/34/d7/85/34d78514a575663a3a60191d6b1967e2.jpg',


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
      imageUrl: 'https://i.pinimg.com/736x/9f/47/bb/9f47bbd4068bd87edbbf56179eeff6fb.jpg',
      galleryImages: [
        'https://i.pinimg.com/1200x/2a/e6/f7/2ae6f7460b6450f5e3a5ef0f5c007001.jpg',
        'https://i.pinimg.com/736x/e4/21/97/e42197bb9970ee5be3539222f0ab8d18.jpg',
        'https://i.pinimg.com/736x/07/13/7f/07137fd33959a2a1aba4b6f11042aa69.jpg',
        'https://i.pinimg.com/736x/2e/4d/87/2e4d8799334ab20cda0a994a9df0b2c8.jpg',
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
      imageUrl: 'https://i.pinimg.com/1200x/b3/16/37/b31637d5e2c76ad262b0076e8a1858e3.jpg',
      galleryImages: [
        'https://i.pinimg.com/1200x/3a/74/87/3a7487ca0e3a88ec391baf95ebe95f08.jpg',
        'https://i.pinimg.com/1200x/9b/6c/75/9b6c7587784500aa8e7d604cdb603b42.jpg',
        'https://i.pinimg.com/1200x/34/81/b3/3481b3d5268a6f6082beecfc098f8dc1.jpg',
        'https://i.pinimg.com/736x/58/10/aa/5810aace9e2f7a2a457580465779370a.jpg',

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
      imageUrl: 'https://i.pinimg.com/236x/20/e9/97/20e997e209c4b5a29be1aa52bde62aba.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/14/4e/c2/144ec2467e77371a9ba24ef70f7aa74f.jpg',
        'https://i.pinimg.com/736x/80/11/8a/80118a9c749a621bb64541797276dd89.jpg',
        'https://i.pinimg.com/736x/7b/fc/9f/7bfc9f6b1b1f2933f1079c914ce3453d.jpg',
        'https://i.pinimg.com/1200x/32/2e/8c/322e8c438d9ac58b0950d085580e5a65.jpg',
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
      imageUrl: 'https://i.pinimg.com/736x/fa/fa/af/fafaaf4781e90bb0bcdf88b1411ef7da.jpg',
      galleryImages: [
        'https://i.pinimg.com/236x/3c/3a/e7/3c3ae7b09b984bd01ae004806b51fd02.jpg',
        'https://i.pinimg.com/1200x/e2/98/db/e298db40dfc000ff468e9bf2b89f9f02.jpg',
        'https://i.pinimg.com/736x/95/6a/b3/956ab38f7d990ae9321b93fd2fbaeb8a.jpg',
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


  // AHAFO REGION
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
      imageUrl: 'https://i.pinimg.com/1200x/f6/8b/ec/f68bec424ceb92798b4a2d015cb6d740.jpg',
      galleryImages: [
        'https://i.pinimg.com/1200x/72/87/56/728756d6f6c7048ae876ab9692ec5211.jpg',
        'https://i.pinimg.com/1200x/27/1c/d6/271cd6df2573648f98c000c104ed75ea.jpg',
        'https://i.pinimg.com/1200x/0d/94/6f/0d946f47f414a9a4753c34dedc861a9b.jpg',
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
      imageUrl: 'https://i.pinimg.com/736x/6b/2f/2f/6b2f2f6730f68586d419ebce3639c0a6.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/b9/8d/cc/b98dccaa74092b0d435eb47103c4469d.jpg',
        'https://i.pinimg.com/1200x/0b/5d/35/0b5d35c40464cb0c9bf9db55be87e729.jpg'
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



  // WESTERN REGION

  TouristSite(
      id: '131',
      name: 'Nzulezo Stilt Village',
      region: 'Western',
      category: 'cultural',
      imageUrl: 'https://i.pinimg.com/736x/9b/0c/57/9b0c57d2df9e3d6e6b4c7c4dcd7c0e1f.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/0b/b1/3e/0bb13ef4a0fa6c1b6fbb1c3c1e5edc72.jpg',
        'https://i.pinimg.com/736x/6a/9f/1c/6a9f1c6f69c7a2c34b73a1c6f2e4f0c3.jpg',
        'https://i.pinimg.com/736x/c4/53/7a/c4537a24d9e8c8d32a0f45f1d7c6f1a1.jpg',
        'https://i.pinimg.com/736x/7f/13/71/7f13710d7e7e43a33e4ef6a9e9c4b7b1.jpg',
        'https://i.pinimg.com/736x/54/9b/6e/549b6e7e6e9b2f8d1c6c6f1c0e9f0a7c.jpg'
      ],
      description:
      'Nzulezo is a unique village built on stilts over Lake Tadane where residents travel mainly by canoe.',
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
        'Unique stilt village',
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
      imageUrl: 'https://i.pinimg.com/736x/13/48/ef/1348efcbfaad1a52e0b0a19bcb9c0c0c.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/5c/b9/1f/5cb91f8f2fa1f1e0cba3e9f4b0c7b3a0.jpg',
        'https://i.pinimg.com/736x/3b/22/9d/3b229d41df52b0a47e8c8a7db9f6f9c3.jpg',
        'https://i.pinimg.com/736x/0f/44/c4/0f44c4d2a8f2d76e8c7c2a0a3f2f9b5a.jpg',
        'https://i.pinimg.com/736x/2a/55/ef/2a55efdf9b3d0c8b3e1f4d5b4c1a1e9f.jpg',
        'https://i.pinimg.com/736x/9c/0b/77/9c0b77a7d4a7e2b5c3c7e2e9b5b8e1a4.jpg'
      ],
      description:
      'Busua Beach is a popular surfing and relaxation destination known for its golden sand and beach resorts.',
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
        'Crowded during holidays',
        'Strong waves sometimes'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '133',
      name: 'Fort Metal Cross',
      region: 'Western',
      category: 'historical',
      imageUrl: 'https://i.pinimg.com/736x/91/4f/4e/914f4e8a56a7b4a5b4d1d7e7c0f0c2a3.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/5e/11/5b/5e115bff9fbe3f7c7c1f3a9e0e6c1f3a.jpg',
        'https://i.pinimg.com/736x/74/18/c3/7418c3b3a9d0f3c2a7e9f2b3d5e6c7a1.jpg',
        'https://i.pinimg.com/736x/3e/0a/ab/3e0aab7a7e9f1b0d3c7c2b6e8d1a2b7c.jpg',
        'https://i.pinimg.com/736x/1d/7c/66/1d7c6647a6e9e3d7c2a0f3b1d4e8c9b2.jpg',
        'https://i.pinimg.com/736x/4b/c7/7a/4bc77a2c7c7d3e8a1c7f1a9c7d4b8c3f.jpg'
      ],
      description:
      'Fort Metal Cross is a historic coastal fort built by Europeans during the trans-Atlantic slave trade era.',
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
        'Historic slave trade site',
        'Beautiful ocean view',
        'Educational tours'
      ],
      cons: [
        'Needs renovation',
        'Limited facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '134',
      name: 'Bia National Park',
      region: 'Western',
      category: 'natural',
      imageUrl: 'https://i.pinimg.com/736x/62/14/cc/6214cc5c3b5e9e8a2a4c3c1f1c2e4e3b.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/3f/4e/ab/3f4eab7c8e5a2b9e3c7f1a4d2e8c3b7a.jpg',
        'https://i.pinimg.com/736x/2a/55/1e/2a551ef2c7b9c2f1a8e4e3b5c9f3d7a6.jpg',
        'https://i.pinimg.com/736x/77/9f/aa/779faa2e7b5d1a2c7e3d1f4b7c3e9a2b.jpg',
        'https://i.pinimg.com/736x/55/6c/7d/556c7d1a9c2f3b5e8a1f7c4d2a3e6b9c.jpg',
        'https://i.pinimg.com/736x/0d/0c/ba/0d0cba3b7e9c2f5a1d7e8b4a3c7e2d6b.jpg'
      ],
      description:
      'Bia National Park is a protected rainforest reserve rich in wildlife and bird species.',
      latitude: 6.4667,
      longitude: -2.6833,
      address: 'Bia District, Western Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 25',
      rating: 4.6,
      distanceKm: 620,
      bestTimeToVisit: 'May – October',
      pros: [
        'Rich biodiversity',
        'Bird watching',
        'Eco tourism'
      ],
      cons: [
        'Remote location',
        'Limited accommodation'
      ],
      youtubeVideoId: ''
  ),

  // WESTERN NORTH REGION

  TouristSite(
      id: '151',
      name: 'Bia National Park',
      region: 'Western North',
      category: 'natural',
      imageUrl: 'https://i.pinimg.com/736x/5d/70/35/5d7035f7e6a0c53a7a8bbd7b2c2c4d71.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/6a/2d/89/6a2d8967c7d8c1b21c8cfc7c9b1c46d7.jpg',
        'https://i.pinimg.com/736x/1b/53/9c/1b539c4d5b4d68b0e4a8c5e4f2e3a6c1.jpg',
        'https://i.pinimg.com/736x/87/3f/64/873f6403c92cdeac6c5e60d1b6f2f1b7.jpg',
        'https://i.pinimg.com/736x/42/9d/6f/429d6f7b4c3e9a2e7b4c3a2e5c8f3b2d.jpg',
        'https://i.pinimg.com/736x/c7/4f/2a/c74f2a9c5c3e7b4a3e9c5d6a2b4f1e8c.jpg'
      ],
      description:
      'Bia National Park is a protected rainforest reserve known for its wildlife, bird species, and dense tropical forest ecosystem.',
      latitude: 6.4667,
      longitude: -2.6833,
      address: 'Bia West District, Western North Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 25',
      rating: 4.7,
      distanceKm: 610,
      bestTimeToVisit: 'May – October',
      pros: [
        'Rich biodiversity',
        'Excellent bird watching',
        'Beautiful rainforest scenery'
      ],
      cons: [
        'Remote location',
        'Limited tourist facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '152',
      name: 'Sefwi Wiawso Forest Reserve',
      region: 'Western North',
      category: 'natural',
      imageUrl: 'https://i.pinimg.com/736x/3b/5e/b4/3b5eb48c71c0c2a0a7e2f2d3c1b7a8e2.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/7e/51/4a/7e514a2f5c2d8a7b3e9c1f4a2e6b3c1d.jpg',
        'https://i.pinimg.com/736x/2f/41/9c/2f419c6e3b4f7a1e5c9d2b3c7e1f2d4a.jpg',
        'https://i.pinimg.com/736x/8a/0c/41/8a0c41b2d9f5c7e3a2b1d6e4f3c9b1a2.jpg',
        'https://i.pinimg.com/736x/1f/72/88/1f7288c4a3e7c2b5f1d6a8e2b3c4f7d1.jpg',
        'https://i.pinimg.com/736x/b3/41/5c/b3415c2e7a3b6f1c2e9a4b7c3d5f1e6a.jpg'
      ],
      description:
      'A large forest reserve with rich vegetation and wildlife, providing opportunities for eco-tourism and nature exploration.',
      latitude: 6.2167,
      longitude: -2.4833,
      address: 'Sefwi Wiawso, Western North Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 15',
      rating: 4.5,
      distanceKm: 590,
      bestTimeToVisit: 'November – March',
      pros: [
        'Dense tropical forest',
        'Nature walks',
        'Wildlife sightings'
      ],
      cons: [
        'Poor road access',
        'Limited visitor facilities'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '153',
      name: 'Bibiani Gold Mine Area',
      region: 'Western North',
      category: 'industrial',
      imageUrl: 'https://i.pinimg.com/736x/4e/64/79/4e6479e9a2d7c5a4c8b6f1a3d5c7e2b1.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/7a/82/91/7a8291e2c4d6f3a1b7c9d5e2f3c7a1b2.jpg',
        'https://i.pinimg.com/736x/5c/34/81/5c3481c7a9e2d4f3a1c7b2e4f8d3c5a6.jpg',
        'https://i.pinimg.com/736x/9e/74/6a/9e746a2b7c1e3d5a6f2b4c7e8a1d3c9b.jpg',
        'https://i.pinimg.com/736x/2b/19/54/2b1954d7a1e4f3b2c9a6e5d3f1b7c2e4.jpg',
        'https://i.pinimg.com/736x/3f/88/41/3f8841c5e2a6b7d4f1c3e9a7b2d4c6e1.jpg'
      ],
      description:
      'Bibiani is known for its historic gold mining activities and remains an important mining town in Ghana.',
      latitude: 6.4630,
      longitude: -2.3190,
      address: 'Bibiani, Western North Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'Restricted access',
      rating: 4.3,
      distanceKm: 570,
      bestTimeToVisit: 'All year round',
      pros: [
        'Historic mining town',
        'Educational insight into mining',
        'Important economic site'
      ],
      cons: [
        'Restricted areas',
        'Industrial environment'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '154',
      name: 'Sefwi Bekwai Traditional Area',
      region: 'Western North',
      category: 'cultural',
      imageUrl: 'https://i.pinimg.com/736x/4d/92/6f/4d926f3b1a8e3c7d5b2f4a9e6c3d7a1f.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/3c/71/5e/3c715e9a6b4d7f1a3e9c2d5b7a1f4e3d.jpg',
        'https://i.pinimg.com/736x/9b/65/44/9b6544a7c1d2e3f6a9b7c5e3d1a8f4b6.jpg',
        'https://i.pinimg.com/736x/2c/87/1f/2c871fa9e6d3c4b7a1f5e9d2b3c7a4e6.jpg',
        'https://i.pinimg.com/736x/8e/33/29/8e3329d5c6a1f4b3e9d2c7a6f1b5c3e7.jpg',
        'https://i.pinimg.com/736x/5a/40/6d/5a406db3c9a2e7f1d4b6c3e9a2f5d1b7.jpg'
      ],
      description:
      'Sefwi Bekwai is a historic traditional town known for its rich culture, festivals, and local traditions.',
      latitude: 6.2833,
      longitude: -2.7167,
      address: 'Sefwi Bekwai, Western North Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'Free',
      rating: 4.2,
      distanceKm: 600,
      bestTimeToVisit: 'Festival seasons',
      pros: [
        'Rich cultural traditions',
        'Colorful festivals',
        'Friendly community'
      ],
      cons: [
        'Limited tourist facilities',
        'Few guided tours'
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