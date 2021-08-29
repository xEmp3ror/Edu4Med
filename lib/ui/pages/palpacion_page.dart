import 'package:flutter/material.dart';
import 'package:row_collection/row_collection.dart';

import 'index.dart';

class PalpacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inspección, palpación y percusión'),
        centerTitle: true,
      ),
      body: RowLayout(
        children: <Widget>[
          ListTile(
            title: Text("Teoría"),
            subtitle: Text("Recursos teóricos sobre el tema"),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => TeoriaPalpacion())),
          ),
          ListTile(
            title: Text("Recursos adicionales"),
            subtitle:
                Text("Videos y otros materiales externos para la ayuda al estudio"),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PalpacionVideosPage())),
          ),
        ],
      ),
    );
  }
}
