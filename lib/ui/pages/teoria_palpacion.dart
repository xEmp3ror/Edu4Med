import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:nevada/ui/pages/inspeccion_images.dart';

class TeoriaPalpacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tª Inspección, palpación y percusión'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ParsedText(
          alignment: TextAlign.start,
          style: TextStyle(color: Colors.black),
          text: '''
Inspección general.

Palpación y detección de frémitos si los hubiere.

Percusión: Matidez vs timpanismo (p.ej para detectar derrame pleural). ''',
          parse: <MatchText>[
            MatchText(
              pattern: "Palpación",
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
                      title: Text("Palpación"),
                      content: Text(
                          '''Palpación área aórtica, pulmonar, región paraesternal izquierda inferior y región de la punta con el latido de la punta fisiológico (4º/5º espacio intercostal izq. en la línea medioclavicular) o patológico (p.ej. hipertrofia del VD). ¡Recuerda, el latido de la punta puede no palparse en situación fisiológica!'''),
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
              pattern: "Inspección general",
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
                      title: Text("Inspección general"),
                      content: Text(
                          '''Perfil de paciente, postura y actitud en consulta, modo de expresarse, constitución, estado de la piel, coloración, hidratación, signos de anemia, tipo de respiración, anomalías (p.ej. hiperinsuflación) y/o presencia de disnea, edemas, síntomas/signos de afección tiroidea, acropaquia, nódulos de Osler, xantomas, xantelasma… Explorar complexión y líneas óseas y posibles malformaciones (p.ej. tórax en quilla) o deformidades (p.ej. aneurisma sifilítico, prominente en la parte superior), lesiones (óseas, cutáneas...),…


Imágenes F. Netter insuficiencia cardíaca derecha VS izquierda ?'''),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        FlatButton(
                          child: Text("Ver imágenes"),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InspeccionImages(),
                            ),
                          ),
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
