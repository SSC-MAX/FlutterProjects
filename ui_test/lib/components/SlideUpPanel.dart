/*
 * @Descripttion: 
 * @version: 
 * @Author: sc
 * @Date: 2024-07-04 20:06:40
 */
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:ui_test/components/BatteryShower.dart';
import 'package:ui_test/controller/StatusController.dart';

// 面板折叠内容
Widget floatingCollapsed() {
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
Widget floatingPanel(StatusController statusController) {
  late Color batteryColor;
  if(statusController.batteryLevel!.value>40){
    batteryColor = Colors.green;
  }else if(statusController.batteryLevel!.value<20){
    batteryColor = Colors.red;
  }else{
    batteryColor = Colors.orange;
  }
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
    child: Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(left: 20)),
                // 电量显示
                buildBatteryShower(statusController.batteryLevel!.value),
                const Padding(padding: EdgeInsets.only(left: 25)),
                // 文本
                Expanded(
                    child: Container(
                      // color: Colors.greenAccent,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Positioned(
                            left: 0,
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(statusController.batteryStatus!.value, style: TextStyle(fontSize: 25, color: batteryColor),),
                                  Padding(padding: EdgeInsets.only(left: 5)),
                                  if(statusController.batteryStatus!.value=='正在充电')
                                  Icon(Icons.flash_on, color: Colors.green,)
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 8, bottom: 8)),
                              Text("安徽省 合肥市 蜀山区"),
                              Padding(padding: EdgeInsets.only(top: 2)),
                              Text("上次更新:2024 7.5 13:54",style: TextStyle(fontSize: 10),)
                            ],
                          ),),
                          Positioned(
                            right: 20,
                              child: Icon(Icons.refresh))
                        ],
                      )
                    )
                )
              ],
            ),
          )
         ),
        Expanded(
          flex: 1,
          child: Center(
            child: const Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Icon(Icons.keyboard_arrow_up, color: Colors.black87),
            ),
          ),)
      ],
    ),
  );
}
