import 'package:flutter/material.dart';
import 'package:ghana_tourism_app/home/image_viewer_screen.dart';
import 'package:ghana_tourism_app/home/tourst_site.dart';
import 'package:url_launcher/url_launcher.dart';


class SiteDetailScreen extends StatefulWidget {
  final TouristSite site;

  const SiteDetailScreen({super.key, required this.site});

  @override
  State<SiteDetailScreen> createState() => _SiteDetailScreenState();
}

class _SiteDetailScreenState extends State<SiteDetailScreen> {
  static const _gold = Color(0xFFFCD116);
  static const _red = Color(0xFFCE1126);
  static const _green = Color(0xFF006B3F);
  static const _dark = Color(0xFF1A1A2E);
  static const _bg = Color(0xFFFFF8E7);

  bool _isSaved = false;
  bool _showFullDesc = false;

  TouristSite get site => widget.site;

  // ── Launchers ─────────────────────────────────────────────────────────────
  Future<void> _openGoogleMaps() async {
    final uri = Uri.parse(
      'https://www.google.com/maps/dir/?api=1'
          '&destination=${site.latitude},${site.longitude}'
          '&travelmode=driving',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open Google Maps')),
      );
    }
  }

  Future<void> _openYouTube() async {
    if (site.youtubeVideoId == null) return;
    final appUri = Uri.parse('youtube://www.youtube.com/watch?v=${site.youtubeVideoId}');
    final webUri = Uri.parse('https://www.youtube.com/watch?v=${site.youtubeVideoId}');
    if (await canLaunchUrl(appUri)) {
      await launchUrl(appUri);
    } else {
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
    }
  }

  // ── Build ─────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleSection(),
                _buildQuickStats(),
                _buildMapSection(),
                _buildGallerySection(),
                if (site.youtubeVideoId != null) _buildYouTubeSection(),
                _buildDescriptionSection(),
                _buildProsConsSection(),
                _buildVisitorInfo(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  // ── Sliver hero image ─────────────────────────────────────────────────────
  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 320,
      pinned: true,
      backgroundColor: _dark,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            decoration: const BoxDecoration(color: Colors.black45, shape: BoxShape.circle),
            child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () => setState(() => _isSaved = !_isSaved),
            child: Container(
              decoration: const BoxDecoration(color: Colors.black45, shape: BoxShape.circle),
              padding: const EdgeInsets.all(8),
              child: Icon(
                _isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                color: _isSaved ? _gold : Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: 'site_hero_${site.id}',
              child: Image.network(
                site.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image_not_supported, size: 64, color: Colors.grey),
                ),
              ),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87],
                  stops: [0.5, 1.0],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: site.category == 'nature' ? _green : _red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      site.category == 'nature' ? Icons.forest_rounded : Icons.account_balance_rounded,
                      color: Colors.white, size: 14,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      site.category == 'nature' ? 'Nature' : 'Artificial',
                      style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Title ─────────────────────────────────────────────────────────────────
  Widget _buildTitleSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(site.name,
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: _dark, height: 1.15)),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(color: _gold, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Icon(Icons.star_rounded, size: 16, color: _dark),
                    const SizedBox(width: 4),
                    Text(site.rating.toStringAsFixed(1),
                        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: _dark)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on_rounded, size: 16, color: _red),
              const SizedBox(width: 4),
              Expanded(
                child: Text(site.address,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.wb_sunny_rounded, size: 16, color: Colors.orange),
              const SizedBox(width: 4),
              Text('Best time: ${site.bestTimeToVisit}',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }

  // ── Stats pills ───────────────────────────────────────────────────────────
  Widget _buildQuickStats() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        children: [
          _statPill(icon: Icons.access_time_rounded, label: 'Opens', value: site.openingTime, color: _green),
          const SizedBox(width: 10),
          _statPill(icon: Icons.lock_clock_rounded, label: 'Closes', value: site.closingTime, color: _red),
          const SizedBox(width: 10),
          _statPill(
            icon: Icons.confirmation_number_rounded,
            label: 'Entry',
            value: site.entryFee.split('/').first.trim(),
            color: const Color(0xFF7B5EA7),
          ),
        ],
      ),
    );
  }

  Widget _statPill({required IconData icon, required String label, required String value, required Color color}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(height: 6),
            Text(label,
                style: TextStyle(fontSize: 10, color: color.withOpacity(0.7), fontWeight: FontWeight.w600, letterSpacing: 0.5)),
            const SizedBox(height: 2),
            Text(value,
                style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w800),
                maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  // ── Map ───────────────────────────────────────────────────────────────────
  Widget _buildMapSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Getting There', Icons.directions_rounded),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: _openGoogleMaps,
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200,
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 4))],
              ),
              clipBehavior: Clip.hardEdge,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Static map image via OpenStreetMap tile
                  Image.network(
                    'https://maps.geoapify.com/v1/staticmap?style=osm-bright&width=650&height=300&center=lonlat:${site.longitude},${site.latitude}&zoom=12&marker=lonlat:${site.longitude},${site.latitude};color:%23CE1126;size:medium&apiKey=YOUR_API_KEY',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFFDEEAF5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.map_rounded, size: 56, color: Colors.blue.shade300),
                          const SizedBox(height: 8),
                          Text(
                            '${site.latitude.toStringAsFixed(4)}°N, ${site.longitude.abs().toStringAsFixed(4)}°W',
                            style: TextStyle(color: Colors.blue.shade600, fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          Text(site.region, style: TextStyle(color: Colors.blue.shade400, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                  // Bottom gradient
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black54],
                        stops: [0.4, 1.0],
                      ),
                    ),
                  ),
                  // Center pin
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: _red, shape: BoxShape.circle),
                      child: const Icon(Icons.place_rounded, color: Colors.white, size: 24),
                    ),
                  ),
                  // CTA badge
                  Positioned(
                    bottom: 14,
                    left: 0, right: 0,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 8)],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.directions_rounded, size: 16, color: _red),
                            SizedBox(width: 6),
                            Text('Get Directions in Google Maps',
                                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: _dark)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Distance chip
                  if (site.distanceKm != null)
                    Positioned(
                      top: 12, right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: _dark.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text('~${site.distanceKm!.toStringAsFixed(0)} km away',
                            style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Gallery ───────────────────────────────────────────────────────────────
  Widget _buildGallerySection() {
    if (site.galleryImages.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: _sectionTitle('Photo Gallery', Icons.photo_library_rounded),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 20),
              itemCount: site.galleryImages.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ImageViewerScreen(
                        images: site.galleryImages,
                        initialIndex: index,
                        heroTag: 'gallery_${site.id}_$index',
                      ),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      children: [
                        Image.network(
                          site.galleryImages[index],
                          width: 140, height: 140, fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 140, color: Colors.grey.shade200,
                            child: const Icon(Icons.image_not_supported, color: Colors.grey),
                          ),
                        ),
                        Positioned(
                          bottom: 8, right: 8,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(6)),
                            child: const Icon(Icons.open_in_full_rounded, color: Colors.white, size: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ── YouTube ───────────────────────────────────────────────────────────────
  Widget _buildYouTubeSection() {
    final videoId = site.youtubeVideoId!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Watch Video', Icons.play_circle_rounded),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: _openYouTube,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 16, offset: const Offset(0, 6))],
              ),
              clipBehavior: Clip.hardEdge,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://img.youtube.com/vi/$videoId/hqdefault.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey.shade800,
                      child: const Icon(Icons.video_library_rounded, color: Colors.white38, size: 64),
                    ),
                  ),
                  Container(color: Colors.black.withOpacity(0.3)),
                  Center(
                    child: Container(
                      width: 64, height: 64,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF0000),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.red.withOpacity(0.4), blurRadius: 20, spreadRadius: 2)],
                      ),
                      child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 36),
                    ),
                  ),
                  Positioned(
                    bottom: 14, left: 14,
                    child: const Row(
                      children: [
                        Icon(Icons.smart_display_rounded, color: Color(0xFFFF0000), size: 18),
                        SizedBox(width: 6),
                        Text('Watch on YouTube',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Description ───────────────────────────────────────────────────────────
  Widget _buildDescriptionSection() {
    const maxChars = 200;
    final isLong = site.description.length > maxChars;
    final displayText = (!_showFullDesc && isLong)
        ? '${site.description.substring(0, maxChars)}...'
        : site.description;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('About', Icons.info_outline_rounded),
          const SizedBox(height: 12),
          Text(displayText,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700, height: 1.65)),
          if (isLong)
            GestureDetector(
              onTap: () => setState(() => _showFullDesc = !_showFullDesc),
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  _showFullDesc ? 'Show less' : 'Read more',
                  style: const TextStyle(color: _red, fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ── Pros & Cons ───────────────────────────────────────────────────────────
  Widget _buildProsConsSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Pros & Cons', Icons.balance_rounded),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: _green.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: _green.withOpacity(0.2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(children: [
                        Icon(Icons.thumb_up_rounded, size: 16, color: _green),
                        SizedBox(width: 6),
                        Text('Pros', style: TextStyle(fontWeight: FontWeight.w800, color: _green, fontSize: 13)),
                      ]),
                      const SizedBox(height: 10),
                      ...site.pros.map((p) => _proConItem(p, true)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: _red.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: _red.withOpacity(0.2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(children: [
                        Icon(Icons.thumb_down_rounded, size: 16, color: _red),
                        SizedBox(width: 6),
                        Text('Cons', style: TextStyle(fontWeight: FontWeight.w800, color: _red, fontSize: 13)),
                      ]),
                      const SizedBox(height: 10),
                      ...site.cons.map((c) => _proConItem(c, false)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _proConItem(String text, bool isPro) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(isPro ? Icons.check_circle_rounded : Icons.cancel_rounded,
              size: 14, color: isPro ? _green : _red),
          const SizedBox(width: 6),
          Expanded(
            child: Text(text,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade700, height: 1.4)),
          ),
        ],
      ),
    );
  }

  // ── Visitor Info ──────────────────────────────────────────────────────────
  Widget _buildVisitorInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Visitor Info', Icons.tips_and_updates_rounded),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _gold.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _gold.withOpacity(0.4)),
            ),
            child: Column(
              children: [
                _infoRow(Icons.confirmation_number_rounded, 'Entry Fee', site.entryFee, const Color(0xFF7B5EA7)),
                const Divider(height: 20),
                _infoRow(Icons.access_time_rounded, 'Opening Hours', '${site.openingTime} – ${site.closingTime}', _green),
                const Divider(height: 20),
                _infoRow(Icons.wb_sunny_outlined, 'Best Time to Visit', site.bestTimeToVisit, Colors.orange),
                const Divider(height: 20),
                _infoRow(Icons.location_city_rounded, 'Region', site.region, _dark),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, size: 18, color: color),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade500, fontWeight: FontWeight.w600)),
              const SizedBox(height: 2),
              Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: _dark)),
            ],
          ),
        ),
      ],
    );
  }

  // ── Bottom bar ────────────────────────────────────────────────────────────
  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 20, offset: const Offset(0, -4))],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => setState(() => _isSaved = !_isSaved),
            child: Container(
              width: 52, height: 52,
              decoration: BoxDecoration(
                color: _isSaved ? _gold.withOpacity(0.15) : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: _isSaved ? _gold : Colors.grey.shade200),
              ),
              child: Icon(
                _isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                color: _isSaved ? _dark : Colors.grey.shade400,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: _openGoogleMaps,
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                  color: _red,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(color: _red.withOpacity(0.35), blurRadius: 12, offset: const Offset(0, 4))],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.directions_rounded, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text('Get Directions', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20, color: _red),
        const SizedBox(width: 8),
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: _dark)),
      ],
    );
  }
}
