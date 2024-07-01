import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sx_connector/Network/Location/Location.dart';
import 'package:sx_connector/Network/Location/LocationResponse.dart';
import 'package:sx_connector/Network/common/NetworkHelp.dart';
import 'package:sx_connector/utils/WidgetBuilders.dart';

class LocationNetworkTest extends StatelessWidget {
  const LocationNetworkTest({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: fetchLocation, child: const Text('请求地址'));
  }

  Future<LocationResponse> fetchLocation() async {
    try {
      var baseUrl = defaultTargetPlatform == TargetPlatform.android
          ? "http://10.0.2.2:8080"
          : "http://localhost:8080";
      var url = buildUrl(baseUrl, "/getLocation");
      var locationData =
          Location(longitude: 117.30701352582095, latitude: 31.878324201376092);
      Response response = await Dio().post(url, data: locationData.toJson());
      Toast("请求成功");
      var responseObject = LocationResponse.fromJSON(response.data);
      print(responseObject.data.toString());
      return responseObject;
    } catch (e) {
      // Handle exception
      Toast("请求失败");
      rethrow;
    }
  }
}
