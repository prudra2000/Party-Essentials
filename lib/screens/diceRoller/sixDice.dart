import 'package:flutter/material.dart';
import 'dart:math';

class SixSideDice extends StatefulWidget{
  @override
  _SixSideDice createState() => _SixSideDice();
}
class _SixSideDice extends State<SixSideDice>{
  AssetImage one = AssetImage("assets/screens/DiceScreen/6 Sided/1.png");
  AssetImage two = AssetImage("assets/screens/DiceScreen/6 Sided/2.png");
  AssetImage three = AssetImage("assets/screens/DiceScreen/6 Sided/3.png");
  AssetImage four = AssetImage("assets/screens/DiceScreen/6 Sided/4.png");
  AssetImage five = AssetImage("assets/screens/DiceScreen/6 Sided/5.png");
  AssetImage six = AssetImage("assets/screens/DiceScreen/6 Sided/6.png");
  int diceOne;
  int diceTwo;
  int rollTotal;
  @override

  void initState() {
    super.initState();

    setState(() {
      diceOne = 1;
      diceTwo = 1;
      rollTotal  = 0;
    });
  }

  void sixFaceRoll() {
    int randomSix1 = (Random().nextInt(6)) + 1;
    int randomSix2 = (Random().nextInt(6)) + 1;
    setState(() {
      diceOne = randomSix1;
      diceTwo = randomSix2;
      rollTotal = diceOne + diceTwo;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: AppBar(
        title: Text('Dice Roller'),
        backgroundColor: Color.fromRGBO(188, 53, 46, 1),
      ),
      body: Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You Rolled a:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text(
                '$rollTotal',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              Padding(padding: EdgeInsets.all(15.0)),
              Image.asset(
                "assets/screens/DiceScreen/6 Sided/$diceOne.png",
                width: 200,
                height: 200,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Image.asset(
                "assets/screens/DiceScreen/6 Sided/$diceTwo.png",
                width: 200,
                height: 200,
              ),
            ],
          ),
        
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 40.0,
        ),
        color: Color.fromRGBO(30, 30, 30, 1),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => sixFaceRoll(),
        tooltip: 'Roll',
        child: Icon(Icons.refresh),
        backgroundColor: Color.fromRGBO(188, 53, 46, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
  }
}