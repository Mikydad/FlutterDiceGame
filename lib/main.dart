import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;
  Function randomNumberGenerator() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 150.0),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    randomNumberGenerator();
                  },
                  child: Image(
                    image: AssetImage('images/dice$leftDiceNumber.png'),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    randomNumberGenerator();
                  },
                  child: Image(
                    image: AssetImage('images/dice$rightDiceNumber.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: ElevatedButton(
            onPressed: randomNumberGenerator, child: Text('Roll')),
      )
    ]));
  }
}
