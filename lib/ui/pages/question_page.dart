import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:row_collection/row_collection.dart';

import '../../models/index.dart';
import '../../widgets/answer_cell.dart';

const List _letters = ['A', 'B', 'C', 'D'];

class AnswerPage extends StatelessWidget {
  final int page;

  const AnswerPage(this.page);

  @override
  Widget build(BuildContext context) {
    return Consumer<TestQuestionModel>(
      builder: (context, model, child) => SingleChildScrollView(
        child: RowLayout.cards(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            for (TestQuestion question in model.getPage(page))
              AnswerCell(
                optionNumber: _letters[model.getPage(page).indexOf(question)],
                question: question.question,
                selected: model.getAnswer(page) ==
                    model.getPage(page).indexOf(question),
                onTap: () => model.setAnswer(
                    page, model.getPage(page).indexOf(question)),
              ),
          ],
        ),
      ),
    );
  }
}
