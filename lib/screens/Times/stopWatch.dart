import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopWatch extends StatefulWidget {
  @override
  _StopWatch createState() => _StopWatch();
}

class _StopWatch extends State<StopWatch> {
  final _isHours = true;
  final _scrollCon = ScrollController();
  final StopWatchTimer _timer = StopWatchTimer(
    isLapHours: true,
    //onChange: (value) => print('onChange $value'),
    //onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
    //onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
  );
  @override
  void dispose() async {
    super.dispose();
    await _timer.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: AppBar(
        title: Text('Stop Watch'),
        backgroundColor: Color.fromRGBO(188, 53, 46, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
              stream: _timer.rawTime,
              initialData: _timer.rawTime.value,
              builder: (context, snap) {
                final value = snap.data;
                final displayTime =
                    StopWatchTimer.getDisplayTime(value, hours: _isHours);
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        displayTime,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: RaisedButton(
                            padding: const EdgeInsets.all(4),
                            color: Color.fromRGBO(188, 53, 46, 1),
                            shape: const StadiumBorder(),
                            onPressed: () async {
                              _timer.onExecute.add(StopWatchExecute.start);
                            },
                            child: const Text(
                              'Start',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: RaisedButton(
                            padding: const EdgeInsets.all(4),
                            color: Color.fromRGBO(188, 53, 46, 1),
                            shape: const StadiumBorder(),
                            onPressed: () async {
                              _timer.onExecute.add(StopWatchExecute.stop);
                            },
                            child: const Text(
                              'Stop',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: RaisedButton(
                            padding: const EdgeInsets.all(4),
                            color: Color.fromRGBO(188, 53, 46, 1),
                            shape: const StadiumBorder(),
                            onPressed: () async {
                              _timer.onExecute.add(StopWatchExecute.reset);
                            },
                            child: const Text(
                              'Reset',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.all(0).copyWith(right: 1),
                                child: RaisedButton(
                                  padding: const EdgeInsets.all(4),
                                  color: Color.fromRGBO(188, 53, 46, 1),
                                  shape: const StadiumBorder(),
                                  onPressed: () async {
                                    _timer.onExecute.add(StopWatchExecute.lap);
                                  },
                                  child: const Text(
                                    'Lap',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            height: 300,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(8),),
                Text(
                  'Laps',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Container(
                  height: 220,
                  margin: const EdgeInsets.all(10),
                  child: StreamBuilder<List<StopWatchRecord>>(
                      stream: _timer.records,
                      initialData: _timer.records.value,
                      builder: (context, snap) {
                        final value = snap.data;
                        if (value.isEmpty) {
                          return Container();
                        }
                        Future.delayed(const Duration(milliseconds: 100), () {
                          _scrollCon.animateTo(
                            _scrollCon.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeOut,
                          );
                        });
                        return ListView.builder(
                          controller: _scrollCon,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            final data = value[index];
                            return Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    '${index + 1} | ${data.displayTime}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                )
                              ],
                            );
                          },
                          itemCount: value.length,
                        );
                      }),
                ),
              ],
            )),
        color: Color.fromRGBO(30, 30, 30, 1),
      ),
    );
  }
}
