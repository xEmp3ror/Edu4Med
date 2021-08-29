import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';

class CateterismoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cateterismo'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ParsedText(
          alignment: TextAlign.start,
          style: TextStyle(color: Colors.black),
          text:
              '''Aquí se puede ver un estudio de cateterismo cardiaco en tres fases:

- El primer vídeo, muestra una obstrucción en la coronaria descendente anterior, que impide el paso del contraste.
- A continuación, en la imagen se puede ver cómo se interviene en el lugar de la obstrucción (dilatación con balón / colocación de stent).
- Por último, el segundo vídeo muestra cómo se ha logrado reperfundir la arteria permitiendo de nuevo el flujo del contraste.''',
          parse: <MatchText>[
            MatchText(
              pattern: "primer vídeo",
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
                      title: Text("Obst. Coronaria desc. anterior"),
                      content: Image.asset('assets/images/cateterismo_examples/oclusion_trombotica_da.gif'),
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
              pattern: "en la imagen",
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
                      title: Text("Colocación Stent"),
                      content: Image.asset('assets/images/cateterismo_examples/oclusion_trombotica_da_suelta_stent.jpg'),
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
              pattern: "el segundo vídeo",
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
                      title: Text("Reperfusión de arteria"),
                      content: Image.asset('assets/images/cateterismo_examples/oclusion_trombotica_da_tras_STENT.gif'),
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
