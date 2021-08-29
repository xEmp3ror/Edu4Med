import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ButtonCell extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final Widget screen;

  const ButtonCell({
    this.title,
    this.icon,
    this.color,
    this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        ),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: color,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Expanded(
                flex: 3,
                child: LayoutBuilder(
                  builder: (context, constrains) => Column(
                    children: <Widget>[
                      Icon(
                        icon,
                        size: constrains.biggest.height * 0.5,
                        color: Colors.black54,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          title.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
