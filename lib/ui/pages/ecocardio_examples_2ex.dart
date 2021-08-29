import 'package:flutter/material.dart';
import 'package:nevada/widgets/index.dart';
import 'package:row_collection/row_collection.dart';

class EcocardioExamples2 extends StatelessWidget {
  final String exampleTitle, title1, image1, title2, image2;

  const EcocardioExamples2({
    this.exampleTitle,
    this.title1,
    this.image1,
    this.title2,
    this.image2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exampleTitle),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          RowLayout.cards(
            children: <Widget>[
              CardPage.body(
                title: title1,
                body: Image.asset(image1),
              ),
              CardPage.body(
                title: title2,
                body: Image.asset(image2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
