import 'package:flutter/material.dart';
import "dart:math";

class RanNamePicker extends StatefulWidget {
  @override
  _RanNamePicker createState() => _RanNamePicker();
}

class _RanNamePicker extends State<RanNamePicker> {
  final List<String> _nameList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();
  var element = 'Add Names';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: AppBar(
        title: Text('Random Name Picker'),
        backgroundColor: Color.fromRGBO(188, 53, 46, 1),
      ),
      body: ListView(children: _getNames()),
      //ListView(children: _getNames()),

      floatingActionButton: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "btn1",
              onPressed: () => ranName(),
              tooltip: 'Add Names',
              child: Icon(Icons.refresh),
              backgroundColor: Color.fromRGBO(188, 53, 46, 1),
            ),
            Padding(padding: EdgeInsets.all(15.0)),
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: () => _addDialog(context),
              tooltip: 'Add Names',
              child: Icon(Icons.add),
              backgroundColor: Color.fromRGBO(188, 53, 46, 1),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        child: new Container(
          height: 150.0,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(20.0)),
              Text(
                'Random Pick:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                '$element',
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

  //_addDialog(context),
  T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }

  void ranName() {
    element = getRandomElement(_nameList);
    setState(() {
      element = element;
    });
  }

  void _addNames(String title) {
    setState(() {
      _nameList.add(title);
    });
    _textFieldController.clear();
  }

  Widget _buildNameList(String title) {
    return ListTile(
        title: Text(
      title,
      style: TextStyle(color: Colors.white),
    ));
  }

  Future<AlertDialog> _addDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add an name to the list'),
            content: TextField(
              controller: _textFieldController,
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Add'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addNames(_textFieldController.text);
                },
              ),
              FlatButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  List<Widget> _getNames() {
    final List<Widget> _namesW = <Widget>[];
    for (String title in _nameList) {
      _namesW.add(_buildNameList(title));
    }
    return _namesW;
  }
}
