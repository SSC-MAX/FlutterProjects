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
import 'package:ui_view_laboratory/components/BatteryShower.dart';

@override
Widget buildSlideUpPanel(BuildContext context) {
  return SlidingUpPanel(
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
              buildBatteryShower(100),
              const Text("面板内容"),
            ],
          )),
        ),
        const Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Icon(Icons.keyboard_arrow_up, color: Colors.black87),
        ),
      ],
    ),
  );
}
