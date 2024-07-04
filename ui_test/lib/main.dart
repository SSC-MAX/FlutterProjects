import 'package:ui_test/controller/StatusController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_test/pages/Page1.dart';
import 'package:ui_test/pages/Page2.dart';
import 'package:ui_test/pages/Page3.dart';

import 'controller/PageController.dart';

void main() {
  Get.put(StatusController());
  Get.put(ComponentsController());
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  ComponentsController componentsController = Get.find();
  final componentsList =
      [ Page1(), Page2(),Page3()].obs;
  List<BottomNavigationBarItem> bottomNavigationBarItem = [
    const BottomNavigationBarItem(icon: Icon(Icons.access_alarms), label: "Page1"),
    const BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Page2"),
    const BottomNavigationBarItem(icon: Icon(Icons.account_box_sharp), label: "Page3"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("标题", style: TextStyle(color: Colors.white),), backgroundColor: Colors.blue,),
        body: Center(
          child: Obx(()=>IndexedStack(
            index: componentsController.currentIndex.value,
            children: componentsList,
          )),
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: componentsController.currentIndex.value,
            onTap: componentsController.selectPage,
            // type: BottomNavigationBarType.fixed,
            items: bottomNavigationBarItem)),
      ),
    );
  }
}
