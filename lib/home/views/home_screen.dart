// import 'package:flutter/material.dart';
// import 'package:ghana_tourism_app/home/models/tourst_site.dart';
// import 'site_detail_screen.dart';
//
// class ExploreScreen extends StatefulWidget {
//   const ExploreScreen({super.key});
//
//   @override
//   State<ExploreScreen> createState() => _ExploreScreenState();
// }
//
// class _ExploreScreenState extends State<ExploreScreen> {
//   // ── Constants ────────────────────────────────────────────────────────────
//   static const _gold = Color(0xFFFCD116);
//   static const _red = Color(0xFFCE1126);
//   static const _green = Color(0xFF006B3F);
//   static const _bg = Color(0xFFFFF8E7);
//   static const _cardDark = Color(0xFF1A1A2E);
//
//   // ── State ─────────────────────────────────────────────────────────────────
//   final TextEditingController _searchController = TextEditingController();
//   final FocusNode _searchFocus = FocusNode();
//
//   String _selectedCategory = 'all'; // 'all' | 'nature' | 'artificial'
//   String _selectedRegion = '';
//   String _searchQuery = '';
//   bool _showDropdown = false;
//
//   // ── Computed ──────────────────────────────────────────────────────────────
//   List<String> get _filteredRegions {
//     final q = _searchQuery.toLowerCase();
//     if (q.isEmpty) return ghanaRegions;
//     return ghanaRegions.where((r) => r.toLowerCase().contains(q)).toList();
//   }
//
//   List<TouristSite> get _filteredSites {
//     return ghanaTopSites.where((site) {
//       final matchesCategory =
//           _selectedCategory == 'all' || site.category == _selectedCategory;
//       final matchesRegion =
//           _selectedRegion.isEmpty || site.region == _selectedRegion;
//       final matchesSearch = _searchQuery.isEmpty ||
//           site.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
//           site.region.toLowerCase().contains(_searchQuery.toLowerCase());
//       return matchesCategory && matchesRegion && matchesSearch;
//     }).toList();
//   }
//
//   // ── Lifecycle ─────────────────────────────────────────────────────────────
//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(() {
//       setState(() => _searchQuery = _searchController.text);
//     });
//   }
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     _searchFocus.dispose();
//     super.dispose();
//   }
//
//   // ── Dropdown logic ────────────────────────────────────────────────────────
//   void _openDropdown() => setState(() => _showDropdown = true);
//
//   void _selectRegion(String region) {
//     setState(() {
//       _selectedRegion = region;
//       _searchQuery = '';
//       _showDropdown = false;
//       _searchController.clear();
//     });
//     _searchFocus.unfocus();
//   }
//
//   void _clearRegion() {
//     setState(() {
//       _selectedRegion = '';
//       _searchQuery = '';
//       _showDropdown = false;
//       _searchController.clear();
//     });
//   }
//
//   void _closeDropdown() {
//     setState(() => _showDropdown = false);
//     _searchFocus.unfocus();
//   }
//
//   // ── UI ────────────────────────────────────────────────────────────────────
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: _closeDropdown,
//       child: Scaffold(
//         backgroundColor: _bg,
//         body: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildHeader(),
//               Expanded(
//                 child: SingleChildScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 24),
//                       _buildCategoryFilter(),
//                       const SizedBox(height: 28),
//                       _buildSitesGrid(),
//                       const SizedBox(height: 32),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // ── Header (title + search + inline dropdown) ─────────────────────────────
//   Widget _buildHeader() {
//     final regions = _filteredRegions;
//     return Container(
//       padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
//       decoration: BoxDecoration(
//         color: _gold,
//         borderRadius: BorderRadius.vertical(
//           bottom: Radius.circular(_showDropdown ? 0 : 28),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // ── Title row ───────────────────────────────────────────────────
//           Row(
//             children: [
//               const Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Discover',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Color(0xFF7A5C00),
//                         letterSpacing: 1.2,
//                       ),
//                     ),
//                     Text(
//                       'Ghana 🇬🇭',
//                       style: TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.w900,
//                         color: _cardDark,
//                         height: 1.1,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               if (_selectedRegion.isNotEmpty)
//                 GestureDetector(
//                   onTap: _clearRegion,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 12, vertical: 6),
//                     decoration: BoxDecoration(
//                       color: _red,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           _selectedRegion,
//                           style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         const SizedBox(width: 4),
//                         const Icon(Icons.close,
//                             size: 14, color: Colors.white),
//                       ],
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//           const SizedBox(height: 16),
//
//           // ── Search bar ──────────────────────────────────────────────────
//           Container(
//             height: 52,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.08),
//                   blurRadius: 12,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 const SizedBox(width: 16),
//                 Icon(Icons.search_rounded,
//                     color: Colors.grey.shade400, size: 22),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: TextField(
//                     controller: _searchController,
//                     focusNode: _searchFocus,
//                     onTap: _openDropdown,
//                     style: const TextStyle(
//                         fontSize: 15, fontWeight: FontWeight.w500),
//                     decoration: InputDecoration(
//                       hintText: 'Search sites, regions...',
//                       hintStyle: TextStyle(
//                           color: Colors.grey.shade400, fontSize: 15),
//                       border: InputBorder.none,
//                       isDense: true,
//                     ),
//                   ),
//                 ),
//                 if (_searchController.text.isNotEmpty)
//                   GestureDetector(
//                     onTap: _clearRegion,
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 12),
//                       child: Icon(Icons.close,
//                           color: Colors.grey.shade400, size: 20),
//                     ),
//                   ),
//                 GestureDetector(
//                   onTap: () =>
//                   _showDropdown ? _closeDropdown() : _openDropdown(),
//                   child: Padding(
//                     padding: const EdgeInsets.only(right: 14),
//                     child: AnimatedRotation(
//                       turns: _showDropdown ? 0.5 : 0,
//                       duration: const Duration(milliseconds: 200),
//                       child: Icon(Icons.keyboard_arrow_down_rounded,
//                           color: Colors.grey.shade500, size: 22),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // ── Inline dropdown list ────────────────────────────────────────
//           AnimatedCrossFade(
//             duration: const Duration(milliseconds: 200),
//             crossFadeState: _showDropdown
//                 ? CrossFadeState.showSecond
//                 : CrossFadeState.showFirst,
//             firstChild: const SizedBox.shrink(),
//             secondChild: Container(
//               margin: const EdgeInsets.only(top: 8),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 12,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(maxHeight: 220),
//                   child: regions.isEmpty
//                       ? const Padding(
//                     padding: EdgeInsets.all(16),
//                     child: Text('No regions found',
//                         style: TextStyle(color: Colors.grey)),
//                   )
//                       : ListView.separated(
//                     padding: const EdgeInsets.symmetric(vertical: 6),
//                     shrinkWrap: true,
//                     itemCount: regions.length,
//                     separatorBuilder: (_, __) => Divider(
//                         height: 1, color: Colors.grey.shade100),
//                     itemBuilder: (context, index) {
//                       final region = regions[index];
//                       final isSelected = region == _selectedRegion;
//                       return ListTile(
//                         dense: true,
//                         leading: Icon(Icons.location_on_outlined,
//                             size: 18,
//                             color: isSelected ? _red : Colors.grey),
//                         title: Text(
//                           region,
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: isSelected
//                                 ? FontWeight.w700
//                                 : FontWeight.w500,
//                             color: isSelected ? _red : _cardDark,
//                           ),
//                         ),
//                         trailing: isSelected
//                             ? const Icon(Icons.check_rounded,
//                             size: 16, color: _red)
//                             : null,
//                         onTap: () => _selectRegion(region),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ── Category filter ───────────────────────────────────────────────────────
//   Widget _buildCategoryFilter() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Category',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w800,
//               color: _cardDark,
//             ),
//           ),
//           const SizedBox(height: 14),
//           Row(
//             children: [
//               _buildCategoryChip(
//                 label: 'All',
//                 icon: Icons.grid_view_rounded,
//                 value: 'all',
//                 color: _gold,
//               ),
//               const SizedBox(width: 12),
//               _buildCategoryChip(
//                 label: 'Nature',
//                 icon: Icons.forest_rounded,
//                 value: 'nature',
//                 color: const Color(0xFF4CAF50),
//               ),
//               const SizedBox(width: 12),
//               _buildCategoryChip(
//                 label: 'Artificial',
//                 icon: Icons.account_balance_rounded,
//                 value: 'artificial',
//                 color: _red,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCategoryChip({
//     required String label,
//     required IconData icon,
//     required String value,
//     required Color color,
//   }) {
//     final isSelected = _selectedCategory == value;
//     return GestureDetector(
//       onTap: () => setState(() => _selectedCategory = value),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         decoration: BoxDecoration(
//           color: isSelected ? color : Colors.white,
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(
//             color: isSelected ? color : Colors.grey.shade200,
//             width: 1.5,
//           ),
//           boxShadow: isSelected
//               ? [
//             BoxShadow(
//               color: color.withOpacity(0.3),
//               blurRadius: 8,
//               offset: const Offset(0, 3),
//             )
//           ]
//               : [],
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(icon,
//                 size: 18,
//                 color: isSelected
//                     ? (value == 'all' ? _cardDark : Colors.white)
//                     : Colors.grey.shade500),
//             const SizedBox(width: 6),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w700,
//                 color: isSelected
//                     ? (value == 'all' ? _cardDark : Colors.white)
//                     : Colors.grey.shade600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // ── Sites Grid ────────────────────────────────────────────────────────────
//   Widget _buildSitesGrid() {
//     final sites = _filteredSites;
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'Tourist Sites',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w800,
//                   color: _cardDark,
//                 ),
//               ),
//               Text(
//                 '${sites.length} places',
//                 style: TextStyle(
//                   fontSize: 13,
//                   color: Colors.grey.shade500,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 14),
//           if (sites.isEmpty)
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 48),
//                 child: Column(
//                   children: [
//                     Icon(Icons.search_off_rounded,
//                         size: 48, color: Colors.grey.shade300),
//                     const SizedBox(height: 12),
//                     Text(
//                       'No sites found',
//                       style: TextStyle(
//                           color: Colors.grey.shade400,
//                           fontWeight: FontWeight.w600),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           else
//             GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 14,
//                 mainAxisSpacing: 14,
//                 childAspectRatio: 0.78,
//               ),
//               itemCount: sites.length,
//               itemBuilder: (context, index) => _buildSiteCard(sites[index]),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSiteCard(TouristSite site) {
//     final isNature = site.category == 'nature';
//     return GestureDetector(
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(builder: (_) => SiteDetailScreen(site: site)),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.07),
//               blurRadius: 12,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Image
//             Expanded(
//               child: ClipRRect(
//                 borderRadius:
//                 const BorderRadius.vertical(top: Radius.circular(20)),
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     Image.network(
//                       site.imageUrl,
//                       fit: BoxFit.cover,
//                       errorBuilder: (_, __, ___) => Container(
//                         color: isNature
//                             ? const Color(0xFFE8F5E9)
//                             : const Color(0xFFFCE4E4),
//                         child: Icon(
//                           isNature
//                               ? Icons.forest_rounded
//                               : Icons.account_balance_rounded,
//                           size: 40,
//                           color: isNature ? _green : _red,
//                         ),
//                       ),
//                     ),
//                     // Category badge
//                     Positioned(
//                       top: 10,
//                       right: 10,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: isNature ? _green : _red,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Text(
//                           isNature ? 'Nature' : 'Artificial',
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 10,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // Info
//             Padding(
//               padding: const EdgeInsets.all(12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     site.name,
//                     style: const TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w800,
//                       color: _cardDark,
//                       height: 1.2,
//                     ),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 4),
//                   Row(
//                     children: [
//                       Icon(Icons.location_on_rounded,
//                           size: 12, color: _red.withOpacity(0.8)),
//                       const SizedBox(width: 3),
//                       Expanded(
//                         child: Text(
//                           site.distanceKm != null
//                               ? '${site.distanceKm!.toStringAsFixed(0)}km · ${site.region}'
//                               : site.region,
//                           style: TextStyle(
//                             fontSize: 11,
//                             color: Colors.grey.shade500,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:ghana_tourism_app/ai/scan_screen.dart';
import 'package:ghana_tourism_app/home/models/tourst_site.dart';
import 'site_detail_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  // ── Constants ────────────────────────────────────────────────────────────
  static const _gold = Color(0xFFFCD116);
  static const _red = Color(0xFFCE1126);
  static const _green = Color(0xFF006B3F);
  static const _bg = Color(0xFFFFF8E7);
  static const _cardDark = Color(0xFF1A1A2E);

  // ── State ─────────────────────────────────────────────────────────────────
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  String _selectedCategory = 'all'; // 'all' | 'nature' | 'artificial'
  String _selectedRegion = '';
  String _searchQuery = '';
  bool _showDropdown = false;

  // ── Computed ──────────────────────────────────────────────────────────────
  List<String> get _filteredRegions {
    final q = _searchQuery.toLowerCase();
    if (q.isEmpty) return ghanaRegions;
    return ghanaRegions.where((r) => r.toLowerCase().contains(q)).toList();
  }

  List<TouristSite> get _filteredSites {
    return ghanaTopSites.where((site) {
      final matchesCategory =
          _selectedCategory == 'all' || site.category == _selectedCategory;
      final matchesRegion =
          _selectedRegion.isEmpty || site.region == _selectedRegion;
      final matchesSearch = _searchQuery.isEmpty ||
          site.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          site.region.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesRegion && matchesSearch;
    }).toList();
  }

  // ── Lifecycle ─────────────────────────────────────────────────────────────
  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() => _searchQuery = _searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  // ── Dropdown logic ────────────────────────────────────────────────────────
  void _openDropdown() => setState(() => _showDropdown = true);

  void _selectRegion(String region) {
    setState(() {
      _selectedRegion = region;
      _searchQuery = '';
      _showDropdown = false;
      _searchController.clear();
    });
    _searchFocus.unfocus();
  }

  void _clearRegion() {
    setState(() {
      _selectedRegion = '';
      _searchQuery = '';
      _showDropdown = false;
      _searchController.clear();
    });
  }

  void _closeDropdown() {
    setState(() => _showDropdown = false);
    _searchFocus.unfocus();
  }

  // ── UI ────────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _closeDropdown,
      child: Scaffold(
        backgroundColor: _bg,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ScanScreen()),
          ),
          backgroundColor: _red,
          icon: const Icon(Icons.document_scanner_rounded,
              color: Colors.white),
          label: const Text('Scan Site',
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700)),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      _buildCategoryFilter(),
                      const SizedBox(height: 28),
                      _buildSitesGrid(),
                      const SizedBox(height: 100), // space for FAB
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Header (title + search + inline dropdown) ─────────────────────────────
  Widget _buildHeader() {
    final regions = _filteredRegions;
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
      decoration: BoxDecoration(
        color: _gold,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(_showDropdown ? 0 : 28),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Title row ───────────────────────────────────────────────────
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Discover',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF7A5C00),
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      'Ghana 🇬🇭',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: _cardDark,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
              if (_selectedRegion.isNotEmpty)
                GestureDetector(
                  onTap: _clearRegion,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _selectedRegion,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.close,
                            size: 14, color: Colors.white),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),

          // ── Search bar ──────────────────────────────────────────────────
          Container(
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Icon(Icons.search_rounded,
                    color: Colors.grey.shade400, size: 22),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    focusNode: _searchFocus,
                    onTap: _openDropdown,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      hintText: 'Search sites, regions...',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade400, fontSize: 15),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
                if (_searchController.text.isNotEmpty)
                  GestureDetector(
                    onTap: _clearRegion,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Icon(Icons.close,
                          color: Colors.grey.shade400, size: 20),
                    ),
                  ),
                GestureDetector(
                  onTap: () =>
                  _showDropdown ? _closeDropdown() : _openDropdown(),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: AnimatedRotation(
                      turns: _showDropdown ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(Icons.keyboard_arrow_down_rounded,
                          color: Colors.grey.shade500, size: 22),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Inline dropdown list ────────────────────────────────────────
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState: _showDropdown
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 220),
                  child: regions.isEmpty
                      ? const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('No regions found',
                        style: TextStyle(color: Colors.grey)),
                  )
                      : ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    shrinkWrap: true,
                    itemCount: regions.length,
                    separatorBuilder: (_, __) => Divider(
                        height: 1, color: Colors.grey.shade100),
                    itemBuilder: (context, index) {
                      final region = regions[index];
                      final isSelected = region == _selectedRegion;
                      return ListTile(
                        dense: true,
                        leading: Icon(Icons.location_on_outlined,
                            size: 18,
                            color: isSelected ? _red : Colors.grey),
                        title: Text(
                          region,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w500,
                            color: isSelected ? _red : _cardDark,
                          ),
                        ),
                        trailing: isSelected
                            ? const Icon(Icons.check_rounded,
                            size: 16, color: _red)
                            : null,
                        onTap: () => _selectRegion(region),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Category filter ───────────────────────────────────────────────────────
  Widget _buildCategoryFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Category',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: _cardDark,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _buildCategoryChip(
                label: 'All',
                icon: Icons.grid_view_rounded,
                value: 'all',
                color: _gold,
              ),
              const SizedBox(width: 12),
              _buildCategoryChip(
                label: 'Nature',
                icon: Icons.forest_rounded,
                value: 'nature',
                color: const Color(0xFF4CAF50),
              ),
              const SizedBox(width: 12),
              _buildCategoryChip(
                label: 'Artificial',
                icon: Icons.account_balance_rounded,
                value: 'artificial',
                color: _red,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip({
    required String label,
    required IconData icon,
    required String value,
    required Color color,
  }) {
    final isSelected = _selectedCategory == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedCategory = value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? color : Colors.grey.shade200,
            width: 1.5,
          ),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            )
          ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                size: 18,
                color: isSelected
                    ? (value == 'all' ? _cardDark : Colors.white)
                    : Colors.grey.shade500),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: isSelected
                    ? (value == 'all' ? _cardDark : Colors.white)
                    : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Sites Grid ────────────────────────────────────────────────────────────
  Widget _buildSitesGrid() {
    final sites = _filteredSites;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tourist Sites',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: _cardDark,
                ),
              ),
              Text(
                '${sites.length} places',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          if (sites.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 48),
                child: Column(
                  children: [
                    Icon(Icons.search_off_rounded,
                        size: 48, color: Colors.grey.shade300),
                    const SizedBox(height: 12),
                    Text(
                      'No sites found',
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            )
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.78,
              ),
              itemCount: sites.length,
              itemBuilder: (context, index) => _buildSiteCard(sites[index]),
            ),
        ],
      ),
    );
  }

  Widget _buildSiteCard(TouristSite site) {
    final isNature = site.category == 'nature';
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SiteDetailScreen(site: site)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Expanded(
              child: ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      site.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: isNature
                            ? const Color(0xFFE8F5E9)
                            : const Color(0xFFFCE4E4),
                        child: Icon(
                          isNature
                              ? Icons.forest_rounded
                              : Icons.account_balance_rounded,
                          size: 40,
                          color: isNature ? _green : _red,
                        ),
                      ),
                    ),
                    // Category badge
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: isNature ? _green : _red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          isNature ? 'Nature' : 'Artificial',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Info
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    site.name,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: _cardDark,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on_rounded,
                          size: 12, color: _red.withOpacity(0.8)),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          site.distanceKm != null
                              ? '${site.distanceKm!.toStringAsFixed(0)}km · ${site.region}'
                              : site.region,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
