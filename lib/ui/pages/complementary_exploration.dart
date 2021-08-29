import 'package:flutter/material.dart';
import 'package:nevada/ui/pages/cateterismo_page.dart';
import 'package:nevada/ui/pages/electro_page.dart';
import 'package:row_collection/row_collection.dart';

import 'index.dart';

class ComplementaryExploration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exploraciones complementarias'),
          centerTitle: true,
        ),
        body: RowLayout(
          padding: EdgeInsets.all(16),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Las pruebas complementarias en la exploración cardiovascular pueden incluir radiografías de tórax, TAC, RMN, EKG y monitorización con Holter, ecocardiograma transtorácico y transesofágico, pruebas de esfuerzo, estudios de cateterismo y angiografías, estudios radioisotópicos…",
            //  overflow: TextOverflow.ellipsis,
            //  maxLines: 5,
            ),
            Separator.spacer(space: 4),
            Text("Aquí tienes los temas: "),
            Separator.spacer(space: 4),
            ListTile(
              title: Text("Ecocardiograma"),
              subtitle: Text("Estudio del corazón mediante ultrasonidos"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EcocardioPage())),
            ),
            ListTile(
              title: Text("Electrocardiograma"),
              subtitle: Text("Estudio del corazón en base a su actividad eléctrica"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ElectroPage())),
            ),
            ListTile(
              title: Text("Cateterismo"),
              subtitle: Text("Intervención diagnóstico-terapéutica sobre las arterias coronarias"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CateterismoPage())),
            ),
          ],
        ),
      );
  }
}
