import 'package:flutter/material.dart';
import 'package:row_collection/row_collection.dart';

import 'index.dart';

class AuscultacionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auscultación Virtual'),
        centerTitle: true,
      ),
      body: RowLayout(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          ListTile(
            title: Text("Aprende"),
            subtitle: Text("Entrena el oído para diferenciar los sonidos normales de los patológicos"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AprenderAusView(),
              ),
            ),
          ),
          ListTile(
            title: Text("Practica"),
            subtitle: Text("Sométete a un test para comprobar lo aprendido"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PracticaAusView(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
