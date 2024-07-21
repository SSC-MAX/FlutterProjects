/*
 * @Descripttion: 
 * @version: 
 * @Author: sc
 * @Date: 2024-07-02 15:27:45
 */

import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sx_connector/Components/TestPage1.dart';
import 'package:sx_connector/Components/TestPage2.dart';
import 'package:sx_connector/Components/TestPage3.dart';
import 'package:sx_connector/Data/PageController.dart';
import 'package:sx_connector/Data/SocketController.dart';
import 'package:sx_connector/Data/StatusController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:sx_connector/utils/CommonUtils.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  Get.put(StatusController());
  Get.put(SocketController());
  runApp(MainApp());
}

final channel = WebSocketChannel.connect(buildSocketUrl(defaultTargetPlatform));

class MainApp extends StatelessWidget {
  MainApp({super.key}) {
    logger.i("检查平台===>${defaultTargetPlatform.name}");
  }

  ComponentsController componentsController =  Get.put(ComponentsController());
  final componentsList =
      [const TestPage2(), TestPage1(), const TestPage3()].obs;
  List<BottomNavigationBarItem> bottomNavigationBarItem = [
    const BottomNavigationBarItem(icon: Icon(Icons.access_alarms), label: "Page1"),
    const BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Page2"),
    const BottomNavigationBarItem(icon: Icon(Icons.account_box_sharp), label: "Page3"),
  ];

  @override
  Widget build(BuildContext context) {
    return StyledToast(
      locale: const Locale('en', 'US'),
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: Center(
              child: Obx(() => IndexedStack(
                index: componentsController.currentIndex.value,
                children: componentsList,
              )),
            ),
          ),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: componentsController.currentIndex.value,
            onTap: componentsController.selectPage,
            // type: BottomNavigationBarType.fixed,
            items: bottomNavigationBarItem)),
        ),
      ),
    );
  }
}