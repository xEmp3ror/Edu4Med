import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:password/password.dart';

class UserModel with ChangeNotifier {
  User user;

  Future<bool> signup({
    String email,
    String name,
    String nick,
    String hash,
    String token,
  }) async {
    final QuerySnapshot response = await Firestore.instance
        .collection('users')
        .where('token', isEqualTo: token)
        .getDocuments();

    if (response.documents.isNotEmpty &&
        response.documents[0]['email'].isEmpty) {
      await Firestore.instance
          .collection('users')
          .document(response.documents[0].documentID)
          .updateData(
        {
          'email': email,
          'hash': hash,
          'name': name,
          'nick': nick,
          'house': Random().nextInt(4)
        },
      );
      return true;
    }

    return false;
  }

  Future<bool> login({String email, String password}) async {
    final QuerySnapshot response = await Firestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .getDocuments();

    if (response.documents.isNotEmpty &&
        Password.verify(password, response.documents[0]['hash'])) {
      user = User.fromDocument(response.documents[0]);
      return true;
    }

    return false;
  }

  Future<List<UserTest>> getUserTests() async {
    final QuerySnapshot response = await Firestore.instance
        .collection('test_results')
        .where('token', isEqualTo: user.token)
        .getDocuments();

    final list = [
      for (final item in response.documents) UserTest.fromDocument(item)
    ];

    list.sort((a, b) => b.date.compareTo(a.date));

    return [
      if (list.isNotEmpty) list[0],
      if (list.length > 1) list[1],
      if (list.length > 2) list[2],
    ];
  }

  Future<List<UserTest>> getUserTestsFull() async {
    final QuerySnapshot response = await Firestore.instance
        .collection('test_results')
        .where('token', isEqualTo: user.token)
        .getDocuments();

    final list = [
      for (final item in response.documents) UserTest.fromDocument(item)
    ];

    list.sort((a, b) => b.date.compareTo(a.date));

    return list;
  }

  Future<String> getUserHouse() async {
    final QuerySnapshot response = await Firestore.instance
        .collection('houses')
        .where('id', isEqualTo: user.house)
        .getDocuments();

    return response.documents.first['name'];
  }
}

class UserTest {
  final DateTime date;
  final List chapters;
  final String id, token;
  final num mark, right, wrong;

  const UserTest({
    this.id,
    this.token,
    this.mark,
    this.chapters,
    this.date,
    this.right,
    this.wrong,
  });

  factory UserTest.fromDocument(DocumentSnapshot document) {
    return UserTest(
      id: document.documentID,
      mark: document['mark'],
      token: document['token'],
      chapters: document['chapters'],
      date: document['date'].toDate(),
      right: document['right'],
      wrong: document['wrong'],
    );
  }

  String get getDate =>
      '${DateFormat.MMMMEEEEd().format(date)} · ${DateFormat.Hm().format(date)}';

  String get getChapters {
    if (chapters == null)
      return 'TODOS LOS TEMAS';
    else {
      StringBuffer buff = StringBuffer();

      buff.write('TEMA ');
      for (int i = 0; i < chapters.length * 2 - 1; ++i)
        buff.write((i.isEven) ? chapters[i ~/ 2] : ', ');

      return buff.toString();
    }
  }
}

class User {
  final String id, name, token;
  final int house;

  const User({
    this.id,
    this.name,
    this.token,
    this.house,
  });

  factory User.fromDocument(DocumentSnapshot document) {
    return User(
      id: document.documentID,
      name: document['name'],
      token: document['token'],
      house: document['house'],
    );
  }
}
