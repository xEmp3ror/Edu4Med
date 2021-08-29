import 'package:flutter/material.dart';
import 'package:row_collection/row_collection.dart';

import '../../widgets/index.dart';

class InspeccionImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inspección'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          RowLayout.cards(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CardPage.body(
                title: "Insuficiencia cardíaca derecha",
                body: Image.asset(
                    "assets/images/inspeccion_examples/insu_card_derecha.jpg"),
              ),
              CardPage.body(
                title: "Insuficiencia cardíaca izquierda",
                body: Image.asset(
                    "assets/images/inspeccion_examples/insu_card_izquierda.jpg"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
