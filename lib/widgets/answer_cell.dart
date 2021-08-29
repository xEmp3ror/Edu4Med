import 'package:flutter/material.dart';
import 'package:row_collection/row_collection.dart';

class AnswerCell extends StatelessWidget {
  final String optionNumber, question;
  final Function onTap;
  final bool selected;

  const AnswerCell({
    this.optionNumber,
    this.question,
    this.onTap,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 140,
        width: double.infinity,
        child: Card(
          color: selected == true ? Color(0xFFFFD37C) : Color(0xFFFFFFFF),
          child: RowLayout(
            padding: EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 8),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'OPCIÓN ',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                  Text(
                    optionNumber,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Text(
                question,
                style: TextStyle(
                  fontWeight:
                      selected == true ? FontWeight.bold : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
