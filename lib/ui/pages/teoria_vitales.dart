import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:row_collection/row_collection.dart';

class TeoriaVitales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signos Vitales'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          ParsedText(
            alignment: TextAlign.start,
            style: TextStyle(color: Colors.black),
            text: '''1. Frecuencia respiratoria (FR): 12-18/min.

2. Temperatura: <37ºC. Hasta 37,9ºC se considera febrícula, y a partir de 38ºC fiebre.

3. Tensión arterial (TA) sistólica, diastólica y media. Recuerda que la PAM = PAD + 1/3 (PAS-PAD).
    Normal: PAS < 120mmHg y PAD <80mmHg. 
    Hipertensión PAS >140mmHg / PAD > 90mmHg.
    Hipotensión PAS <90mHg.

4. Frecuencia cardíaca (FC): 60-100. Debe ser evaluado en las arterias palpables (carótida, radial, braquial, femoral, poplítea, tibial posterior, pedia, temporal). 


Otros datos de interés:

Palpación del pulso venoso y valoración de signos de sobrecarga hídrica: Inspección de venas periféricas y centrales (evaluar altura a la que se detecta el pulso yugular y morfología). Es útil estudiar si existe reflujo hepatoyugular. Evaluación de los miembros y el abdomen en busca de ascitis o edemas. 
  
Tiempo de relleno capilar: debe ser menor a 3 segundos en lecho ungueal.''',
            parse: <MatchText>[
              MatchText(
                pattern: "Frecuencia respiratoria",
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
                        title: Text("Frecuencia Respiratoria"),
                        content: SingleChildScrollView(
                          child: Text('''FR: 12-18/min.

La frecuencia respiratoria anormal puede indicar una descompensación cardíaca o una enfermedad pulmonar primaria. La frecuencia aumenta en los pacientes con insuficiencia cardíaca o ansiedad y disminuye o se torna intermitente en el paciente agonizante. Las respiraciones rápidas y superficiales pueden indicar dolor pleurítico.'''),
                        ),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          FlatButton(
                            child: Text("Close"),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              MatchText(
                pattern: "Temperatura",
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
                        title: Text("Temperatura"),
                        content: SingleChildScrollView(
                          child: Text(
                            '''Puede aumentar en la fiebre reumática aguda o en una infección cardíaca (p. ej, endocarditis). Después de un infarto de miocardio la febrícula es muy frecuente aunque suele ceder en menos de 72h.

Recuerda que la temperatura es diferente según el lugar de medición (axila, recto, boca, tímpano) y que los rangos de normalidad varían con la edad.'''),
                        ),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          FlatButton(
                            child: Text("Close"),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              MatchText(
                pattern: "Tensión arterial",
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
                        title: Text("Tensión arterial"),
                        content: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Text(
                                '''El procedimiento consiste en rodear el brazo con un manguito de tamaño apropiado y tras inflarlo lo suficiente como para detener el flujo sanguíneo, desinflarlo poco a poco. El primer ruido auscultado mientras descendemos la presión del manguito coincide con la cifra de presión sistólica medida en milímetros de mercurio. La desaparición de los ruidos coincide con la cifra de presión diastólica. ¡Recuerda que no basta con una única medición aislada para el diagnóstico de HTA!

Asimismo, la TA debe medirse en ambos brazos (diferencia máxima fisiológica 15mmHg) y, cuando se sospechan cardiopatías congénitas o enfermedades vasculares periféricas, también en ambas piernas. En ellas suele ser 20mmHg mayor que en los brazos y es por esto que, si en condiciones normales se calcula el índice tobillo-brazo (relación entre la TAS en el tobillo y en el brazo), éste será de entre 1 y 1,3.
Un ITB bajo (≤ 0,9) sugiere una enfermedad arterial periférica. Un índice elevado (> 1,3) puede indicar que los vasos de la pierna no son compresibles.
''',
                              ),
                              Image.asset('assets/images/extras/pa_pb_categories.jpg'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          FlatButton(
                            child: Text("Close"),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              MatchText(
                pattern: "Frecuencia cardíaca",
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
                        title: Text("Frecuencia cardíaca"),
                        content: Text(
                            '''Prestar atención a las características del pulso: frecuencia, ritmo, morfología e intensidad, así como su simetría bilateral.

Recuerda que durante las arritmias pueden existir latidos que no generen una onda de pulso palpable.

Si se palpa el pulso radial la TAS es al menos de 80-90mmHg, y si se palpa el carotídeo implica que la TAS es mayor a 60 mmHg.'''),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          FlatButton(
                            child: Text("Close"),
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
        ],
      ),
    );
  }
}
