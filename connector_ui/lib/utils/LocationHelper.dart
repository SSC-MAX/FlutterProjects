import 'package:geolocator/geolocator.dart';
import 'CommonUtils.dart';

// final locationController = GetBuilder<LocationController>();

Future<Position> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // 检查GPS是否开启
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // GPS未开启的处理逻辑，例如提示用户开启
    return Future.error('Location services are disabled');
  }

  // 请求定位权限
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // 权限被拒绝的处理逻辑，例如提示用户授权
      return Future.error('Location permissions are denied');
    }
  }

  // 当前位置
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best, timeLimit: Duration(seconds: 30));
  return position;
}

// 在需要的地方调用getCurrentLocation函数
void getLocation() async {
  try {
    Position position = await getCurrentLocation();
    logger.i('位置变化===> Latitude: ${position.latitude}, Longitude: ${position.longitude}');
  } catch (e) {
    logger.e('Error: $e');
  }
}
