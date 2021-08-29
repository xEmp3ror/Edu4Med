import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'query_model.dart';

class TestChapterModel extends QueryModel {
  List<bool> selectedChapters;

  @override
  Future loadData([BuildContext context]) async {
    if (await canLoadData()) {
      final QuerySnapshot response = await Firestore.instance
          .collection('test_chapters')
          .orderBy('index')
          .getDocuments();

      items.addAll(
        response.documents
            .map((document) => TestChapter.fromDocument(document))
            .toList(),
      );

      selectedChapters = List.filled(items.length, false);

      finishLoading();
    }
  }

  void setChapterValue(int index, bool state) {
    selectedChapters[index] = state;
    notifyListeners();
  }

  bool get hasSelectedChapters => selectedChapters.any((chapter) => chapter);

  List<int> get getSelectedIndex => [
        for (int i = 0; i < selectedChapters.length; ++i)
          if (selectedChapters[i]) i + 1
      ];
}

class TestChapter {
  final String id, name;
  final num index;

  const TestChapter({
    this.id,
    this.name,
    this.index,
  });

  factory TestChapter.fromDocument(DocumentSnapshot document) {
    return TestChapter(
      id: document.documentID,
      name: document['name'],
      index: document['index'],
    );
  }
}
