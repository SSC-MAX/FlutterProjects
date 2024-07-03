import 'package:connector_ui/controller/StatusController.dart';
import 'package:connector_ui/themes/MyTextTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page2 extends StatelessWidget {
  Page2({super.key});

  StatusController statusController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(()=>Text("电量 : ${statusController.batteryLevel!.value}", style: titleStyle(),)),
          Obx(()=>Text("状态 : ${statusController.batteryStatus!.value}", style: titleStyle(),)),
          Obx(()=>Text("Longitude : ${statusController.longitude!.value}", style: titleStyle(),)),
          Obx(()=>Text("latitude : ${statusController.latitude!.value}", style: titleStyle(),)),
        ],
      ),
    );
  }
}
