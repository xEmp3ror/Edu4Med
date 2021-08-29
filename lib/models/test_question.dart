import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'index.dart';
import 'query_model.dart';

/// Numero total de cuestiones por pagina
const int QUESTION_PER_PAGE = 4;

class TestQuestionModel extends QueryModel {
  /// Controla si el usuario desea crear un test aleatorio
  final bool isRandom;

  final int seed;

  final bool isArena;

  final int totalPages;

  /// Lista de respuestas del usuario
  List<int> questionAnswers;

  /// Lista de paginas, cada una con una lista de preguntas
  List<List> _questionPages;

  TestQuestionModel(BuildContext context, this.isRandom, this.totalPages,
      {this.seed, this.isArena = false})
      : super(context);

  @override
  Future loadData([BuildContext context]) async {
    questionAnswers = List.generate(totalPages, (_) => -1);
    _questionPages = List.generate(totalPages, (_) => List());

    if (await canLoadData()) {
      // Listas donde se guardaran las preguntas verdaderas y falsas
      // de donde se seleccionaran las preguntas a mostarr
      List verdaderas, falsas;

      Random rng = seed != null ? Random(seed) : Random();

      // Recogemos las preguntas desde un fichero local
      List questions = json.decode(
        await DefaultAssetBundle.of(context)
            .loadString('assets/tests/data.json'),
      )['questions'];

      if (!isRandom) {
        // Lista de respuestas del usuario
        List<int> selected =
            Provider.of<TestChapterModel>(context, listen: false)
                .getSelectedIndex;

        // Seleccionamos 10 preguntas verdaderas de forma aleatoria
        verdaderas = (questions
                .where(
                  (item) =>
                      item['answer'] == true &&
                      selected.contains(item['chapter']),
                )
                .toList()
                  ..shuffle())
            .sublist(0, totalPages)
            .map((item) => TestQuestion.fromDocument(item))
            .toList();

        // Seleccionamos 30 preguntas falsas de forma aleatoria
        falsas = (questions
                .where(
                  (item) =>
                      item['answer'] == false &&
                      selected.contains(item['chapter']),
                )
                .toList()
                  ..shuffle())
            .sublist(0, QUESTION_PER_PAGE * totalPages - totalPages)
            .map((item) => TestQuestion.fromDocument(item))
            .toList();
      } else {
        // Seleccionamos 10 preguntas verdaderas de forma aleatoria
        verdaderas = (questions.where((item) => item['answer'] == true).toList()
              ..shuffle(rng))
            .sublist(0, totalPages)
            .map((item) => TestQuestion.fromDocument(item))
            .toList()
              ..shuffle();

        // Seleccionamos 30 preguntas falsas de forma aleatoria
        falsas = (questions.where((item) => item['answer'] == false).toList()
              ..shuffle(rng))
            .sublist(0, QUESTION_PER_PAGE * totalPages - totalPages)
            .map((item) => TestQuestion.fromDocument(item))
            .toList()
              ..shuffle();
      }

      // Creamos cada set de preguntas para cada pantalla.
      // Introducimos una verdadera y tres falsas
      for (int i = 0; i < totalPages; ++i) {
        _questionPages[i].addAll([
          verdaderas[i],
          falsas[i + 0 + (i * 2)],
          falsas[i + 1 + (i * 2)],
          falsas[i + 2 + (i * 2)],
        ]..shuffle());
      }

      finishLoading();
    }
  }

  void sendTest(BuildContext context) async =>
      await Firestore.instance.collection('test_results').add({
        'chapters': isRandom
            ? null
            : Provider.of<TestChapterModel>(context, listen: false)
                .getSelectedIndex,
        'date': DateTime.now(),
        'mark': score,
        'right': rightAnswers,
        'wrong': wrongAnswers,
        'token': Provider.of<UserModel>(context, listen: false).user.token,
      });

  void sendArena(BuildContext context) async =>
      await Firestore.instance.collection('arena_results').add({
        'house': Provider.of<UserModel>(context, listen: false).user.house,
        'right': rightAnswers,
        'wrong': wrongAnswers,
        'name': Provider.of<UserModel>(context, listen: false).user.name,
        'seed': Provider.of<ArenaModel>(context, listen: false).arena.seed,
      });

  List<TestQuestion> getPage(int i) => _questionPages[i].cast<TestQuestion>();

  int getAnswer(int page) => questionAnswers[page];
  void setAnswer(int page, int i) {
    questionAnswers[page] = i;
    notifyListeners();
  }

  TestQuestion getFinalAnswer(int index) => getPage(index)[getAnswer(index)];

  int get rightAnswers {
    int score = 0;
    for (int i = 0; i < totalPages; ++i) {
      if (getAnswer(i) != -1) score += getFinalAnswer(i).answer ? 1 : 0;
    }

    return score;
  }

  int get answeredQuestions =>
      questionAnswers.where((element) => element != -1).length;

  int get wrongAnswers {
    int score = 0;
    for (int i = 0; i < totalPages; ++i) {
      if (getAnswer(i) != -1) score += !getFinalAnswer(i).answer ? 1 : 0;
    }

    return score;
  }

  double get score =>
      ((rightAnswers * 10) - ((answeredQuestions - rightAnswers) * 3)) /
      totalPages;
}

class TestQuestion {
  final String id, question;
  final num chapter;
  final bool answer;

  const TestQuestion({
    this.id,
    this.question,
    this.chapter,
    this.answer,
  });

  factory TestQuestion.fromDocument(Map<String, dynamic> json) {
    return TestQuestion(
      // id: json['id'],
      id: '0',
      question: json['question'],
      chapter: json['chapter'],
      answer: json['answer'],
    );
  }
}
