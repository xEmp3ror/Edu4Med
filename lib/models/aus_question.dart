import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'index.dart';
import 'query_model.dart';

const int TOTAL_PAGES = 10;

class AusQuestionModel extends QueryModel {
  /// Lista de respuestas del usuario
  List<int> questionAnswers = List.generate(10, (_) => -1);

  /// Lista de preguntas
  List<AusQuestion> questions;

  AusQuestionModel(BuildContext context) : super(context);

  @override
  Future loadData([BuildContext context]) async {
    if (await canLoadData()) {
      // Recogemos las preguntas desde un fichero local
      List rawQuestions = json.decode(
        await DefaultAssetBundle.of(context)
            .loadString('assets/tests/aus.json'),
      )['questions'];

      // Mezclamos las distintas preguntad disponibles
      rawQuestions.shuffle();

      // Generamos items desde el fichero json
      questions = [
        for (final item in rawQuestions.sublist(0, 10))
          AusQuestion.fromDocument(item)
      ];

      finishLoading();
    }
  }

  void sendAus(BuildContext context) async =>
      await Firestore.instance.collection('aus_results').add({
        'date': DateTime.now(),
        'mark': score,
        'token': Provider.of<UserModel>(context, listen: false).user.token,
        'right': rightAnswers,
        'wrong': wrongAnswers,
      });

  int getAnswer(int page) => questionAnswers[page];

  void setAnswer(int page, int i) {
    questionAnswers[page] = i;
    notifyListeners();
  }

  bool isRight(int page) => questionAnswers[page] == questions[page].correct;

  int get rightAnswers {
    int score = 0;
    for (int i = 0; i < TOTAL_PAGES; ++i) {
      if (getAnswer(i) != -1) score += isRight(i) ? 1 : 0;
    }

    return score;
  }

  int get answeredQuestions =>
      questionAnswers.where((element) => element != -1).length;

  int get wrongAnswers {
    int score = 0;
    for (int i = 0; i < TOTAL_PAGES; ++i) {
      if (getAnswer(i) != -1) score += !isRight(i) ? 1 : 0;
    }

    return score;
  }

  double get score =>
      ((rightAnswers * 10) - ((answeredQuestions - rightAnswers) * 3)) /
      TOTAL_PAGES;
}

class AusQuestion {
  final String id, question;
  final List options, audios;
  final int correct;

  const AusQuestion({
    this.id,
    this.question,
    this.options,
    this.audios,
    this.correct,
  });

  factory AusQuestion.fromDocument(Map<String, dynamic> json) {
    return AusQuestion(
      id: json['id'],
      question: json['question'],
      options: [
        json['option_1'],
        json['option_2'],
        json['option_3'],
        json['option_4'],
      ],
      audios: [
        json['foco_1'],
        json['foco_2'],
        json['foco_3'],
        json['foco_4'],
      ],
      correct: int.tryParse(json['answer']) - 1,
    );
  }
}
