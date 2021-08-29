import 'package:flutter/material.dart';
import 'package:row_collection/row_collection.dart';

class PuntuacionCell extends StatelessWidget {
  final num mark;
  final String title, description, id;
  final bool isMark;

  const PuntuacionCell({
    this.id,
    this.mark,
    this.title,
    this.description,
    this.isMark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              if (id != null) ...[
                SizedBox(
                  width: 40,
                  child: Text(
                    id.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF6A6A6A),
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Separator.spacer(space: 12),
              ],
              Expanded(
                child: RowLayout(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  space: 2.5,
                  children: <Widget>[
                    Text(
                      title.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: TextStyle(
                        color: Color(0xFF6A6A6A),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      description,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6A6A6A),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Separator.spacer(space: 18),
        Text(
          mark.toStringAsFixed(2),
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
            color: isMark
                ? (mark >= 5 ? Color(0xFF009006) : Color(0xFF900000))
                : Colors.black,
          ),
        ),
      ],
    );
  }
}
