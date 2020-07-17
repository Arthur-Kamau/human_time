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
  @override
  void initState() {
    super.initState();
  }

  Widget _temDiffernceBetween() {
    DateTime from = DateTime.now().subtract(Duration(days: 30));
    DateTime to = DateTime.now().add(Duration(days: 5));
    print("object ${HumanTime.timeBetween(from: from, to: to)}");
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
        } else if (snapshot.hasError) {
          return Text("Error ");
        } else {
          return Text("");
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
        body: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
      ),
    );
  }
}
