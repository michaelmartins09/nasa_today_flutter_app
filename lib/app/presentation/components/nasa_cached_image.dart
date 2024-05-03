import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NasaCachedImage extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final Widget? errorWidget;

  const NasaCachedImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
        ),
      ),
      errorWidget: (_, __, ___) =>
          errorWidget ??
          const Center(
            child: Icon(
              Icons.image_not_supported_outlined,
              size: 20,
            ),
          ),
    );
  }
}
