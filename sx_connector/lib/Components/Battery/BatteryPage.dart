import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:sx_connector/Components/Battery/BatteryWindows.dart';
import 'package:sx_connector/Themes/MyTextTheme.dart';

class BatteryPage extends StatelessWidget {
  BatteryPage({super.key});
  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      logger.d("电池===>发现Android平台");
      // Future<AndroidBatteryInfo?> androidBatteryInfo = BatteryInfoPlugin().androidBatteryInfo;
      return AndroidBatteryWindow();
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return IOSBatteryWindow();
    }
    return Center(
      child: Column(
        children: [
          Text("设备平台未知", style: warmTextStyle()),
          ElevatedButton(
              onPressed: () {
                print("defaultTargetPlatform===>$defaultTargetPlatform");
                var flagIOS = defaultTargetPlatform == TargetPlatform.iOS;
                var flagAndroid =
                    defaultTargetPlatform == TargetPlatform.android;
                print("比较IOS===>$flagIOS");
                print("比较Android===>$flagAndroid");
              },
              child: const Text("显示平台"))
        ],
      ),
    );
  }
}
