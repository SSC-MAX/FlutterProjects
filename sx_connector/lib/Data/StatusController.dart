import 'dart:async';

import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:battery_info/model/iso_battery_info.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sx_connector/Components/Location/LocationHelper.dart';
import 'package:sx_connector/Network/common/NetworkHelp.dart';
import 'package:sx_connector/utils/CommonUtils.dart';
import '../Network/pojo/StatusR.dart';

class StatusController extends GetxController{
  RxInt? batteryLevel = 0.obs;
  RxString? batteryStatus = ''.obs;
  RxDouble? longitude = 1.0.obs;
  RxDouble? latitude = 1.0.obs;
  RxString? author = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // 初始化状态
    if(defaultTargetPlatform==TargetPlatform.android){
      androidInit();
      // 设置Android电池监听器
      BatteryInfoPlugin().androidBatteryInfoStream.listen((AndroidBatteryInfo? androidBatteryInfo) {
        updateAndroidBatteryData(androidBatteryInfo);
      });
    }else{
      IOSInit();
      // 设置IOS电池监听器
      // BatteryInfoPlugin().iosBatteryInfoStream.listen((IosBatteryInfo? iosBatteryInfo) {
      //   updateIOSBatteryData(iosBatteryInfo);
      // });
    }
    // 注册位置变化的监听器
    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(locationSettings: const LocationSettings(distanceFilter: 100)).listen(
            (Position? position) {
          logger.i("检测到位置变化\n${position == null ? '位置不可知' : 'longitude : ${position.longitude.toString()}, latitude : ${position.latitude.toString()}'}");
          updateLocationData(position!.longitude, position.latitude, defaultTargetPlatform);
        });
  }

  // android系统app启动时更新状态
  void androidInit() async {
    batteryLevel?.value =  (await BatteryInfoPlugin().androidBatteryInfo)!.batteryLevel!;
    batteryStatus?.value = (await BatteryInfoPlugin().androidBatteryInfo)!.chargingStatus.toString();
    Position position = await getCurrentLocation();
    longitude?.value = position.longitude;
    latitude?.value = position.latitude;
    author?.value = 'Android';
    logger.i("Android Status初始化完成\n${toString()}");
  }

  // ios系统app启动时更新状态
  void IOSInit() async {
    // batteryLevel?.value = (await BatteryInfoPlugin().iosBatteryInfo)!.batteryLevel!;
    // batteryStatus?.value = (await BatteryInfoPlugin().iosBatteryInfo)!.chargingStatus.toString();
    batteryLevel?.value = 99;
    batteryStatus?.value="Charging";
    author?.value = 'IOS';
    Position position = await getCurrentLocation();
    longitude?.value = position.longitude;
    latitude?.value = position.latitude;
    // longitude?.value = 117.3;
    // latitude?.value = 66.8;
    logger.i("IOS Status初始化完成\n${toString()}");
  }

  // 更新地理位置
  void updateLocationData(double newLongitude, double newLatitude, TargetPlatform platform){
    longitude?.value = newLongitude;
    latitude?.value = newLatitude;
    try{
      // statusUpdatePost(platform, "位置");
      statusUpdateSocket(platform, "位置");
      // channel.sink.add();
    }catch(e){
      logger.e(e);
    }
  }

  // Android更新电池信息
  updateAndroidBatteryData(AndroidBatteryInfo? batteryInfo){
    batteryLevel?.value = batteryInfo!.batteryLevel!;
    batteryStatus?.value = batteryInfo!.chargingStatus.toString();
    logger.d("Android电池修改后===>$batteryLevel,$batteryStatus");
    // statusUpdatePost(TargetPlatform.android, "电池");
    statusUpdateSocket(TargetPlatform.android, "电池");
  }

  // IOS更新电池信息
  updateIOSBatteryData(IosBatteryInfo? batteryInfo){
    batteryLevel?.value = batteryInfo!.batteryLevel!;
    batteryStatus?.value = batteryInfo!.chargingStatus.toString();
    logger.d("IOS电池修改后===>$batteryLevel,$batteryStatus");
    // statusUpdatePost(TargetPlatform.android, "电池");
    statusUpdateSocket(TargetPlatform.iOS, "电池");
  }

  // 构建StatusR以便发送网络请求
  StatusR buildStatusR(String msg){
    return StatusR(
        code: 100,
        batteryLevel: batteryLevel!.value,
        batteryStatus: batteryStatus!.value,
        longitude: longitude!.value,
        latitude: latitude!.value,
        author: author!.value,
        msg:"$author状态已更新 : $msg");
  }

  @override
  String toString() {
    return 'batteryLevel : ${batteryLevel?.value}\nbatteryStatus : ${batteryStatus?.value}\nlongitude : ${longitude?.value}\nlatitude : ${latitude?.value}\nauthor : ${author?.value}';
  }

}