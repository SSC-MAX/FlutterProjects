import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    printTime: true
  )
);

Uri buildSocketUrl(TargetPlatform platform){
  String uri = platform == TargetPlatform.android ? '10.0.2.2' : 'localhost';
  return Uri.parse('ws://$uri:8080/websocket/${platform.toString()}');
}