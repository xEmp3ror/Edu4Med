import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:open_file/open_file.dart';
import 'package:row_collection/row_collection.dart';

class TeoriaFocos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Focos de auscultación'),
        centerTitle: true,
      ),
      body: RowLayout(
        padding: EdgeInsets.all(16),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "En el siguiente menú se presentan varios archivos de información sobre los focos de auscultación.",
          ),
          Separator.spacer(space: 4),
          Text("Aquí tienes los archivos: "),
          Separator.spacer(space: 4),
          ListTile(
            title: Text("Auscultación cardíaca"),
            subtitle: Text("PDF detallando los focos de auscultación cardíaca"),
            onTap: () {
              DefaultCacheManager()
                  .getFile(
                      'https://drive.google.com/uc?export=download&id=1pTDavC3ria6sCwTAhYAMbJXUfqVgkq6g')
                  .listen((f) => OpenFile.open(f.file.path));
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Abriendo archivo...'),
              ));
            },
          ),
          ListTile(
            title: Text("Auscultación pulmonar"),
            subtitle: Text("PDF detallando los focos de auscultación pulmonar"),
            onTap: () {
              DefaultCacheManager()
                  .getFile(
                      'https://drive.google.com/uc?export=download&id=1PMzt5lHcXzRhvWEjrlRdUrp8aG98P45a')
                  .listen((f) => OpenFile.open(f.file.path));
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Abriendo archivo...'),
              ));
            },
          ),
        ],
      ),
    );
  }
}
