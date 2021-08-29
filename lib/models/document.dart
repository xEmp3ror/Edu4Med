import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'query_model.dart';

class DocumentModel extends QueryModel {
  @override
  Future loadData([BuildContext context]) async {
    if (await canLoadData()) {
      final QuerySnapshot response = await Firestore.instance
          .collection('documents')
          .orderBy('number')
          .getDocuments();

      items.addAll(
        response.documents
            .map((document) => Document.fromDocument(document))
            .toList(),
      );

      finishLoading();
    }
  }
}

class Document {
  final String id, title, link;
  final num number;

  const Document({
    this.id,
    this.title,
    this.number,
    this.link,
  });

  factory Document.fromDocument(DocumentSnapshot document) {
    return Document(
      id: document.documentID,
      title: document['title'],
      number: document['number'],
      link: document['link'],
    );
  }

  String get getUrl => 'https://drive.google.com/uc?export=download&id=' + link;
}
