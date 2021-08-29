import 'package:flutter/material.dart';
import 'package:row_collection/row_collection.dart';

import '../../widgets/index.dart';

class ElectroExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electrocardiograma'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          RowLayout.cards(
            children: <Widget>[
              Text("Puedes girar tu dispositivo para ver las imágenes a mayor tamaño. Recuerda activar la rotación automática en tu dispositivo."),
              Separator.spacer(space: 4),
              CardPage.body(
                title: "EKG Normal",
                body: Image.asset(
                    "assets/images/electro_examples/EKG_normal.jpg"),
              ),
              CardPage.body(
                title: "BAV Completo",
                body: Image.asset(
                    "assets/images/electro_examples/BAV_completo.jpg"),
              ),
              CardPage.body(
                title: "BAV Conducción",
                body: Image.asset(
                    "assets/images/electro_examples/BAV_conduccion.jpg"),
              ),
              CardPage.body(
                title: "FA Preexcitada",
                body: Image.asset(
                    "assets/images/electro_examples/FA_preexcitada.jpg"),
              ),
              CardPage.body(
                title: "FA",
                body: Image.asset("assets/images/electro_examples/FA.jpg"),
              ),
              CardPage.body(
                title: "Flutter",
                body: Image.asset("assets/images/electro_examples/Flutter.jpg"),
              ),
              CardPage.body(
                title: "MCH Apical",
                body: Image.asset(
                    "assets/images/electro_examples/MCH_apical.jpg"),
              ),
              CardPage.body(
                title: "SCACEST Anterior",
                body: Image.asset(
                    "assets/images/electro_examples/SCACEST_ANT.jpg"),
              ),
              CardPage.body(
                title: "TPSV",
                body: Image.asset("assets/images/electro_examples/TPSV.jpg"),
              ),
              CardPage.body(
                title: "TV",
                body: Image.asset("assets/images/electro_examples/TV.jpg"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
