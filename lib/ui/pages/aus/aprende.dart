import 'package:flutter/material.dart';
import 'package:row_collection/row_collection.dart';

import 'index.dart';

class AprenderAusView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auscultación · Aprende'),
        centerTitle: true,
      ),
      body: RowLayout(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          ListTile(
            title: Text("Sonidos normales"),
            subtitle: Text("Esucucha auscultaciones con sonidos normales"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyPage(
                  title: 'Sonidos normales',
                  audios: [
                    'normal',
                    'normal',
                    'normal',
                    'normal',
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("Sonidos patológicos"),
            subtitle: Text("Escucha auscultaciones con sonidos patológicos"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AuscultacionPatologica(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
