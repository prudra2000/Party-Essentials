import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreen createState() => _CounterScreen();
}

class _CounterScreen extends State<CounterScreen> {
  final List<String> _nameList = <String>[];
  List<int> _countList = <int>[];
  final TextEditingController _nameFieldController = TextEditingController();
  final TextEditingController _countFieldController = TextEditingController();
  var element = 'Add Names';
  final int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: AppBar(
        title: Text('Counter'),
        backgroundColor: Color.fromRGBO(188, 53, 46, 1),
      ),
      body: _buildCounters(),
      floatingActionButton: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
          height: 40.0,
        ),
        color: Color.fromRGBO(30, 30, 30, 1),
      ),
    );
  }

  void _addNames(String title) {
    setState(() {
      _nameList.add(title);
    });
    _nameFieldController.clear();
  }

  void _adCounter(int count) {
    setState(() {
      _countList.add(count);
    });
    _countFieldController.clear();
  }

  Future<AlertDialog> _addDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add an name to the list'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    decoration: new InputDecoration(labelText: "Counter Name:"),
                    controller: _nameFieldController,
                  ),
                  TextField(
                    decoration:
                        new InputDecoration(labelText: "Starting Amount:"),
                    keyboardType: TextInputType.number,
                    controller: _countFieldController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Add'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addNames(_nameFieldController.text);
                  _adCounter(int.parse(_countFieldController.text));
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
    
  _subCounter(i) {
    setState(() {
      _countList[i]--;
    });
  }

  _addCounter(i) {
    setState(() {
      _countList[i]++;
    });
  }

  Widget _buildCounters() {
    return new ListView.builder(
      itemCount: _nameList.length,
      itemBuilder: (context, i) {
        return new Card(
          color: Color.fromRGBO(30, 30, 30, 1),
          child: Column(
            children: <Widget>[
              ExpansionTile(
                initiallyExpanded: true,
                title: new Text(
                  '${_nameList[i]}',
                ),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      new Text(
                        '${_countList[i]}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      new Container(
                        child: new IconButton(
                          color: Colors.white,
                          icon: new Icon(Icons.remove),
                          highlightColor: Colors.green,
                          onPressed: () {
                            _subCounter(i);
                          },
                        ),
                      ),
                      new Container(
                        child: new IconButton(
                          color: Colors.white,
                          icon: new Icon(Icons.add),
                          highlightColor: Colors.green,
                          onPressed: () {
                            _addCounter(i);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
