import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../models/index.dart';
import '../../../widgets/index.dart';
import '../index.dart';

class ArenaCheckScreen extends StatelessWidget {
  final now = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Consumer<ArenaModel>(
      builder: (context, model, child) => FutureBuilder(
        future: Provider.of<ArenaModel>(context).refreshData(),
        builder: (context, snap) {
          if (snap.hasData) {
            return Scaffold(
                appBar: AppBar(
                  title: Text('Arena'),
                  centerTitle: true,
                ),
                body: model.getItemCount != 0 &&
                        (model.arena.start.isAfter(DateTime.now()) || model.arena.finish.isBefore(DateTime.now()))
                    ? BigTip(
                        icon: Icons.cancel,
                        message:
                            'La próxima Arena se abrirá el día \n${DateFormat('yMMMMd').format(model.arena.start)} a las ${DateFormat('Hm').format(model.arena.start)}.',
                      )
                    : BigTip(
                        icon: Icons.public,
                        message:
                            'La Arena se cerrará en \n${model.arena.finish.difference(now).inMinutes} minutos.',
                      ),
                bottomNavigationBar: Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: RaisedButton(
                      onPressed: model.getItemCount != 0 &&
                              (model.arena.start.isBefore(DateTime.now()) && model.arena.finish.isAfter(DateTime.now()))
                          ? () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  fullscreenDialog: true,
                                  builder: (_) =>
                                      ChangeNotifierProvider<TestQuestionModel>(
                                    create: (_) => TestQuestionModel(
                                      context,
                                      true,
                                      100,
                                      isArena: true,
                                      seed: model.arena.seed,
                                    ),
                                    child: QuestionPage(
                                      finish: model.arena.finish,
                                      isArena: true,
                                    ),
                                  ),
                                ),
                              )
                          : null,
                      color: Theme.of(context).accentColor,
                      child: Text('UNIRME A LA ARENA'),
                    )));
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Arena'),
                centerTitle: true,
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
