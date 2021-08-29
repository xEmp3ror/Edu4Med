import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:nevada/models/index.dart';
import 'package:provider/provider.dart';
import 'package:row_collection/row_collection.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => null,
      child: Consumer<TestQuestionModel>(
        builder: (context, model, child) => Scaffold(
          body: ListView(
            children: <Widget>[
              RowLayout(
                children: <Widget>[
                  RowLayout(
                    padding:
                        EdgeInsets.only(top: 32, right: 8, left: 8, bottom: 8),
                    children: <Widget>[
                      Card(
                        child: RowLayout(
                          padding: EdgeInsets.only(
                              top: 14, right: 14, left: 14, bottom: 14),
                          children: <Widget>[
                            Text(
                              "CALIFICACIÓN OBTENIDA",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              model.score.toStringAsPrecision(2),
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 32,
                                color: model.score >= 5
                                    ? Color(0xFF009006)
                                    : Color(0xFF900000),
                              ),
                            ),
                            Divider(
                              height: 14,
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  model.rightAnswers.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 34,
                                    color: Color(0xFF009006),
                                  ),
                                ),
                                Separator.spacer(space: 16),
                                Text(
                                  "PREGUNTAS \nCORRECTAS",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                Separator.spacer(space: 48),
                                Text(
                                  model.wrongAnswers.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 34,
                                    color: Color(0xFF900000),
                                  ),
                                ),
                                Separator.spacer(space: 16),
                                Text(
                                  "PREGUNTAS \nERRÓNEAS",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "RESUMEN DEL INTENTO",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      for (int i = 0;
                          i <
                              Provider.of<TestQuestionModel>(context)
                                  .totalPages;
                          ++i)
                        if (model.getAnswer(i) != -1)
                          Card(
                            child: ListTile(
                              leading: Icon(
                                model.getFinalAnswer(i).answer
                                    ? Icons.check_circle
                                    : Icons.cancel,
                                size: 40,
                                color: model.getFinalAnswer(i).answer
                                    ? Color(0xFF009006)
                                    : Color(0xFF900000),
                              ),
                              title: Text(
                                "PREGUNTA ${i + 1}",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              subtitle: AutoSizeText(
                                model.getFinalAnswer(i).question,
                                maxLines: 2,
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          )
                        else
                          Card(
                            child: ListTile(
                              leading: Icon(
                                Icons.help,
                                size: 40,
                                color: Colors.blueGrey,
                              ),
                              title: Text(
                                "PREGUNTA ${i + 1}",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              subtitle: AutoSizeText(
                                'Pregunta no contestada',
                                maxLines: 2,
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          )
                    ],
                  )
                ],
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.check),
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
              '/main',
              (_) => false,
            ),
          ),
        ),
      ),
    );
  }
}
