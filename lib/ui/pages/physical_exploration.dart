import 'package:flutter/material.dart';
import 'package:row_collection/row_collection.dart';

import 'index.dart';

class PhysicalExploration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exploración física'),
          centerTitle: true,
        ),
        body: RowLayout(
          padding: EdgeInsets.all(16),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "En esta sección encontrarás información relevante sobre cada uno de los diferentes apartados de la exploración física. Recuerda que puedes revisar tanto los contenidos de la misma como los de la fase previa de anamnesis en la presentación correspondiente.",
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
            Separator.spacer(space: 4),
            Text("Aquí tienes los temas: "),
            Separator.spacer(space: 4),
            ListTile(
              title: Text("Signos Vitales"),
              subtitle: Text("Aprenda a interpretar sus signos vitales"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TeoriaVitales())),
            ),
            ListTile(
              title: Text("Inspección, palpación y percusión"),
              subtitle: Text("Examine al paciente de forma correcta"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PalpacionPage())),
            ),
            ListTile(
              title: Text("Auscultación"),
              subtitle: Text("Aprenda sobre la Auscultación del paciente con un simulador"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AuscultacionPage())),
            ),
          ],
        ),
      );
  }
}
