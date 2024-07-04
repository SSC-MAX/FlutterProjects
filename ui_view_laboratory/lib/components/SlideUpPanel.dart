/*
 * @Descripttion: 
 * @version: 
 * @Author: sc
 * @Date: 2024-07-04 20:06:40
 */
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

@override
Widget buildSlideUpPanel(BuildContext context) {
  return Scaffold(
    // appBar: AppBar(
    //   title: const Text("SlidingUpPanelExample"),
    // ),
    body: SlidingUpPanel(
      minHeight: 60.0,
      maxHeight: 200.0,
      renderPanelSheet: false,
      slideDirection: SlideDirection.DOWN,
      defaultPanelState: PanelState.OPEN,
      panel: _floatingPanel(), // 面板内容
      collapsed: _floatingCollapsed(),
      body: const Center(
        child: Text("页面内容"),
      ),
    ),
  );
}

// 面板折叠内容
Widget _floatingCollapsed() {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.0),
          bottomRight: Radius.circular(24.0)),
    ),
    margin: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0.0),
    child: const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "下拉打开面板",
            style: TextStyle(color: Colors.white),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}

// 面板内容
Widget _floatingPanel() {
  return Container(
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Colors.grey,
          ),
        ]),
    margin: const EdgeInsets.all(25.0),
    child: Column(
      children: [
        Expanded(
          child: Center(
            child: Row(
              children: [
                CustomPaint(
                  painter: BatteryPainter(80),
                ),
                // const Text("面板内容"),
              ],
            )),),
        const Align(
          alignment: AlignmentDirectional.bottomCenter,
            child: Icon(Icons.keyboard_arrow_up, color: Colors.black87),
          ),
      ],
    ),
  );
}

class BatteryPainter extends CustomPainter {
  final double batteryLevel;

  BatteryPainter(this.batteryLevel);

  @override
  void paint(Canvas canvas, Size size) {
    // 绘制背景圆
    Paint backgroundPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12.0;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = size.width / 2 - backgroundPaint.strokeWidth / 2;

    canvas.drawCircle(Offset(centerX, centerY), radius, backgroundPaint);

    // 计算电量对应的角度
    double sweepAngle = batteryLevel / 100 * 360;

    // 绘制电量圆弧
    Paint arcPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12.0
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      _degreesToRadians(-90), // 从正上方开始绘制
      _degreesToRadians(sweepAngle), // 绘制的角度
      false,
      arcPaint,
    );
  }

  double _degreesToRadians(double degrees) {
    return degrees * math.pi / 180.0;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}