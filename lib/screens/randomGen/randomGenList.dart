import 'package:flutter/material.dart';
import 'package:partyApp/screens/randomGen/randomName.dart';
import 'package:partyApp/screens/randomGen/randomNumberGen.dart';

class RandomList extends StatefulWidget {
  @override
  _RandomList createState() => _RandomList();
}

class _RandomList extends State<RandomList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: AppBar(
        title: Text('Random Generators'),
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
                        icon: new Image.asset('assets/icons/RanNameMain.png'),
                        iconSize: 150,
                        onPressed: () {
                          Route route = new MaterialPageRoute(
                              builder: (context) => RanNamePicker());
                          Navigator.push(context, route);
                        }),
                    Text(
                      'Random Name Generator',
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
                        icon: new Image.asset('assets/icons/RanNum.png'),
                        iconSize: 150,
                        onPressed: () {
                          Route route = new MaterialPageRoute(
                              builder: (context) => RanNumGen());
                          Navigator.push(context, route);
                        }),
                    Text(
                      'Random Number Generator',
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
