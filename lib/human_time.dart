import 'dart:async';

import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
import 'package:human_time/time_diff.dart';

class HumanTime {
  // static const MethodChannel _channel = const MethodChannel('human_time');

  // static Future<String> get platformVersion async {
  //   final String version = await _channel.invokeMethod('getPlatformVersion');
  //   return version;
  // }

  static String timeBetween({@required DateTime from, @required DateTime to}) {

    Duration timeDiff = to.difference(from);

    return MessageTimeDifference.timeDifToHumanReadable(timeDiff);
  }

  static String timeFrom(DateTime from) {
    Duration timeDiff = DateTime.now().difference(from);

    return MessageTimeDifference.timeDifToHumanReadable(timeDiff);
  }

  static Stream<String> timeFromStream(DateTime from) {
    StreamController controller = new StreamController<String>();
    
    // runs every 1 minute
    Timer.periodic(new Duration(minutes: 1), (timer) {
      Duration timeDiff = DateTime.now().difference(from);
      controller.sink
          .add(MessageTimeDifference.timeDifToHumanReadable(timeDiff));
    });

  Duration timeDiff = DateTime.now().difference(from);
      controller.sink
          .add(MessageTimeDifference.timeDifToHumanReadable(timeDiff));
          
    return controller.stream;
  }
}
