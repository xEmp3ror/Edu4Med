import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:row_collection/row_collection.dart';

import 'index.dart';

class EcocardioPage extends StatelessWidget {
  final String youtubeToken = "AIzaSyByJdb1FN2YGjiQQKVdsWayryxMXh5DHwI";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecocardiograma'),
        centerTitle: true,
      ),
      body: RowLayout(
        padding: EdgeInsets.all(12),
        children: <Widget>[
          ListTile(
            title: Text("Video 1"),
            subtitle: Text("Planos ecocardiográficos"),
            onTap: () => FlutterYoutube.playYoutubeVideoById(
                apiKey: youtubeToken,
                videoId: "xdWbJFAGyKU",
                autoPlay: true,
                fullScreen: true),
          ),
          ListTile(
            title: Text("Video 2"),
            subtitle: Text("Ecocardiografía transesofágica"),
            onTap: () => FlutterYoutube.playYoutubeVideoById(
                apiKey: youtubeToken,
                videoId: "9XFoYWrXoVc",
                autoPlay: true,
                fullScreen: true),
          ),
          ListTile(
            title: Text("Ejemplos animados"),
            subtitle: Text("Imágenes de casos reales mostrando distintas condiciones en múltiples planos"),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => EcocardioExamples())),
          ),
        ],
      ),
    );
  }
}
