import 'package:flutter/material.dart';
import 'dart:math';

class RanNumGen extends StatefulWidget {
  @override
  _RanNumGen createState() => _RanNumGen();
}

class _RanNumGen extends State<RanNumGen> {
  final TextEditingController _maxController = TextEditingController();
  final TextEditingController _minController = TextEditingController();
  var ranNum = 0;
  void _randomNum(){
    setState(() {
      String max = _maxController.text;
      String min = _minController.text;

      Random ran = Random();
      ranNum = ran.nextInt(int.parse(max) + 1 - int.parse(min)) + int.parse(min);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: AppBar(
        title: Text('Random Number Generator'),
        backgroundColor: Color.fromRGBO(188, 53, 46, 1),
      ),
      body: Column(children: <Widget>[
        Padding(padding: EdgeInsets.all(10.0)),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: _minController,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Enter Min Value',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                )
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.all(15.0)),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: _maxController,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Enter Max Value',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                )
              ),
            ],
          ),
        ),        
      ]),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn1",
        onPressed: () {
          _randomNum();
        },
        tooltip: 'Add Names',
        child: Icon(Icons.refresh),
        backgroundColor: Color.fromRGBO(188, 53, 46, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: new Container(
          height: 250.0,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(20.0)),
              Text(
                'Random Number:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Padding(padding: EdgeInsets.all(25.0)),
              Text(
                '$ranNum',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
            ],
          ),
        ),
        color: Color.fromRGBO(30, 30, 30, 1),
      ),
    );
  }
}
