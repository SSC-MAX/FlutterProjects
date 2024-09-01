/*
 * @Descripttion: 
 * @version: 
 * @Author: sc
 * @Date: 2024-07-09 16:58:25
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart'
    show BMFMapSDK, BMF_COORD_TYPE;
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  runApp(MainApp());

  requestPermission();
  LocationFlutterPlugin myLocPlugin = LocationFlutterPlugin();
  BMFMapSDK.setAgreePrivacy(true);
  myLocPlugin.setAgreePrivacy(true);

  // 百度地图sdk初始化鉴权
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    myLocPlugin.authAK('请输入您的ak');
    BMFMapSDK.setApiKeyAndCoordType('请输入您的ak', BMF_COORD_TYPE.BD09LL);
  } else if (defaultTargetPlatform == TargetPlatform.android) {
    /// 初始化获取Android 系统版本号，如果低于10使用TextureMapView 等于大于10使用Mapview
    await BMFAndroidVersion.initAndroidVersion();
    // Android 目前不支持接口设置Apikey,
    // 请在主工程的Manifest文件里设置，详细配置方法请参考官网(https://lbsyun.baidu.com/)demo
    BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
  } else {
    print("未知平台");
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

// 动态申请定位权限
void requestPermission() async {
  // 申请权限
  bool hasLocationPermission = await requestLocationPermission();
  if (hasLocationPermission) {
    // 权限申请通过
  } else {}
}

/// 申请定位权限
/// 授予定位权限返回true， 否则返回false
Future<bool> requestLocationPermission() async {
  //获取当前的权限
  var status = await Permission.location.status;
  if (status == PermissionStatus.granted) {
    //已经授权
    return true;
  } else {
    //未授权则发起一次申请
    status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }
}
