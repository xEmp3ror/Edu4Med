import 'package:flutter/material.dart';
import 'package:nevada/models/index.dart';
import 'package:nevada/widgets/aus_body.dart';
import 'package:nevada/widgets/index.dart';
import 'package:provider/provider.dart';
import 'package:row_collection/row_collection.dart';

const List _letters = ['A', 'B', 'C', 'D'];

class AusAnswerPage extends StatelessWidget {
  final int page;

  const AusAnswerPage(this.page);

  @override
  Widget build(BuildContext context) {
    return Consumer<AusQuestionModel>(
      builder: (context, model, child) => SingleChildScrollView(
        child: RowLayout.cards(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AusBody(audios: model.questions[page].audios.cast<String>()),
            for (final String question in model.questions[page].options)
              AnswerCell(
                optionNumber:
                    _letters[model.questions[page].options.indexOf(question)],
                question: question,
                selected: model.getAnswer(page) ==
                    model.questions[page].options.indexOf(question),
                onTap: () => model.setAnswer(
                  page,
                  model.questions[page].options.indexOf(question),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
