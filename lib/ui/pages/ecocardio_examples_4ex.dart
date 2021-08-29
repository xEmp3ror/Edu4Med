import 'package:flutter/material.dart';
import 'package:nevada/widgets/index.dart';
import 'package:row_collection/row_collection.dart';

class EcocardioExamples4 extends StatelessWidget {
  final String exampleTitle,
      title1,
      image1,
      title2,
      image2,
      title3,
      image3,
      title4,
      image4;

  const EcocardioExamples4({
    this.exampleTitle,
    this.title1,
    this.image1,
    this.title2,
    this.image2,
    this.title3,
    this.image3,
    this.title4,
    this.image4,
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
              CardPage.body(
                title: title3,
                body: Image.asset(image3),
              ),
              CardPage.body(
                title: title4,
                body: Image.asset(image4),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
