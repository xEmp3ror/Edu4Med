import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:nevada/ui/pages/teoria_archivos_fonendo.dart';

import 'teoria_archivos_focos.dart';

class TeoriaAuscultacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tª Auscultación'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ParsedText(
          alignment: TextAlign.start,
          style: TextStyle(color: Colors.black),
          text:
              '''El paciente debe estar en decúbito supino y el examinador debe situarse a la derecha del paciente.

Sistemática general

Instrumento

Focos de auscultación

Parámetros''',
          parse: <MatchText>[
            MatchText(
              pattern: "Sistemática general",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              onTap: (url) async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: Text("Sistemática general"),
                      content: SingleChildScrollView(
                        child: Text('''1. Separación de ruidos pulmonares. 

2. Identificar áreas de auscultación. 

3. Localizar el área más audible.

4. Identificar primer tono/ruido.

5. Identificar silencios. 

6. Identificar segundo tono/ruido. 

7. Buscar 3º y 4º ruidos (no tiene por qué haber). 

8. Valorar otros ruidos añadidos y características: tipo (soplo, clic de apertura, chasquido), momento del ciclo, área predominante, irradiación, morfología, intensidad, timbre.'''),
                      ),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        FlatButton(
                          child: Text("Cerrar"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            MatchText(
              pattern: "Instrumento",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              onTap: (url) async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: Text("Instrumento"),
                      content: SingleChildScrollView(
                        child: Text('''El fonendoscopio consta de:

Membrana: sonidos de alta frecuencia.
  - Soplos sistólicos.
  - Soplos diastólicos precoces.
  - Clics.
  - Chasquidos.
  - Roces pericárdicos.

Campana: sonidos de baja frecuencia.
  - Soplo diastólico mitral y tricúspide .
  - Galopes.

Pulsa en “Ver más” para acceder a algunos archivos útiles.'''),
                      ),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        FlatButton(
                          child: Text("Ver más"),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeoriaFonendo(),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            MatchText(
              pattern: "Focos de auscultación",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              onTap: (url) async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: Text("Focos de auscultación cardíacos"),
                      content: SingleChildScrollView(
                        child: Text('''Los focos de auscultación cardíacos son: 

1. Foco aórtico: Se halla situado en el 2º espacio intercostal a la derecha del esternón.

2. Foco pulmonar: Se halla situado en el 2º espacio intercostal a la izquierda del esternón debajo del ángulo de Louis.

3. Mesocardio (aórtico accesorio): Se halla situado en el 3º espacio intercostal a la izquierda del esternón, justo por debajo del foco pulmonar.

4. Foco tricuspídeo: apéndice xifoides y borde esternal inferior izquierdo.

5. Foco mitral: situado en el ápice a nivel del 5º esp. intercostal, línea medioclavicular izquierda.

Pulsa en VER MÁS para ver algunos archivos útiles.'''),
                      ),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        FlatButton(
                          child: Text("Ver más"),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeoriaFocos(),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            MatchText(
              pattern: "Parámetros",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              onTap: (url) async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: Text("Parámetros"),
                      content: SingleChildScrollView(
                        child: Text(
                            '''Analizar intensidad, frecuencia, duración y ritmo de:

  - Primer ruido: Depende del cierre de las válvulas mitral y tricúspide (M + T). —> Sístole
  - Segundo ruido: Depende del cierre de las válvulas semilunares (A + P). —> Diástole

Ruidos añadidos: 

  - Ritmo de galope. En determinadas circunstancias, pueden auscultarse un tercer o un cuarto ruidos cardíacos durante la diástole (que no siempre son patológicos). El tercer ruido traduce un llenado ventricular rápido y el cuarto coincide con el llenado ventricular tras contracción auricular.
  - Soplos. Son ruidos patológicos de diversa intensidad (1-6) y longitud, que se deben a las vibraciones producidas por un flujo sanguíneo turbulento. Interesa su localización, irradiación, configuración y longitud. 
  - Click de eyección: pulmonar, aórtico, o de prolapso mitral.
  - Chasquidos de apertura: mitral o tricuspídeo. 
  - Roces pericárdicos.'''),
                      ),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        FlatButton(
                          child: Text("Cerrar"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
