import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:row_collection/row_collection.dart';

class PalpacionVideosPage extends StatelessWidget {
  final String youtubeToken = "AIzaSyByJdb1FN2YGjiQQKVdsWayryxMXh5DHwI";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inspección, palpación y percusión'),
        centerTitle: true,
      ),
      body: RowLayout(
        padding: EdgeInsets.all(12),
        children: <Widget>[
          ListTile(
            title: Text("Video 1"),
            subtitle: Text(
                "Inspección general del paciente + inspección y palpación del corazón"),
            onTap: () => FlutterYoutube.playYoutubeVideoById(
                apiKey: youtubeToken,
                videoId: "ABinhJN2Ccw",
                autoPlay: true,
                fullScreen: true),
          ),
          ListTile(
            title: Text("Video 2"),
            subtitle: Text("Inspección general y del tórax"),
            onTap: () => FlutterYoutube.playYoutubeVideoById(
                apiKey: youtubeToken,
                videoId: "8EGZoWeQZXQ",
                autoPlay: true,
                fullScreen: true),
          ),
        ],
      ),
    );
  }
}
