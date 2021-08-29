import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class AusBody extends StatefulWidget {
  final List<String> audios;

  const AusBody({this.audios});

  @override
  _AusBodyState createState() => _AusBodyState();
}

class _AusBodyState extends State<AusBody> {
  final player = AudioCache();

  Widget get _audioBox => SizedBox(
        height: 32,
        width: 32,
      );

  void playAudio(String path) {
    player.play('audios/$path.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://i.imgur.com/i1Am59w.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment(-0.25, -0.39),
                child: InkWell(
                  onTap: () => playAudio(widget.audios[0]),
                  child: _audioBox,
                ),
              ),
              Align(
                alignment: Alignment(0.31, -0.39),
                child: InkWell(
                  onTap: () => playAudio(widget.audios[1]),
                  child: _audioBox,
                ),
              ),
              Align(
                alignment: Alignment(0.20, 0.07),
                child: InkWell(
                  onTap: () => playAudio(widget.audios[2]),
                  child: _audioBox,
                ),
              ),
              Align(
                alignment: Alignment(0.41, 0.28),
                child: InkWell(
                  onTap: () => playAudio(widget.audios[3]),
                  child: _audioBox,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
