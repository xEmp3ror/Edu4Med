import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CountdownWidget extends StatefulWidget {
  final DateTime finish;

  const CountdownWidget(this.finish);

  @override
  State createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: widget.finish.millisecondsSinceEpoch -
            DateTime.now().millisecondsSinceEpoch,
      ),
    );
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Countdown(
      animation: StepTween(
        begin: widget.finish.millisecondsSinceEpoch,
        end: DateTime.now().millisecondsSinceEpoch,
      ).animate(_controller),
      finish: widget.finish,
    );
  }
}

class Countdown extends AnimatedWidget {
  final Animation<int> animation;
  final DateTime finish;

  const Countdown({
    Key key,
    this.animation,
    this.finish,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Duration diff = finish.difference(DateTime.now());
    return Text(
      !diff.isNegative
          ? '${digitsToString((diff.inMinutes % 60) ~/ 10, (diff.inMinutes % 60) % 10)}:${digitsToString((diff.inSeconds % 60) ~/ 10, (diff.inSeconds % 60) % 10)}'
          : '00:00',
      style: TextStyle(
        fontFamily: 'RobotoMono',
        fontWeight: FontWeight.w300,
        color: Colors.white,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(0, 0),
            blurRadius: 4,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }

  String digitsToString(int digit0, int digit1) =>
      digit0.toString() + digit1.toString();
}
