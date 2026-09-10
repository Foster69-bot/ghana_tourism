import 'package:flutter/material.dart';

/// Converts Wikimedia file-description pages into direct image URLs.
///
/// A `/wiki/File:...` URL returns HTML, which Android cannot decode as an
/// image. `Special:FilePath` redirects to the actual image bytes instead.
String resolveRemoteImageUrl(String url) {
  const filePagePrefix = 'https://commons.wikimedia.org/wiki/File:';
  const directFilePrefix =
      'https://commons.wikimedia.org/wiki/Special:FilePath/';

  final trimmedUrl = url.trim();
  if (trimmedUrl.startsWith(filePagePrefix)) {
    return '$directFilePrefix${trimmedUrl.substring(filePagePrefix.length)}';
  }

  return trimmedUrl;
}

class RemoteImage extends StatelessWidget {
  const RemoteImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.cacheWidth,
    this.cacheHeight,
  });

  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final int? cacheWidth;
  final int? cacheHeight;

  @override
  Widget build(BuildContext context) {
    final fallback =
        errorWidget ??
        const ColoredBox(
          color: Color(0xFFE8E8E8),
          child: Center(
            child: Icon(Icons.broken_image_outlined, color: Colors.grey),
          ),
        );

    return Image.network(
      resolveRemoteImageUrl(url),
      width: width,
      height: height,
      fit: fit,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      gaplessPlayback: true,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return placeholder ??
            const ColoredBox(
              color: Color(0xFFE8E8E8),
              child: Center(
                child: SizedBox.square(
                  dimension: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            );
      },
      errorBuilder: (_, __, ___) => fallback,
    );
  }
}
