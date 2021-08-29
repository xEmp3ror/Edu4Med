import 'package:flutter/material.dart';
import 'package:nevada/ui/pages/aus/auscultacion.dart';
import 'package:nevada/ui/pages/teoria_auscultacion.dart';
import 'package:row_collection/row_collection.dart';

import 'index.dart';

class AuscultacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auscultación'),
        centerTitle: true,
      ),
      body: RowLayout(
        children: <Widget>[
          ListTile(
            title: Text("Teoría"),
            subtitle: Text("Explicación del apartado de Auscultación"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TeoriaAuscultacion(),
              ),
            ),
          ),
          ListTile(
            title: Text("Recursos adicionales"),
            subtitle:
                Text("Videos y otros materiales para la ayuda al estudio"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AuscultacionVideosPage(),
              ),
            ),
          ),
          ListTile(
            title: Text("Auscultación virtual"),
            subtitle: Text(
              "Auscultación con recursos de pacientes y patologías reales",
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AuscultacionView(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
