import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Magic8ball(),
    ),
  );
}

class Magic8ball extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Ask Me Anything'),
        centerTitle: true,
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int guess = 5;
  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
      colors: [Colors.green, Colors.blue])
  ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              setState(() {
                guess = Random().nextInt(5) + 1;
              });
            },
            child: Container(
              child: Image.asset('images/ball$guess.png'),
            ),
          ),
        ],
      ),
    );
  }
}
