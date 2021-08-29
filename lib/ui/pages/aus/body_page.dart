import 'package:flutter/material.dart';

import '../../../widgets/aus_body.dart';

class BodyPage extends StatelessWidget {
  final String title;
  final List<String> audios;

  const BodyPage({Key key, this.title, this.audios}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: AusBody(audios: audios),
    );
  }
}
