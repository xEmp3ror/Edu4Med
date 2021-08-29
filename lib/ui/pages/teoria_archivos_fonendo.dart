import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:row_collection/row_collection.dart';

import 'index.dart';

class TeoriaFonendo extends StatelessWidget {
  final String youtubeToken = "AIzaSyByJdb1FN2YGjiQQKVdsWayryxMXh5DHwI";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fonendoscopio'),
        centerTitle: true,
      ),
      body: RowLayout(
        padding: EdgeInsets.all(16),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "En el siguiente menú se presentan varios archivos sobre el uso del Fonendoscopio.",
          ),
          Separator.spacer(space: 4),
          Text("Aquí tienes los archivos: "),
          Separator.spacer(space: 4),
          ListTile(
            title: Text("Anatomía de un fonendoscopio"),
            subtitle:
                Text("PDF sobre las partes que componen un fonendoscopio"),
            onTap: () {
              DefaultCacheManager()
                  .getFile('https://drive.google.com/uc?export=download&id=18qScFyQKFjETkiatYMQwI5ZSPvFYmtio')
                  .listen((f) => OpenFile.open(f.file.path));
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Abriendo archivo...'),
              ));
            },
          ),
          ListTile(
            title: Text("Uso del fonendoscopio"),
            subtitle: Text("Video de uso de un fonendoscopio"),
            onTap: () => FlutterYoutube.playYoutubeVideoById(
                apiKey: youtubeToken,
                videoId: "JWJncQ8zX1A",
                autoPlay: true,
                fullScreen: true),
          ),
        ],
      ),
    );
  }
}
