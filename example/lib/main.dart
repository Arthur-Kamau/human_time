import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:human_time/human_time.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await HumanTime.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Widget _temDiffernceBetween() {
    DateTime from = DateTime.now().subtract(Duration(days: 30));
    DateTime to = DateTime.now().subtract(Duration(days: 5));

    return Text(HumanTime.timeBetween(from: from, to: to));
  }

  Widget _temDiffernceFrom() {
    DateTime from = DateTime.now().subtract(Duration(days: 5));

    return Text(HumanTime.timeFrom(from));
  }

  Widget _timeStream() {
    return StreamBuilder(
      stream:
          HumanTime.timeFromStream(DateTime.now().subtract(Duration(hours: 2))),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data);
        } else {
          return Text("Error ");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Running on: $_platformVersion\n'),
            SizedBox(height: 20),
            Text('Time stream :\n'),
            _timeStream(),
            SizedBox(height: 20),
            Text('Time difference :\n'),
            _temDiffernceBetween(),
            SizedBox(height: 20),
            Text('Time From :\n'),
            _temDiffernceFrom(),
          ],
        ),
      ),
    );
  }
}
