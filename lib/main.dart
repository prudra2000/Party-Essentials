import 'package:flutter/material.dart';
import 'package:partyApp/screens/counterPage.dart';
import 'package:partyApp/screens/diceRoller/diceListScreen.dart';
import 'package:partyApp/screens/randomGen/randomGenList.dart';
import 'screens/Times/stopWatch.dart';
import 'screens/cardsScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Party Essentials',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: AppBar(
        title: Text('Party Essentials'),
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
                        icon: new Image.asset('assets/icons/Dice.png'),
                        iconSize: 150,
                        onPressed: () {
                          Route route = new MaterialPageRoute(
                              builder: (context) => DiceList());
                          Navigator.push(context, route);
                        }),
                    Text(
                      'Dice Roller',
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
                      icon: new Image.asset('assets/icons/StopWatch.png'),
                      iconSize: 150,
                      onPressed:  () {
                          Route route = new MaterialPageRoute(
                              builder: (context) => StopWatch());
                          Navigator.push(context, route);
                        }),
                    Text(
                      'Stopwatch',
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
                      icon: new Image.asset('assets/icons/RanName.png'),
                      iconSize: 150,
                      onPressed:  () {
                          Route route = new MaterialPageRoute(
                              builder: (context) => RandomList());
                          Navigator.push(context, route);
                        }),
                    Text(
                      'Random Generators',
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
                      icon: new Image.asset('assets/icons/Counter.png'),
                      iconSize: 150,
                      onPressed: () {
                          Route route = new MaterialPageRoute(
                              builder: (context) => CounterScreen());
                          Navigator.push(context, route);
                        }
                    ),
                    Text(
                      'Counter',
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
                      icon: new Image.asset('assets/icons/Cards.png'),
                      iconSize: 150,
                      onPressed: () {
                          Route route = new MaterialPageRoute(
                              builder: (context) => CardScreen());
                          Navigator.push(context, route);
                        }),
                    Text(
                      'Card Deck',
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
                      icon: new Image.asset('assets/icons/Info.png'),
                      iconSize: 150,
                      onPressed: null,
                    ),
                    Text(
                      'Info',
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
