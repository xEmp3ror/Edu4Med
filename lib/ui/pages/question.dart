import 'package:flutter/material.dart';
import 'package:nevada/ui/pages/results.dart';
import 'package:nevada/widgets/index.dart';
import 'package:provider/provider.dart';
import 'package:row_collection/row_collection.dart';

import '../../models/index.dart';
import 'question_page.dart';

class QuestionPage extends StatefulWidget {
  final DateTime finish;
  final bool isArena, isRandom;

  const QuestionPage({
    Key key,
    this.finish,
    this.isArena = false,
    this.isRandom = false,
  }) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage>
    with TickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(
      vsync: this,
      length: widget.isArena ? 100 : (widget.isRandom ? 30 : 10),
    );
    _controller.addListener(() => setState(() => {}));
    if (widget.finish != null)
      Future.delayed(widget.finish.difference(DateTime.now()), () {
        setState(() {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
              title: Text('¡Se acabó!'),
              content: Text(
                  'El tiempo ha terminado. Pulsa "Enviar todo" para enviar los resultados al servidor y guardarlos.'),
              actions: <Widget>[
                FlatButton(
                  child: Text('ENVIAR TODO'),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            ),
          ).then(
            (_) {
              if (widget.isArena)
                Provider.of<TestQuestionModel>(context).sendArena(context);
              else
                Provider.of<TestQuestionModel>(context).sendTest(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChangeNotifierProvider.value(
                    value: Provider.of<TestQuestionModel>(context),
                    child: ResultPage(),
                  ),
                ),
              );
            },
          );
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Cerrar cuestionario'),
          content: Text(
              '¿Desea de verdad salir del cuestionario? Los resultados no se conservarán.'),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCELAR'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('SALIR'),
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                '/main',
                (_) => false,
              ),
            ),
          ],
        ),
      ),
      child: Consumer<TestQuestionModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  "Marque la opción correcta",
                  style: TextStyle(fontSize: 18),
                ),
                if (widget.finish != null) ...[
                  Separator.spacer(),
                  CountdownWidget(widget.finish),
                ],
              ],
            ),
          ),
          body: model.isLoading
              ? Center(child: CircularProgressIndicator())
              : TabBarView(
                  controller: _controller,
                  children: <Widget>[
                    for (int i = 0;
                        i < Provider.of<TestQuestionModel>(context).totalPages;
                        ++i)
                      AnswerPage(i)
                  ],
                ),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: <Widget>[
                  Text(
                    'PREGUNTA ',
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '${_controller.index + 1}',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    ' DE ${_controller.length}',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.done),
            onPressed: () {
              if (!widget.isArena)
                model.sendTest(context);
              else
                model.sendArena(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChangeNotifierProvider.value(
                    value: model,
                    child: ResultPage(),
                  ),
                ),
              );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        ),
      ),
    );
  }
}
