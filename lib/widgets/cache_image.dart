import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Auxiliary widget to display a cached image.
/// It has its own 'error' widget.
class CacheImage extends StatelessWidget {
  final String url;
  final num size;

  const CacheImage({
    this.url,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CachedNetworkImage(
        imageUrl: url ?? '',
        errorWidget: (context, url, error) => Icon(
          Icons.person,
          size: 39,
          color: Theme.of(context).textTheme.caption.color,
        ),
        fadeInDuration: Duration(milliseconds: 200),
        fit: BoxFit.contain,
      ),
    );
  }
}
