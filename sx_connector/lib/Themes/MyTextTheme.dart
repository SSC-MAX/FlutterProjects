import 'package:flutter/material.dart';

TextStyle appBarText() {
  var style = const TextStyle(
      fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white);
  return style;
}

TextStyle titleTextStyle() {
  return const TextStyle(fontSize: 25, color: Colors.black);
}

TextStyle warmTextStyle() {
  return const TextStyle(fontSize: 25, color: Colors.red, fontWeight: FontWeight.bold);
}
