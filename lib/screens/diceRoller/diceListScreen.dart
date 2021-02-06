import 'package:flutter/material.dart';
import 'package:partyApp/screens/diceRoller/fourDice.dart';
import 'package:partyApp/screens/diceRoller/sixDice.dart';
import 'package:partyApp/screens/randomGen/randomName.dart';
import 'package:partyApp/screens/randomGen/randomNumberGen.dart';

class DiceList extends StatefulWidget {
  @override
  _DiceList createState() => _DiceList();
}

class _DiceList extends State<DiceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: AppBar(
        title: Text('Dices'),
        backgroundColor: Color.fromRGBO(188, 53, 46, 1),
      ),
      body: Column(children: <Widget>[
        Padding(padding: EdgeInsets.all(20.0)),
        new Expanded(
          child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: [
              Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                    IconButton(
                        icon: new Image.asset('assets/icons/4Dice.png'),
                        iconSize: 150,
                        onPressed: () {
                          Route route = new MaterialPageRoute(
                              builder: (context) => FourSidedDice());
                          Navigator.push(context, route);
                        }),
                    Text(
                      '4 Sided Dice',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ])),
              Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                    IconButton(
                        icon: new Image.asset('assets/icons/6Dice.png'),
                        iconSize: 150,
                        onPressed: () {
                          Route route = new MaterialPageRoute(
                              builder: (context) => SixSideDice());
                          Navigator.push(context, route);
                        }),
                    Text(
                      '6 Sided Dice',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ])),
            ],
          ),
        )
      ]),
    );
  }
}
