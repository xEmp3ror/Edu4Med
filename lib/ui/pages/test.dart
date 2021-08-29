import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:row_collection/row_collection.dart';

import '../../models/index.dart';
import 'index.dart';

class TestSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TestChapterModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Selecciona el tema del Cuestionario'),
          centerTitle: true,
        ),
        bottomNavigationBar: model.isLoaded && !model.hasSelectedChapters
            ? Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (_) => ChangeNotifierProvider<TestQuestionModel>(
                        create: (_) => TestQuestionModel(context, true, 30),
                        child: QuestionPage(
                          finish: DateTime.now().add(Duration(minutes: 15)),
                          isRandom: true,
                        ),
                      ),
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                  child: Text('ALEATORIO'),
                ),
              )
            : null,
        body: model.isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: model.getItemCount,
                itemBuilder: (context, index) {
                  final TestChapter chapter = model.getItem(index);
                  return Column(
                    children: <Widget>[
                      CheckboxListTile(
                        value: model.selectedChapters[index],
                        onChanged: (state) =>
                            model.setChapterValue(index, state),
                        title: Text(
                          'Tema ${chapter.index}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          '${chapter.name}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Separator.divider(indent: 16),
                    ],
                  );
                },
              ),
        floatingActionButton: model.isLoaded && model.hasSelectedChapters
            ? FloatingActionButton(
                child: Icon(Icons.done),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (_) => ChangeNotifierProvider<TestQuestionModel>(
                      create: (_) => TestQuestionModel(context, false, 10),
                      child: QuestionPage(
                        finish: DateTime.now().add(Duration(minutes: 15)),
                      ),
                    ),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
