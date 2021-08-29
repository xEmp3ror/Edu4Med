import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:row_collection/row_collection.dart';

class AuscultacionVideosPage extends StatelessWidget {
  final String youtubeToken = "AIzaSyByJdb1FN2YGjiQQKVdsWayryxMXh5DHwI";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auscultación'),
        centerTitle: true,
      ),
      body: RowLayout(
        padding: EdgeInsets.all(12),
        children: <Widget>[
          ListTile(
            title: Text("Video 1"),
            subtitle: Text("Auscultación cardiaca"),
            onTap: () => FlutterYoutube.playYoutubeVideoById(
                apiKey: youtubeToken,
                videoId: "ABinhJN2Ccw",
                autoPlay: true,
                fullScreen: true),
          ),
        ],
      ),
    );
  }
}
