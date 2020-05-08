import 'package:flutter/material.dart';
import 'dart:math';

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
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      rollDice();
                    },
                    child: Image.asset('images/dice$leftDiceNumber.png')),
              ),
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      rollDice();
                    },
                    child: Image.asset('images/dice$rightDiceNumber.png')),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      rightDiceNumber = 0;
                    });
                  },
                  child: Text('1 Dice'),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if (rightDiceNumber == 0) {
                      rightDiceNumber = 1;
                    }
                  });
                },
                child: Text('2 Die'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      if (rightDiceNumber != 0) {
        rightDiceNumber = Random().nextInt(6) + 1;
      }
    });
  }
}
