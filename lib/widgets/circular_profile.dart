import 'package:flutter/material.dart';

import 'index.dart';

class CircularProfile extends StatelessWidget {
  final String url;

  const CircularProfile(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: CacheImage(url: url, size: 49.0),
    );
  }
}
