import 'dart:async';
import 'dart:math';

import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:connector_ui/utils/CommonUtils.dart';
import 'package:connector_ui/utils/LocationHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class StatusController extends GetxController{
  RxInt? batteryLevel = 0.obs;
  RxString? batteryStatus = ''.obs;
  RxDouble? longitude = 1.0.obs;
  RxDouble? latitude = 1.0.obs;
  RxString? author = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    batteryLevel?.value =  100;
    batteryStatus?.value = "正在充电";
    longitude?.value = 113.3;
    latitude?.value = 71.23;
    author?.value = 'Android';
    logger.i("Android Status初始化完成\n${toString()}");
  }

  void setBatteryLevel(){
    batteryLevel?.value = Random().nextInt(100);
  }

  // 更新地理位置
  void updateLocationData(){
    longitude?.value = Random().nextDouble()+100;
    latitude?.value = Random().nextDouble();
  }

  @override
  String toString() {
    return 'batteryLevel : ${batteryLevel?.value}\nbatteryStatus : ${batteryStatus?.value}\nlongitude : ${longitude?.value}\nlatitude : ${latitude?.value}\nauthor : ${author?.value}';
  }

}