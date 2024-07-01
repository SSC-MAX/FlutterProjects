import 'package:get/get.dart';

class AndroidBatteryController extends GetxController {
  var health = ''.obs;
  var chargingStatus = ''.obs;
  var batteryLevel = 0.obs;
}

class IOSBatteryController extends GetxController {
  var chargingStatus = ''.obs;
  var batteryLevel = 0.obs;
}
