import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'query_model.dart';

class ArenaModel extends QueryModel {
  List<House> houses;
  List<ArenaResult> results;

  @override
  Future loadData([BuildContext context]) async {
    startLoading();

    if (await canLoadData()) {
      final QuerySnapshot response = await Firestore.instance
          .collection('arena')
          .orderBy('start')
          .getDocuments();

      items.clear();
      items.addAll(
        response.documents
            .map((document) => Arena.fromDocument(document))
            .toList(),
      );

      final QuerySnapshot housesResponse = await Firestore.instance
          .collection('houses')
          .orderBy('id')
          .getDocuments();

      houses = housesResponse.documents
          .map<House>((document) => House.fromDocument(document))
          .toList();

      final QuerySnapshot resultsResponse =
          await Firestore.instance.collection('arena_results').getDocuments();

      results = resultsResponse.documents
          .map<ArenaResult>((document) => ArenaResult.fromDocument(document))
          .toList();

      finishLoading();
    }
    return "ASD";
  }

  Arena get arena => getItem(0);

  bool get arenaEmpty => results.any((element) => element.seed == arena.seed);

  num getHouseMarkLast(int house) {
    int r = getHouseRightLast(house);
    int w = getHouseWrongLast(house);
    int len = results.where((element) => element.house == house).length;
    int siz = houses[house].size;

    return (((r * 10) - (w * 3)) * (len / siz)).round();
  }

  String getBestMemberLast(int house) {
    List<ArenaResult> list = results
        .where((result) => result.house == house && result.seed == arena.seed)
        .toList()
          ..sort((a, b) => a.right.compareTo(b.right));

    return list.first.name;
  }

  num getHouseMark(int house) {
    int r = getHouseRight(house);
    int w = getHouseWrong(house);
    int len = results.where((element) => element.house == house).length;
    int siz = houses[house].size;

    return (((r * 10) - (w * 3)) * (len / siz)).round();
  }

  num getHouseRight(int house) {
    num total = 0;
    results
        .where((result) => result.house == house)
        .forEach((result) => total += result.right);

    return total;
  }

  num getHouseWrongLast(int house) {
    num total = 0;
    results
        .where((result) => result.house == house && result.seed == arena.seed)
        .forEach((result) => total += result.wrong);

    return total;
  }

  num getHouseRightLast(int house) {
    num total = 0;
    results
        .where((result) => result.house == house && result.seed == arena.seed)
        .forEach((result) => total += result.right);

    return total;
  }

  num getHouseWrong(int house) {
    num total = 0;
    results
        .where((result) => result.house == house)
        .forEach((result) => total += result.wrong);

    return total;
  }

  String getBestMember(int house) {
    List<ArenaResult> list = results
        .where((result) => result.house == house)
        .toList()
          ..sort((a, b) => a.right.compareTo(b.right));

    return list.first.name;
  }
}

class Arena {
  final String id;
  final DateTime start, finish;
  final int seed;

  const Arena({
    this.id,
    this.start,
    this.finish,
    this.seed,
  });

  factory Arena.fromDocument(DocumentSnapshot document) {
    return Arena(
      id: document.documentID,
      start: document['start'].toDate(),
      finish: document['finish'].toDate(),
      seed: document['seed'],
    );
  }
}

class ArenaResult {
  final String id, name;
  final int seed, mark, house, right, wrong;

  const ArenaResult({
    this.id,
    this.name,
    this.mark,
    this.seed,
    this.house,
    this.right,
    this.wrong,
  });

  factory ArenaResult.fromDocument(DocumentSnapshot document) {
    return ArenaResult(
      id: document.documentID,
      name: document['name'],
      mark: document['mark'],
      seed: document['seed'],
      house: document['house'],
      right: document['right'],
      wrong: document['wrong'],
    );
  }
}

class House {
  final String documentId, name;
  final int id, size;

  const House({
    this.documentId,
    this.name,
    this.id,
    this.size,
  });

  factory House.fromDocument(DocumentSnapshot document) {
    return House(
      documentId: document.documentID,
      name: document['name'],
      id: document['id'],
      size: document['size'],
    );
  }
}
