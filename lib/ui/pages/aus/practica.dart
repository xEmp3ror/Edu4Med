import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:row_collection/row_collection.dart';

import '../../../models/index.dart';
import 'index.dart';

class PracticaAusView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auscultación · Práctica'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: RowLayout(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            padding: EdgeInsets.all(24),
            children: <Widget>[
              Icon(
                Icons.play_circle_outline,
                size: 100,
              ),
              Separator.spacer(space: 8),
              Text(
                "¿PREPARADOS, LISTOS?",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 26,
                ),
              ),
              Separator.spacer(space: 8),
              Text(
                '''En este apartado realizarás un cuestionario sobre la auscultación donde el fonendoscopio será tu propio dedo. Deberás pulsar sobre los distintos focos de auscultación ya estudiados para escuchar una pista de audio en ese foco. Luego, se le preguntará qué ha escuchado.

El cuestionario consta de diez preguntas. Éstas no tienen relación con los cuestionarios del apartado de "Test".
            
Recomendamos el uso de auriculares para mayor precisión a la hora de auscultar.''',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
              Separator.spacer(space: 8),
              RaisedButton(
                child: Text("COMENZAR"),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider.value(
                      value: AusQuestionModel(context),
                      child: AusQuestionPage(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
