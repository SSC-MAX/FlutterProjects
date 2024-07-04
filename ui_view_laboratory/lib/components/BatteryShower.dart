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
  return CircularPercentIndicator(
    radius: 60.0,
    lineWidth: 5.0,
    percent: 0.5,
    center: Text("100%"),
    progressColor: Colors.green,
  );
}
