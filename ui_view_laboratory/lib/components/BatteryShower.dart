/*
 * @Descripttion: 
 * @version: 
 * @Author: sc
 * @Date: 2024-07-04 22:17:51
 */
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

Widget buildBatteryShower(double batteryLevel) {
  late Color color;
  double level = batteryLevelTransform(batteryLevel);
  if (level > 0.4) {
    color = Colors.green;
  } else if (level > 0.2) {
    color = Colors.orange;
  } else {
    color = Colors.red;
  }
  return CircularPercentIndicator(
    radius: 40.0,
    lineWidth: 8.0,
    percent: level,
    center: Text("$batteryLevel%", style: TextStyle(fontSize: 20, color: color),),
    progressColor: color,
  );
}

double batteryLevelTransform(double batteryLevel) {
  return batteryLevel / 100;
}
