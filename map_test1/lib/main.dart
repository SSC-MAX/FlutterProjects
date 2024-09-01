/*
 * @Descripttion: 
 * @version: 
 * @Author: sc
 * @Date: 2024-08-31 17:31:40
 */
import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'MapShow.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

//   Future<bool> setAgreePrivacy(bool isAgree) async {
// return BMFLocationDispatcherFactory.instance.authDispatcher.setAgreePrivacy(_channel, isAgree);
// }

  MainApp({super.key});

  BMFMapOptions mapOptions = BMFMapOptions(
        center: BMFCoordinate(39.917215, 116.380341),
        zoomLevel: 12,
        mapPadding: BMFEdgeInsets(left: 30, top: 0, right: 30, bottom: 0));

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
            child: WeatherMapPage()
        ),
      ),
    );
  }
}
