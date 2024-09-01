import 'dart:async';
import 'dart:io';
 
import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:amap_flutter_location/amap_location_option.dart';
import 'package:map_test_2/amapDemo.dart';
import 'package:flutter/material.dart';
 
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:permission_handler/permission_handler.dart';
 
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _ShowMapPageBody(),
    );
  }
}
 
 
 
 
class _ShowMapPageBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShowMapPageState();
}
 
class _ShowMapPageState extends State<_ShowMapPageBody> with AMapLocationStateMixin {
 
  @override
  String get iosKey => '0ad82a226e22c1eab62fa3e916e2dc4b';  // iosKey未获取
 
  @override
  String get androidKey => '0ad82a226e22c1eab62fa3e916e2dc4b';
 
  String? get mapContentApprovalNumber => AMapApprovalNumber.mapContentApprovalNumber;
  String? get satelliteImageApprovalNumber => AMapApprovalNumber.satelliteImageApprovalNumber;
 
  @override
  void initState() {
    super.initState();
    startLocation();
  }
 
  AMapController? aMapController;
 
  @override
  Widget build(BuildContext context) {
    final AMapPage map = AMapPage(iosKey, androidKey, onMapCreated: (AMapController controller) {
      aMapController = controller;
    },);
 
    List<Widget> approvalNumberWidget = [
      if (null != mapContentApprovalNumber) Text(mapContentApprovalNumber!),
      if (null != satelliteImageApprovalNumber) Text(satelliteImageApprovalNumber!),
    ];
 
    return Scaffold(
      appBar: AppBar(
        title: const Text("高德地图"),
        actions: [
          TextButton(onPressed: () {
            LatLng latlng = LatLng(locationInfo.latitude ?? 39.909187, locationInfo.longitude ?? 116.397451);
            CameraUpdate cameraUpdate = CameraUpdate.newLatLng(latlng);
            aMapController?.moveCamera(cameraUpdate);
          }, child: const Icon(Icons.location_on_rounded, color: Colors.red,))
        ],
      ),
      body: map,
      drawer: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.8,
        child: SafeArea(
          child: Column(children: [
            createButtonContainer(),
            Expanded(child: resultList()),
            ...approvalNumberWidget,
          ],),
        ),
      ),
    );
 
  }
 
 // 定位按钮
  Widget createButtonContainer() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: startLocation,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: const Text('开始定位'),
        ),
        Container(width: 20.0),
        ElevatedButton(
          onPressed: stopLocation,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: const Text('停止定位'),
        )
      ],
    );
  }
 
  Widget resultList() {
    List<Widget> widgets = <Widget>[];
 
    locationResult.forEach((key, value) {
      widgets.add(Text('$key: $value', softWrap: true, style: const TextStyle(color: Colors.lightGreenAccent),),);
    });
 
    return ListView(padding: const EdgeInsets.all(8),children: widgets,);
  }
 
}