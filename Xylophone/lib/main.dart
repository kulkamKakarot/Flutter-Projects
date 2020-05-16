import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(Xylophone());

class Xylophone extends StatelessWidget {
  void playSound(int n) {
    final player = AudioCache();
    player.play('note$n.wav');
  }

  Expanded buildKey(int n, String s,MaterialColor meracolor) {
    return Expanded(
      child: FlatButton(
        color: meracolor,
        onPressed: () {
          playSound(n);
        },
        child: Text(s),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey(1,'SA',Colors.amber),
                buildKey(2,'RE',Colors.indigo),
                buildKey(3,'GA',Colors.blue),
                buildKey(4,'MA',Colors.green),
                buildKey(5,'PA',Colors.yellow),
                buildKey(6,'DHA',Colors.orange),
                buildKey(7,'NI',Colors.red),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
