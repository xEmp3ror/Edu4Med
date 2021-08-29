import 'package:flutter/material.dart';
import 'package:row_collection/row_collection.dart';

import '../../widgets/index.dart';
import 'electro_example.dart';

class ElectroPage extends StatelessWidget {
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
              CardPage.body(
                title: "Derivaciones y Eje Cardíaco",
                body:
                    Image.asset("assets/images/electro_examples/3.1.2.2.2.jpg"),
              ),
              CardPage.body(
                title: "Sistema de conducción corazón",
                body:
                    Image.asset("assets/images/electro_examples/3.1.2.2.3.jpg"),
              ),
              CardPage.body(
                title: "Ondas electrocardiográficas",
                body:
                    Image.asset("assets/images/electro_examples/3.1.2.2.4.jpg"),
              ),
              Text('''
              
De forma adicional, se recomienda acudir a:
              
Dubin, D., Interpretacion de ECG (ISBN 10: 0912912251). 
Laso, FJ., Introducción a la medicina clínica.
Hampton, J., Hampton, J. The ECG Made Easy E-Book.'''),
              ListTile(
                title: Text("Ejemplos"),
                subtitle: Text("Vea algunos electrocardiogramas de ejemplo"),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ElectroExamples())),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
