import 'dart:async';

import 'package:flutter/services.dart';

class HumanTime {
  static const MethodChannel _channel =
      const MethodChannel('human_time');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
