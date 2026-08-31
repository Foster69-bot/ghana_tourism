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
    youtubeVideoId: '-CvpE-dYKS4',
  ),

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
    youtubeVideoId: 'aywXVK1D7Ps',
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
    youtubeVideoId: '7RHph9VcBNE'
  ),


  TouristSite(
      id: '11',
      name: 'Cape Coast Castle',
      region: 'Central',
      category: 'artificial',
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
      category: 'artificial',
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
      category: 'nature',
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
      category: 'artificial',
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
      category: 'artificial',
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
      category: 'artificial',
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
      category: 'nature',
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
      category: 'artificial',
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
      category: 'artificial',
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
      category: 'nature',
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
      category: 'nature',
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
      category: 'nature',
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
      id: '26',
      name: 'Bono Manso Slave Market',
      region: 'Bono',
      category: 'artificial',
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
      category: 'artificial',
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
      category: 'artificial',
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




  // AHAFO REGION


  TouristSite(
      id: '32',
      name: 'Mim Timber Market',
      region: 'Ahafo',
      category: 'artificial',
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
      category: 'artificial',
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
      id: '39',
      name: 'Tano River',
      region: 'Ahafo',
      category: 'nature',
      imageUrl: 'https://i.pinimg.com/1200x/08/8e/c1/088ec1b731da92b2bf852c9ba9944d9a.jpg',
      galleryImages: [
        'https://i.pinimg.com/1200x/08/8e/c1/088ec1b731da92b2bf852c9ba9944d9a.jpg',
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
      youtubeVideoId: 'Kl1BslQjpV8'
  ),





  TouristSite(
      id: '45',
      name: 'Ahafo Forest Reserve',
      region: 'Ahafo',
      category: 'nature',
      imageUrl: 'https://i.pinimg.com/736x/4e/c3/20/4ec3203cfed6fa1806a549dc92cc2d29.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/4e/c3/20/4ec3203cfed6fa1806a549dc92cc2d29.jpg',
        'https://i.pinimg.com/736x/b8/b9/4a/b8b94ad2ec8491befc7e59f5f4e7b097.jpg',
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
      id: '48',
      name: 'Kenyasi Mining Heritage Site',
      region: 'Ahafo',
      category: 'artificial',
      imageUrl: 'https://i.pinimg.com/1200x/d2/fc/93/d2fc932725f030fd9f3c695bc2813937.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/5b/23/ec/5b23eca2df57a159948a69005419bf98.jpg',
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
      youtubeVideoId: '-Mp5i9Zhqdg'
  ),






  TouristSite(
      id: '52',
      name: 'Umbrella Rock',
      region: 'Eastern',
      category: 'nature',
      imageUrl: 'https://i.pinimg.com/736x/48/34/73/483473c43638e0d6b95dc3101e53b51a.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/48/34/73/483473c43638e0d6b95dc3101e53b51a.jpg',
        'https://i.pinimg.com/1200x/c2/00/8c/c2008c1c4d4b2499a3f2ceb7b182ba52.jpg'

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
      youtubeVideoId: 'zoZX7Z8-OQY'
  ),

  TouristSite(
      id: '53',
      name: 'Aburi Botanical Gardens',
      region: 'Eastern',
      category: 'nature',
      imageUrl: 'https://i.pinimg.com/736x/57/12/c1/5712c169dbc73fde41bc1894ebf07666.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/57/12/c1/5712c169dbc73fde41bc1894ebf07666.jpg',
        'https://i.pinimg.com/736x/f5/cb/13/f5cb135ef8f9c438ae51a26ad9e304f7.jpg',

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
      youtubeVideoId: 'PIjdEBLGLE0'
  ),

  TouristSite(
      id: '54',
      name: 'Akaa Falls',
      region: 'Eastern',
      category: 'nature',
      imageUrl: 'https://i.pinimg.com/1200x/b9/50/ba/b950ba0ed8c3ab31ec25ea7b1c505f0c.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/04/16/bb/0416bb839da6cbf501efc898bb55b1c1.jpg',
        'https://i.pinimg.com/1200x/b9/50/ba/b950ba0ed8c3ab31ec25ea7b1c505f0c.jpg',
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
      youtubeVideoId: 'oKEvEkQuAT8'
  ),

  TouristSite(
      id: '55',
      name: 'Okomfo Anokye Sword Site',
      region: 'Eastern',
      category: 'artificial',
      imageUrl: 'https://i.pinimg.com/736x/00/96/dc/0096dcd220b7afe89cfbadf0195a942f.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/00/96/dc/0096dcd220b7afe89cfbadf0195a942f.jpg',
        'https://i.pinimg.com/1200x/25/3f/37/253f37a04ed2fc65b5823afb77e4d377.jpg',
        'https://i.pinimg.com/736x/05/4b/97/054b97caae3abe641c807d2b7d871652.jpg'
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
      youtubeVideoId: 'rTGkuxBkhmU'
  ),


  TouristSite(
      id: '57',
      name: 'Akosombo Dam',
      region: 'Eastern',
      category: 'artificial',
      imageUrl: 'https://i.pinimg.com/736x/00/85/61/00856159f0dc3c896100e8d1d7285a51.jpg',
      galleryImages: [
        'https://i.pinimg.com/1200x/02/49/0c/02490c750e1cbfbe3d48a5072c39bda1.jpg',
        'https://i.pinimg.com/1200x/02/49/0c/02490c750e1cbfbe3d48a5072c39bda1.jpg',

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
      youtubeVideoId: 'Pnk5loqaiYM'
  ),

  TouristSite(
      id: '58',
      name: 'Mount Afadja Viewpoints',
      region: 'Eastern',
      category: 'nature',
      imageUrl: 'https://i.pinimg.com/236x/25/ef/02/25ef0269366e36005a7db17d78c66fe2.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/cf/b2/ed/cfb2ede9c95b742d1ae4e1f24a6a7ed3.jpg',
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
      youtubeVideoId: '4rdnIrDxEeo'
  ),





  TouristSite(
      id: '70',
      name: 'Gambaga Escarpment',
      region: 'North East',
      category: 'nature',
      imageUrl: 'https://i.pinimg.com/736x/af/b6/2b/afb62b8d42026bf16a3015b1aad0162b.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/f7/e3/4f/f7e34fb75c68b2c8542cc3af1878417a.jpg',
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
      youtubeVideoId: 'vFFxDfw_pdg'
  ),




  TouristSite(
      id: '73',
      name: 'Mystic Stone (Larabanga)',
      region: 'Northern',
      category: 'nature',
      imageUrl: 'https://i.pinimg.com/736x/32/7c/b9/327cb964f3b517a9b87fd60b83ab2cb6.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/0b/f9/46/0bf9466e963aea00b7dba306c0126367.jpg',
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
      youtubeVideoId: 'iuW7ohjsbfA'
  ),

  TouristSite(
      id: '74',
      name: 'Tamale Cultural Centre',
      region: 'Northern',
      category: 'artificial',
      imageUrl: 'https://i.pinimg.com/1200x/9e/10/a1/9e10a13e7320ad0c22306c8418472563.jpg',
      galleryImages: [
        'https://i.pinimg.com/1200x/ce/6f/c6/ce6fc6a5fb9c34946241b34e5601098a.jpg',
        'https://i.pinimg.com/736x/5e/53/41/5e53417606b5b39044c7902533be0424.jpg'
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
      youtubeVideoId: 'IJZ5tUmPYTA'
  ),





  TouristSite(
      id: '77',
      name: 'Zayaa Mosque (Witch Mosque)',
      region: 'Northern',
      category: 'artificial',
      imageUrl: 'https://i.pinimg.com/736x/c0/88/0e/c0880e10bf16e9bf6f05dcdc02446814.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/c0/88/0e/c0880e10bf16e9bf6f05dcdc02446814.jpg',
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
      youtubeVideoId: '_zX8mfITl94'
  ),





  TouristSite(
      id: '80',
      name: 'Daboya Salt Mining Site',
      region: 'Northern',
      category: 'nature',
      imageUrl: 'https://i.pinimg.com/1200x/4b/c2/af/4bc2af851d41e7212c5dfccb028b2776.jpg',
      galleryImages: [
        'https://i.pinimg.com/1200x/4b/c2/af/4bc2af851d41e7212c5dfccb028b2776.jpg',
        'https://i.pinimg.com/736x/a2/97/b0/a297b02dc5455fca8a2ffd666b7fcbc0.jpg'
        'https://i.pinimg.com/736x/7b/b3/b9/7bb3b952351b9a45944df0b0b737c022.jpg'
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
      youtubeVideoId: 'UhCk2pbIIcI'
  ),

  TouristSite(
      id: '81',
      name: 'Kyabobo National Park',
      region: 'Oti',
      category: 'nature',
      imageUrl: 'https://i.pinimg.com/1200x/7a/fe/e6/7afee63bd94d6bc0d140ea97f632091e.jpg',
      galleryImages: [
        'https://i.pinimg.com/1200x/7a/fe/e6/7afee63bd94d6bc0d140ea97f632091e.jpg',
        'https://i.pinimg.com/736x/8d/14/b6/8d14b691ba59acc91f8b05d30e257dab.jpg',
        'https://i.pinimg.com/1200x/6a/65/f6/6a65f6eeb8af2163efbfd9608c7ea815.jpg'
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
      youtubeVideoId: 'N_H1j5LLn4M'
  ),

  TouristSite(
      id: '82',
      name: 'Wli Waterfalls (Upper Access via Oti Route)',
      region: 'Oti Region',
      category: 'nature',
      imageUrl: 'https://i.pinimg.com/736x/fc/46/2b/fc462be29e64f44a4ae2821cb2e1d566.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/fc/46/2b/fc462be29e64f44a4ae2821cb2e1d566.jpg',
        'https://i.pinimg.com/736x/56/f0/28/56f028cca8545487a6ccae7bf894641b.jpg',
        'https://i.pinimg.com/736x/55/c9/b1/55c9b189fbc3d5395bdd580bf450cae1.jpg'
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
      youtubeVideoId: '6oqJynPNYZs'
  ),


  TouristSite(
      id: '84',
      name: 'Amedzofe Forest Trail Extension (Oti Access)',
      region: 'Oti Region',
      category: 'nature',
      imageUrl: 'https://i.pinimg.com/1200x/4a/53/12/4a53120378ba218aa9a46c7d63b9247e.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/82/da/4a/82da4aa4a2661630f9e254205f99dd91.jpg',
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
      youtubeVideoId: 'RZOLxJBM_UA'
  ),


  TouristSite(
      id: '86',
      name: 'Togbo Waterfalls',
      region: 'Oti Region',
      category: 'nature',
      imageUrl: 'https://i.pinimg.com/1200x/3b/12/c9/3b12c9e933624c3ca7e428d70a4860aa.jpg',
      galleryImages: [
        'https://i.pinimg.com/1200x/3b/12/c9/3b12c9e933624c3ca7e428d70a4860aa.jpg',
        'https://i.pinimg.com/1200x/f1/ca/45/f1ca4570e3e48217379130640cf37a5d.jpg'
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
      youtubeVideoId: 'vAT8VbL6XIE'
  ),





  TouristSite(
      id: '90',
      name: 'Oti River Basin Landscape',
      region: 'Oti',
      category: 'nature',
      imageUrl: 'https://i.pinimg.com/236x/6d/c5/ae/6dc5aea7bc6f65c0b4d2267194817425.jpg',
      galleryImages: [
        'https://i.pinimg.com/236x/6d/c5/ae/6dc5aea7bc6f65c0b4d2267194817425.jpg',
        'https://i.pinimg.com/1200x/eb/62/ed/eb62ed471a731b7fe4fa2d007536ef81.jpg'
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
      youtubeVideoId: 'yuzsSuv9IbM'
  ),




  TouristSite(
      id: '101',
      name: 'Paga Crocodile Pond',
      region: 'Upper East',
      category: 'nature',
      imageUrl: 'https://i.pinimg.com/1200x/02/6a/83/026a8387b2ff07334f44dbd24d17803c.jpg',
      galleryImages: [
        'https://i.pinimg.com/1200x/02/6a/83/026a8387b2ff07334f44dbd24d17803c.jpg',
        'https://i.pinimg.com/1200x/20/de/8b/20de8bc5571ec86758104c4c4c7720b4.jpg'
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
      youtubeVideoId: 'MHGXNDTExJY'
  ),



  TouristSite(
      id: '103',
      name: 'Tongo Hills',
      region: 'Upper East',
      category: 'nature',
      imageUrl: 'https://commons.wikimedia.org/wiki/File:Packed_rocks_at_Tongo_Hills.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/File:Tongo_hills_view_55.jpg',
        'https://commons.wikimedia.org/wiki/File:Packed_rocks_at_Tongo_Hills.jpg',
        'https://commons.wikimedia.org/wiki/File:Tongo_hills_view_55.jpg'
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
      youtubeVideoId: 'qsCg-sHXQNY'
  ),

  TouristSite(
      id: '104',
      name: 'Sirigu Wall Paintings Village',
      region: 'Upper East',
      category: 'artificial',
      imageUrl: 'https://i.pinimg.com/736x/55/e3/49/55e3492b1de919ff1919a3a48dd951c6.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/55/e3/49/55e3492b1de919ff1919a3a48dd951c6.jpg',
        'https://i.pinimg.com/736x/27/6a/31/276a3129beb2ec2ef35cf7bd84ed4079.jpg'
        'https://i.pinimg.com/1200x/96/e7/c2/96e7c2a2af85af4340118147528d5985.jpg'
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
      youtubeVideoId: 'SsfztMrZZMM'
  ),



  TouristSite(
      id: '107',
      name: 'Pikworo Slave Camp',
      region: 'Upper East',
      category: 'historical',
      imageUrl: 'https://commons.wikimedia.org/wiki/Special:FilePath/Pikworo%20slave%20camp%202.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/Special:FilePath/Pikworo%20slave%20camp%202.jpg',
        'https://commons.wikimedia.org/wiki/Special:FilePath/Pikworo%20slave%20camp%205.jpg',
        'https://commons.wikimedia.org/wiki/Special:FilePath/Pikworo%20slave%20camp%208.jpg',
        'https://commons.wikimedia.org/wiki/Special:FilePath/Meeting%20point%20of%20slaves%20at%20the%20Pikworo%20slave%20camp.jpg',
      ],
      description:
      'Pikworo Slave Camp, established in 1704 near Paga Nania, was a key inland transit centre in the trans-Saharan and trans-Atlantic slave trade.',
      latitude: 10.9633,   // corrected from 10.9000 — verified via Wikidata (10°57'48"N)
      longitude: -1.1167,  // corrected from -1.1000 — verified via Wikidata (1°7'0"W)
      address: 'Paga Nania, Upper East Region, Ghana',
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
      name: 'White Volta River (Pwalugu, Upper East)',
      region: 'Upper East',
      category: 'natural',
      imageUrl: 'https://commons.wikimedia.org/wiki/Special:FilePath/The%20white%20Volta%20in%20the%20North%20east%20region%20of%20Northern%20Ghana.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/Special:FilePath/The%20white%20Volta%20in%20the%20North%20east%20region%20of%20Northern%20Ghana.jpg',
      ],
      description:
      'The White Volta flows through the Upper East Region near Pwalugu, supporting farming and fishing communities along its banks.',
      latitude: 10.5856,   // corrected — Pwalugu Bridge point on the White Volta, Wikipedia-verified
      longitude: -0.8417,
      address: 'Pwalugu, Upper East Region, Ghana',
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
      youtubeVideoId: 'YAn0ETR4iLg'
  ),





  TouristSite(
      id: '113',
      name: 'Gwollu Slave Defence Wall',
      region: 'Upper West',
      category: 'historical',
      imageUrl: 'https://commons.wikimedia.org/wiki/Special:FilePath/Gwollu%20Slave%20Trade%20Defence%20Wall%20in%20Upper%20East%20Region%20of%20Ghana%2001.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/Special:FilePath/Gwollu%20Slave%20Trade%20Defence%20Wall%20in%20Upper%20East%20Region%20of%20Ghana%2001.jpg',
        'https://commons.wikimedia.org/wiki/Special:FilePath/Gwollu%20Slave%20Trade%20Defence%20Wall%20in%20Upper%20East%20Region%20of%20Ghana%2002.jpg',
      ],
      description:
      'Built in the 19th century by Kuoro Tanjia, this double-ringed mud wall protected Gwollu residents from slave raiders Babatu and Samori.',
      latitude: 10.9807,   // corrected from 10.3000 — Wikidata-verified (10°58\'50"N), your original was ~80km off
      longitude: -2.2192,  // corrected from -2.7200
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
      youtubeVideoId: '6kKgs-6dc-g'
  ),






  TouristSite(
      id: '116',
      name: 'Black Volta River (Upper West Section)',
      region: 'Upper West',
      category: 'natural',
      imageUrl: 'https://commons.wikimedia.org/wiki/File:Black_Volta_River.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/File:The_beautiful_black_Volta_(Ghana).jpg',
        'https://commons.wikimedia.org/wiki/File:Black_Volta_River.jpg',
        'https://commons.wikimedia.org/wiki/File:Ada,_Volta_River.jpg'
      ],
      description:
      'The Black Volta forms part of Ghana\'s border with Burkina Faso and Côte d\'Ivoire, supporting fishing and farming communities.',
      latitude: 9.900,
      longitude: -2.600,
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
      youtubeVideoId: 'wXcXRfn2De8'
  ),


  TouristSite(
      id: '123',
      name: 'Tafi Atome Monkey Sanctuary',
      region: 'Volta',
      category: 'natural',
      imageUrl: 'https://commons.wikimedia.org/wiki/File:Tafi_Atome_Monkey_Sanctuary_6.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/File:Tafi_Atome_Monkey_Sanctuary_23.jpg',
        'https://commons.wikimedia.org/wiki/File:Tafi_Atome_Monkey_Sanctuary_6.jpg',
        'https://commons.wikimedia.org/wiki/File:Tafi_Atome_Monkey_Sanctuary_23.jpg'
      ],
      description:
      'A sacred forest where Mona monkeys have lived freely and protected by the local community for over 200 years.',
      latitude: 6.9500,   // corrected from 7.0660 — Tafi Atome is south of Hohoe, closer to Logba/Gbi area
      longitude: 0.3833,  // corrected from 0.3160
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
      youtubeVideoId: 'X2gIELADTpA'
  ),



  TouristSite(
      id: '125',
      name: 'Tagbo Falls',
      region: 'Volta',
      category: 'natural',
      imageUrl: 'https://commons.wikimedia.org/wiki/Special:FilePath/Tagbo%20Falls.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/Special:FilePath/Tagbo%20Falls.jpg',
      ],
      description:
      'Tagbo Falls is a mossy, multi-tiered waterfall near Liati Wote village, close to Mount Afadja.',
      latitude: 7.0400,   // corrected from 7.1525 — brought in line with Liati Wote / Afadja area
      longitude: 0.6100,  // corrected from 0.6090
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
      youtubeVideoId: 'vDLMMsGr6Ok'
  ),

  TouristSite(
      id: '126',
      name: 'Keta Lagoon',
      region: 'Volta',
      category: 'natural',
      imageUrl: 'https://commons.wikimedia.org/wiki/Special:FilePath/Keta%20Lagoon.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/Special:FilePath/Keta%20Lagoon.jpg',
      ],
      description:
      'Keta Lagoon, a Ramsar wetland site, is one of the largest lagoons in West Africa, rich in birdlife and traditional fishing culture.',
      latitude: 5.9167,   // matches your original — consistent with Keta town coordinates
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
      youtubeVideoId: '15ktrWHcwGk'
  ),

  TouristSite(
      id: '127',
      name: 'Fort Prinzenstein',
      region: 'Volta',
      category: 'historical',
      imageUrl: 'https://commons.wikimedia.org/wiki/Special:FilePath/Fort%20Prinzenstein.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/Special:FilePath/Fort%20Prinzenstein.jpg',
      ],
      description:
      'Fort Prinzenstein, built by the Danes in 1784, is a UNESCO-listed slave-trade fort — one of the few forts east of the Volta River.',
      latitude: 5.9160,   // matches your original — consistent with Keta coordinates
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
      youtubeVideoId: 'FrTVJ2od9D0'
  ),




  TouristSite(
      id: '130',
      name: 'Tsatsadu Falls',
      region: 'Volta',
      category: 'natural',
      imageUrl: 'https://i.pinimg.com/736x/f3/c8/2e/f3c82e266cdbf8dc91f9abc63ddea66f.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/37/0f/90/370f90677e26c260f305c6547bc407ed.jpg',
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
      youtubeVideoId: 'qzvYZGVrzuE'
  ),



  TouristSite(
      id: '107',
      name: 'Pikworo Slave Camp',
      region: 'Upper East',
      category: 'historical',
      imageUrl: 'https://commons.wikimedia.org/wiki/Special:FilePath/Pikworo%20slave%20camp%202.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/Special:FilePath/Pikworo%20slave%20camp%202.jpg',
        'https://commons.wikimedia.org/wiki/Special:FilePath/Pikworo%20slave%20camp%205.jpg',
        'https://commons.wikimedia.org/wiki/Special:FilePath/Pikworo%20slave%20camp%208.jpg',
        'https://commons.wikimedia.org/wiki/Special:FilePath/Meeting%20point%20of%20slaves%20at%20the%20Pikworo%20slave%20camp.jpg',
      ],
      description:
      'Pikworo Slave Camp, established in 1704 near Paga Nania, was a key inland transit centre in the trans-Saharan and trans-Atlantic slave trade.',
      latitude: 10.9633,   // corrected from 10.9000 — verified via Wikidata (10°57'48"N)
      longitude: -1.1167,  // corrected from -1.1000 — verified via Wikidata (1°7'0"W)
      address: 'Paga Nania, Upper East Region, Ghana',
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
      youtubeVideoId: 'HwK4FEZ9qPg'
  ),

  TouristSite(
      id: '108',
      name: 'White Volta River (Pwalugu, Upper East)',
      region: 'Upper East',
      category: 'natural',
      imageUrl: 'https://commons.wikimedia.org/wiki/Special:FilePath/The%20white%20Volta%20in%20the%20North%20east%20region%20of%20Northern%20Ghana.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/Special:FilePath/The%20white%20Volta%20in%20the%20North%20east%20region%20of%20Northern%20Ghana.jpg',
        'https://commons.wikimedia.org/wiki/File:Nedba_b%C3%A9_k%C3%B4glga_pugin_n_p%C9%A9%CA%8B%CA%8Bgre_White_Volta_Mogre.jpg'
      ],
      description:
      'The White Volta flows through the Upper East Region near Pwalugu, supporting farming and fishing communities along its banks.',
      latitude: 10.5856,   // corrected — Pwalugu Bridge point on the White Volta, Wikipedia-verified
      longitude: -0.8417,
      address: 'Pwalugu, Upper East Region, Ghana',
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
      youtubeVideoId: 'X5uvdKoWwLI'
  ),





  TouristSite(
      id: '111',
      name: 'Wechiau Community Hippo Sanctuary',
      region: 'Upper West',
      category: 'natural',
      imageUrl: 'https://commons.wikimedia.org/wiki/Special:FilePath/Hippopotamus%20amphibius%20Whipsnade%20Zoo.jpg', // generic hippo photo — no verified Wechiau-specific Commons photo exists yet
      galleryImages: [
        'https://commons.wikimedia.org/wiki/Special:FilePath/Hippopotamus%20amphibius%20Whipsnade%20Zoo.jpg',
      ],
      description:
      'Wechiau Community Hippo Sanctuary protects one of the last remaining wild hippopotamus populations in Ghana along a 40km stretch of the Black Volta River.',
      latitude: 9.833,     // corrected from 9.804 — Wikipedia-verified Wechiau town coordinates
      longitude: -2.683,   // corrected from -2.685
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
      youtubeVideoId: 'V8b33J7nog0'
  ),


  // DONE DONE DONE
  TouristSite(
      id: '107',
      name: 'Manhyia Palace Museum',
      region: 'Ashanti',
      category: 'historical',
      imageUrl: 'https://commons.wikimedia.org/wiki/Special:FilePath/Manhyia_Palace_Museum_(Kumasi,_Ghana_2017).jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/Special:FilePath/Manhyia_Palace_Museum_(Kumasi,_Ghana_2017).jpg',
        'https://commons.wikimedia.org/wiki/Special:FilePath/Manhyia_Palace_Museum.jpg',
      ],
      description:
      'The Manhyia Palace Museum is the historic seat of the Asantehene, the king of the Ashanti people, located in Kumasi. The original palace was built by the British in 1925 after demolishing the Aban Palace during the War of the Golden Stool, and was later converted into a museum in 1995. The museum houses an extraordinary collection of royal artefacts including furniture used by past kings, the bronze head of Osei Agyeman Prempeh II, a sketch map of the Asanteman, and the kingdom\'s first television. Life-sized wax effigies of some kings and queens are also on display. The palace complex includes the modern residence of the current Asantehene, Otumfuo Osei Tutu II, and the newly commissioned Jubilee Hall.',
      latitude: 6.7036,
      longitude: -1.6158,
      address: 'Manhyia, Kumasi, Ashanti Region, Ghana',
      openingTime: '09:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 20 (Ghanaians) / GHS 100 (Non-Ghanaians)',
      rating: 4.7,
      distanceKm: 200,
      bestTimeToVisit: 'Year-round (Akwasidae Festival days for cultural experience)',
      pros: [
        'Official palace of the Asantehene (Ashanti King)',
        'Rich collection of royal artefacts and wax effigies',
        'Guided tours with knowledgeable cultural interpreters',
        'Akwasidae Festival celebrations every six weeks',
        'Gift shop with authentic Ashanti crafts'
      ],
      cons: [
        'Photography restrictions inside the museum',
        'Can be closed during royal ceremonies',
        'Limited parking in central Kumasi',
        'Some exhibits lack detailed English labels'
      ],
      youtubeVideoId: 'OfvEFzQKNRE'
  ),

  TouristSite(
      id: '113',
      name: 'Gwollu Slave Defence Wall',
      region: 'Upper West',
      category: 'historical',
      imageUrl: 'https://commons.wikimedia.org/wiki/Special:FilePath/Gwollu%20Slave%20Trade%20Defence%20Wall%20in%20Upper%20East%20Region%20of%20Ghana%2001.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/Special:FilePath/Gwollu%20Slave%20Trade%20Defence%20Wall%20in%20Upper%20East%20Region%20of%20Ghana%2001.jpg',
        'https://commons.wikimedia.org/wiki/Special:FilePath/Gwollu%20Slave%20Trade%20Defence%20Wall%20in%20Upper%20East%20Region%20of%20Ghana%2002.jpg',
      ],
      description:
      'The Gwollu Slave Defence Wall was built in the 19th century by Gwollu Koro Limann as a double-ringed fortification against slave raiders led by the notorious warlords Babatu and Samori. The inner wall protected homes in the community while the outer wall encircled farms and water sources, standing approximately 13 feet tall and 6 feet thick, constructed from mud and grass bricks with triangular loopholes for lookouts. Though neither wall was fully completed, the remaining portion surrounding Gwollu — one of only two surviving slave defence walls in Ghana — stands as a powerful symbol of organised resistance against the transatlantic slave trade, located beside the chief\'s palace near the grave of former president Dr. Hilla Limann.',
      latitude: 10.9811,   // 10°58′52″N — verified from Wikipedia coordinates for Gwollu
      longitude: -2.2211,   // 2°13′16″W — verified from Wikipedia coordinates for Gwollu
      address: 'Gwollu, Sissala West District, Upper West Region, Ghana',
      openingTime: 'Open daily',
      closingTime: 'Open daily',
      entryFee: 'Free (donations welcome for upkeep)',
      rating: 4.3,
      distanceKm: 720,
      bestTimeToVisit: 'November – March',
      pros: [
        'One of only two surviving slave defence walls in Ghana',
        'Powerful symbol of resistance against slave trade',
        'Located beside chief\'s palace with cultural significance',
        'Grave of former president Dr. Hilla Limann nearby',
        'Community-guided tours available',
        'Fenced and roofed preservation section'
      ],
      cons: [
        'Very remote — ~720km from Accra',
        'Road from Wa (~70km) is rough and partially unpaved',
        'No formal visitor centre or guided tour infrastructure',
        'Only partial wall remains standing',
        'Limited accommodation in Gwollu'
      ],
      youtubeVideoId: 'TyrN1lxndJo'
  ),




  TouristSite(
      id: '115',
      name: 'Nandom Cathedral',
      region: 'Upper West',
      category: 'historical',
      imageUrl: 'https://commons.wikimedia.org/wiki/Special:FilePath/Nandom%20Cathedral.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/Special:FilePath/Nandom%20Cathedral.jpg',
      ],
      description:
      'St. Theresa\'s Minor Basilica in Nandom is the largest stone building in West Africa and one of Ghana\'s oldest iconic religious structures. Constructed by Catholic Missionaries of Africa between 1934 and 1936 and consecrated in 1939, the basilica is shaped like a cross from an aerial view with a twin-towered facade inspired by St Peter\'s Cathedral in London, Ontario. Built entirely from rock-hewed blocks carved from the Nandom hills and bonded with high-strength cement imported from Germany, the edifice seats 3,000 to 4,000 worshippers. Its stained glass windows and natural ventilation system — designed decades before green architecture became a concept — fill the interior with coloured light and fresh air without relying on electricity.',
      latitude: 10.8500,   // 10°51′00″N — verified from Wikipedia coordinates for Nandom town
      longitude: -2.7500,   // 2°45′00″W — verified from Wikipedia coordinates for Nandom town
      address: 'Nandom, Nandom Municipal District, Upper West Region, Ghana',
      openingTime: '04:30 AM',
      closingTime: '10:00 PM',
      entryFee: 'Free (donations welcome)',
      rating: 4.6,
      distanceKm: 710,
      bestTimeToVisit: 'March (Feast of St. Theresa) or year-round',
      pros: [
        'Largest stone building in West Africa',
        'Iconic 1930s Gothic-inspired architecture',
        'Stained glass windows with natural coloured lighting',
        'Seats 3,000–4,000 worshippers',
        'Adoration Chapel open 24 hours',
        'Nearby crocodile pond and slave site'
      ],
      cons: [
        'Remote — ~710km from Accra',
        'Limited accommodation options in Nandom',
        'Road conditions from Wa can be challenging',
        'No formal visitor centre or guided tours'
      ],
      youtubeVideoId: 'D6XAWcVhwBE'
  ),

  TouristSite(
      id: '116',
      name: 'Black Volta River (Upper West Section)',
      region: 'Upper West',
      category: 'natural',
      imageUrl: 'https://commons.wikimedia.org/wiki/File:The_beautiful_black_Volta_(Ghana).jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/File:The_beautiful_black_Volta_(Ghana).jpg',
        'https://commons.wikimedia.org/wiki/File:The_Wechiau_Hippopotamus_Sanctuary.jpg'
        'https://commons.wikimedia.org/wiki/File:Black_Volta_River.jpg'
      ],
      description:
      'The Black Volta River in Ghana\'s Upper West Region forms a 40-kilometre stretch of the Wechiau Community Hippo Sanctuary, a community-based eco-tourism project established by local chiefs in 1999. The river is home to one of only two remaining hippopotamus populations in Ghana, alongside over 200 bird species, bats, chameleons, and monitor lizards. Visitors can take guided river safaris by canoe or motorboat to observe hippos in their natural habitat, trek riverside trails, stay overnight in the Hippo Hide Tree House, and experience Lobi culture in nearby communities. The river also serves as the natural border between Ghana and Burkina Faso.',
      latitude: 9.8330,   // 9°50′N — verified from Wikipedia coordinates for Wechiau
      longitude: -2.6830,   // 2°41′W — verified from Wikipedia coordinates for Wechiau
      address: 'Wechiau, Wa West District, Upper West Region, Ghana',
      openingTime: '07:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 15 - 50',
      rating: 4.3,
      distanceKm: 720,
      bestTimeToVisit: 'November – June (dry season for hippos)',
      pros: [
        'One of only two remaining hippo populations in Ghana',
        'Over 200 bird species for birdwatching',
        'Community-based eco-tourism supporting local livelihoods',
        'River safaris by canoe and motorboat',
        'Hippo Hide Tree House for overnight stays',
        'Cultural immersion with Lobi communities'
      ],
      cons: [
        'Remote — ~720km from Accra',
        'Road from Wa to Wechiau is partially unpaved',
        'Hippos are most active at dawn and dusk only',
        'Limited mobile network coverage in the area',
        'Basic accommodation options outside the sanctuary'
      ],
      youtubeVideoId: 'wXcXRfn2De8'
  ),









  // WESTERN REGION

  TouristSite(
      id: '131',
      name: 'Nzulezo Stilt Village',
      region: 'Western',
      category: 'cultural',
      imageUrl: 'https://i.pinimg.com/1200x/6d/c1/40/6dc140954ec84bb899d88ae1c625158f.jpg',
      galleryImages: [
        'https://i.pinimg.com/1200x/26/fc/e3/26fce32fe30b2225092b05a159cddefa.jpg',
        'https://i.pinimg.com/1200x/62/a5/ae/62a5ae61dd2921753099f0d9e2d7fae7.jpg',
        'https://i.pinimg.com/1200x/64/36/dd/6436dd19033df94c22e38ce1ca3c6643.jpg',
        'https://i.pinimg.com/1200x/90/0f/7b/900f7bdbb845e81e0d892acacdac06be.jpg',
        'https://i.pinimg.com/1200x/16/a5/03/16a5031f9b0fbcdbe8bdec5e05ad940b.jpg'

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
      youtubeVideoId: 'vBE82USuQuY'
  ),






  // WESTERN NORTH REGION



  TouristSite(
      id: '152',
      name: 'Sefwi Wiawso Forest Reserve',
      region: 'Western North',
      category: 'natural',
      imageUrl: 'https://i.pinimg.com/736x/61/a6/0a/61a60a52ac7b3894c8937befa94611b6.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/69/f8/43/69f84349cdd43ca553434fd80282600b.jpg',
        'https://i.pinimg.com/736x/4e/c3/20/4ec3203cfed6fa1806a549dc92cc2d29.jpg',
        'https://i.pinimg.com/1200x/23/b2/a2/23b2a21db4bdcfa063bc396286916cd1.jpg',
        'https://i.pinimg.com/736x/01/51/2d/01512de59b231725ae90629273d1be4e.jpg',
        'https://i.pinimg.com/1200x/62/96/c3/6296c33d557240cb0b76aeb1cb9e7619.jpg'
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
      youtubeVideoId: 'KaXPlKejWqU'
  ),

  TouristSite(
      id: '153',
      name: 'Bibiani Gold Mine Area',
      region: 'Western North',
      category: 'industrial',
      imageUrl: 'https://i.pinimg.com/1200x/3c/e5/dd/3ce5ddb3590e0f28eb2c03359aca4491.jpg',
      galleryImages: [
        'https://i.pinimg.com/736x/96/c2/39/96c239af51aab94e7b910f26fa888580.jpg',
        'https://i.pinimg.com/1200x/8d/d4/12/8dd4125c1af80122b34d98ea734c0714.jpg',
        'https://i.pinimg.com/736x/11/32/c9/1132c986a2e803672da34a97a472eeb1.jpg',
        'https://i.pinimg.com/736x/23/69/0c/23690cf2bfd346c1793af444955789a6.jpg',
        'https://i.pinimg.com/736x/17/b2/76/17b276a96a832662f1659f47db1f2432.jpg'
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
      youtubeVideoId: '8wrE8_uL1yQ'
  ),




  // NEW ONES TO BE ADDED

  TouristSite(
      id: '201',
      name: 'Black Star Square (Independence Square)',
      region: 'Greater Accra',
      category: 'artificial',
      imageUrl: 'https://commons.wikimedia.org/wiki/Special:FilePath/Black_Star_Square.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/Special:FilePath/Black_Star_Square.jpg',
        'https://commons.wikimedia.org/wiki/Special:FilePath/Independence_Arch,_Accra.jpg',
      ],
      description:
      'Black Star Square, also known as Independence Square, is Ghana\'s largest public gathering space and the site of the annual Independence Day parade. Completed in 1961 and designed by architect Theo Lawson, the square features three iconic monuments: the Independence Arch, the Liberation Day Monument, and the Black Star Gate. The square can seat 30,000 people and hosts all major national civic and military parades. It stands as the symbolic heart of Ghana\'s independence and pan-African identity.',
      latitude: 5.5476,
      longitude: -0.1926,
      address: 'Independence Avenue, Accra, Greater Accra Region, Ghana',
      openingTime: 'Open 24 hours',
      closingTime: 'Open 24 hours',
      entryFee: 'Free',
      rating: 4.5,
      distanceKm: 3,
      bestTimeToVisit: 'Early morning or late afternoon (avoid official ceremony days)',
      pros: [
        'Ghana\'s largest public square — seats 30,000',
        'Iconic Independence Arch and Black Star Gate monuments',
        'Free entry and open 24 hours',
        'Central location near Kwame Nkrumah Memorial Park',
        'Dramatic photography opportunities'
      ],
      cons: [
        'Closed or restricted during official state ceremonies',
        'Military presence — caution when photographing close-ups',
        'Very hot during midday with limited shade',
        'Can be crowded on national holidays'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '202',
      name: 'Lake Bosomtwe',
      region: 'Ashanti',
      category: 'nature',
      imageUrl: 'https://commons.wikimedia.org/wiki/Special:FilePath/Lake_Bosomtwe.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/Special:FilePath/Lake_Bosomtwe.jpg',
        'https://commons.wikimedia.org/wiki/Special:FilePath/Bosomtwe_Lake_shore.jpg',
      ],
      description:
      'Lake Bosomtwe is Ghana\'s only natural lake and one of only six meteorite impact crater lakes in the world. Formed approximately 1.07 million years ago by a meteor strike, the lake spans about 10.5 kilometres in diameter within a 49 km² crater. Surrounded by 24 villages and lush mountains, it is considered sacred by the Ashanti people, who believe it is where souls of the dead bid farewell to the god Twi. The lake is a UNESCO-designated biosphere reserve and a major weekend getaway destination from Kumasi, offering boat rides, swimming, hiking, and lakeside relaxation.',
      latitude: 6.5056,
      longitude: -1.4092,
      address: 'Abono, Bosomtwe District, Ashanti Region, Ghana',
      openingTime: '06:00 AM',
      closingTime: '06:00 PM',
      entryFee: 'GHS 5 (Ghanaians) / GHS 10 (Non-Ghanaians)',
      rating: 4.6,
      distanceKm: 240,
      bestTimeToVisit: 'Year-round (weekends are busiest)',
      pros: [
        'Ghana\'s only natural lake',
        'One of only six meteorite crater lakes worldwide',
        'UNESCO biosphere reserve',
        'Boat rides, swimming, and hiking available',
        'Surrounded by 24 traditional villages'
      ],
      cons: [
        'Winding, rough road from Kumasi (~35km)',
        'Water levels have been rising, submerging tree trunks',
        'Limited formal tourism infrastructure',
        'No lifeguards — swim at own risk'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '203',
      name: 'Jamestown Lighthouse',
      region: 'Greater Accra',
      category: 'historical',
      imageUrl: 'https://commons.wikimedia.org/wiki/Special:FilePath/Jamestown_Lighthouse.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/Special:FilePath/Jamestown_Lighthouse.jpg',
        'https://commons.wikimedia.org/wiki/Special:FilePath/Jamestown_Accra.jpg',
      ],
      description:
      'The Jamestown Lighthouse is a historic red-and-white striped tower built in the 1930s on the site of a 17th-century British fort in Accra\'s oldest district. Jamestown was the base of colonial government from the 1870s and Ghana\'s second-largest port until 1962. The lighthouse offers panoramic views of the Gulf of Guinea, the fishing harbour, and the old town from its 80-plus step climb. The surrounding district is a vibrant Ga community famous for the annual Chale Wote Street Art Festival, traditional boxing (Bukom), and its rich fishing culture.',
      latitude: 5.5360,
      longitude: -0.2070,
      address: 'Jamestown, Accra, Greater Accra Region, Ghana',
      openingTime: '09:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 10 - 20 (unofficial guide fee)',
      rating: 4.3,
      distanceKm: 5,
      bestTimeToVisit: 'November – March (Chale Wote Festival in August)',
      pros: [
        'Panoramic views of Accra and the Atlantic Ocean',
        'Historic 1930s lighthouse on 17th-century fort site',
        'Vibrant fishing community and street art',
        'Annual Chale Wote Street Art Festival',
        'Close to Ussher Fort and Brazil House'
      ],
      cons: [
        'No official tour guides — unofficial guides approach visitors',
        'Tower interior is somewhat tatty',
        'Steep climb of 80+ steps',
        'Surrounding area has poverty and litter issues'
      ],
      youtubeVideoId: ''
  ),

  TouristSite(
      id: '204',
      name: 'Shai Hills Resource Reserve',
      region: 'Greater Accra',
      category: 'nature',
      imageUrl: 'https://commons.wikimedia.org/wiki/Special:FilePath/Shai_Hills_Resource_Reserve.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/Special:FilePath/Shai_Hills_Resource_Reserve.jpg',
        'https://commons.wikimedia.org/wiki/Special:FilePath/Shai_Hills_rock_formation.jpg',
      ],
      description:
      'Shai Hills Resource Reserve is Ghana\'s most accessible wildlife reserve, located just 50 kilometres north of Accra near the town of Afienya. Covering 51 square kilometres of savannah grassland and rocky hills, the reserve is home to over 30 species of mammals including baboons, kob antelopes, and green monkeys, as well as 175 bird species and 12 butterfly species. The reserve features dramatic granite hills, sacred caves once inhabited by the Shai people, and the seasonal Tsenku Falls. It is a popular day-trip destination for Accra residents and tourists seeking hiking, wildlife viewing, and rock climbing.',
      latitude: 5.8839,
      longitude: 0.0382,
      address: 'Afienya, Greater Accra Region, Ghana',
      openingTime: '08:00 AM',
      closingTime: '05:00 PM',
      entryFee: 'GHS 25 - 80 (varies by nationality and guided tour)',
      rating: 4.4,
      distanceKm: 50,
      bestTimeToVisit: 'November – March',
      pros: [
        'Closest wildlife reserve to Accra (~1 hour drive)',
        'Baboons, kob antelopes, and green monkeys',
        'Dramatic granite hills and sacred caves',
        'Rock climbing and hiking trails',
        'Seasonal Tsenku Falls (250 feet)'
      ],
      cons: [
        'Hourly fee structure can add up for long visits',
        '4x4 recommended for some park roads',
        'Baboons can be aggressive if food is visible',
        'Limited shade — very hot at midday'
      ],
      youtubeVideoId: ''
  ),


  TouristSite(
      id: '208',
      name: 'Ada Foah',
      region: 'Greater Accra',
      category: 'beach',
      imageUrl: 'https://commons.wikimedia.org/wiki/File:Ada_Foah_Beach_1.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/File:Ada_Foah_Beach_1.jpg',
        'https://commons.wikimedia.org/wiki/File:Ada_Foah_Beach_2.jpg',
      ],
      description:
      'Ada Foah is the tourism capital of the Ada East District, nestled between the Volta River and the Atlantic Ocean at Ghana\'s largest estuary. Once a major Danish trading post with the remains of Fort Kongenstein, the town is now famous for water sports, boat cruises around the river islands, sea turtle watching, and long sandy beaches. The Ghana Sailing Club operates on the river, and the annual Asafotufiami Festival in August draws thousands. Ada Foah is a popular weekend getaway from Accra, offering a unique blend of river and ocean experiences.',
      latitude: 5.7830,
      longitude: 0.6330,
      address: 'Ada Foah, Ada East District, Greater Accra Region, Ghana',
      openingTime: 'Open daily',
      closingTime: 'Open daily',
      entryFee: 'Free (activity fees vary)',
      rating: 4.4,
      distanceKm: 100,
      bestTimeToVisit: 'August (Asafotufiami Festival) or November – March',
      pros: [
        'Unique river-ocean estuary location',
        'Boat cruises around Volta River islands',
        'Sea turtle watching (seasonal)',
        'Water sports: sailing, kayaking, canoeing',
        'Only 1.5 hours from Accra'
      ],
      cons: [
        'Fort Kongenstein partially eroded by ocean',
        'Beach erosion is a growing concern',
        'Limited high-quality accommodation',
        'Can be crowded on weekends and holidays'
      ],
      youtubeVideoId: 'ZJzPJgwZvg4'
  ),




  TouristSite(
      id: '210',
      name: 'Osu Castle (Christiansborg Castle)',
      region: 'Greater Accra',
      category: 'historical',
      imageUrl: 'https://commons.wikimedia.org/wiki/Special:FilePath/Christiansborg_Castle.jpg',
      galleryImages: [
        'https://commons.wikimedia.org/wiki/Special:FilePath/Christiansborg_Castle.jpg',
        'https://commons.wikimedia.org/wiki/Special:FilePath/Osu_Castle_Ghana.jpg',
      ],
      description:
      'Osu Castle, also known as Christiansborg Castle, is a 17th-century Danish fortress on the coast of Accra that served as the seat of Ghana\'s government until 2013. Originally built by the Swedes in the 1650s and later expanded by the Danes, Portuguese, Dutch, and British, the castle was a key holding facility during the transatlantic slave trade. After independence, it became the official residence and office of Ghana\'s presidents. In 2017, the castle was converted into a museum and opened to the public, offering guided tours that trace Ghana\'s colonial and post-colonial history through its dungeons, presidential rooms, and oceanfront ramparts.',
      latitude: 5.5300,
      longitude: -0.1800,
      address: 'Osu, Accra, Greater Accra Region, Ghana',
      openingTime: '09:00 AM',
      closingTime: '04:30 PM',
      entryFee: 'GHS 40 (Ghanaians) / GHS 80 (Non-Ghanaians)',
      rating: 4.5,
      distanceKm: 4,
      bestTimeToVisit: 'Year-round (book guided tour in advance)',
      pros: [
        'Former seat of Ghana\'s government until 2013',
        'Converted to museum in 2017',
        'Dungeons and presidential rooms on guided tours',
        'Dramatic oceanfront location in central Accra',
        'Spans 400 years of Ghanaian history'
      ],
      cons: [
        'Restricted access — guided tours only',
        'Photography restrictions inside',
        'Can be closed during state functions',
        'Emotionally heavy slave trade history',
        'Security screening required at entrance'
      ],
      youtubeVideoId: 'ID42ZKSEp20'
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