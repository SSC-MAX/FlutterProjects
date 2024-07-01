import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/enums/charging_status.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:battery_info/model/iso_battery_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sx_connector/Components/Battery/BatteryController.dart';
import 'package:sx_connector/Data/StatusController.dart';
import 'package:sx_connector/Themes/MyTextTheme.dart';

import '../../utils/CommonUtils.dart';
StatusController statusController = Get.find();

Widget AndroidBatteryWindow() {
  return Column(
    children: [
      Text("Android平台", style: titleTextStyle()),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<AndroidBatteryInfo?>(
                stream: BatteryInfoPlugin().androidBatteryInfoStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // 检测到电池状态发生变化时，更新电池状态
                    // StatusData.updateAndroidBatteryData(snapshot.data);
                    statusController.updateAndroidBatteryData(snapshot.data);
                    return Column(
                      children: [
                        Text(
                            "状态: ${(snapshot.data!.chargingStatus.toString().split(".")[1])}"),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("电量: ${(snapshot.data!.batteryLevel)} %"),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  }
                  return const CircularProgressIndicator();
                })
      // GetX<AndroidBatteryController>(builder: (controller) {
      //   return Column(
      //     children: [
            
      //     ],
      //   );
      // }),
    ],
  );
}

Widget IOSBatteryWindow() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("IOS平台", style: titleTextStyle()),
      StreamBuilder<IosBatteryInfo?>(
          stream: BatteryInfoPlugin().iosBatteryInfoStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // 电池状态发生变化时更新电池状态
              // StatusData.updateIOSBatteryData(snapshot.data);
              statusController.updateIOSBatteryData(snapshot.data);
              return Column(
                children: [
                  Text(
                      "状态: ${(snapshot.data!.chargingStatus.toString().split(".")[1])}"),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("电量: ${(snapshot.data!.batteryLevel)} %"),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            }
            return const CircularProgressIndicator();
          })
    ],
  );
}

Widget _getChargeTime(AndroidBatteryInfo data) {
  if (data.chargingStatus == ChargingStatus.Charging) {
    return data.chargeTimeRemaining == -1
        ? const Text("Calculating charge time remaining")
        : Text(
            "Charge time remaining: ${(data.chargeTimeRemaining! / 1000 / 60).truncate()} minutes");
  }
  return const Text("Battery is full or not connected to a power source");
}
