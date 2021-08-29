import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/index.dart';
import 'index.dart';

class AusQuestionPage extends StatefulWidget {
  @override
  _AusQuestionPageState createState() => _AusQuestionPageState();
}

class _AusQuestionPageState extends State<AusQuestionPage>
    with TickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 10);
    _controller.addListener(() => setState(() => {}));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Cerrar cuestionario'),
          content: Text('¿Desea de verdad salir del cuestionario?'),
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
      child: Consumer<AusQuestionModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Marque la opción correcta"),
              ],
            ),
          ),
          body: model.isLoading
              ? Center(child: CircularProgressIndicator())
              : TabBarView(
                  controller: _controller,
                  children: <Widget>[
                    for (int i = 0; i < 10; ++i) AusAnswerPage(i)
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
              model.sendAus(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChangeNotifierProvider.value(
                    value: model,
                    child: AusResultPage(),
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
