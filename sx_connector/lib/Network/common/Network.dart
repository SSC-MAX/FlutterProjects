import 'package:flutter/foundation.dart';
import 'package:sx_connector/Network/common/R.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sx_connector/Network/Location/Location.dart';
import 'package:sx_connector/Network/common/NetworkHelp.dart';

class Network extends StatelessWidget {
  const Network({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: fetchHello, child: const Text("发送网络请求"));
  }

  // 网络测试
  Future<R> fetchHello() async {
    try {
      var baseUrl = defaultTargetPlatform == TargetPlatform.android
          ? "http://10.0.2.2:8080"
          : "http://localhost:8080";
      var url = buildUrl(baseUrl, "/hello");
      var locationData = Location(longitude: 117.30701352582095, latitude: 31.878324201376092);
      Response response = await Dio().post(url,data: locationData);
      var responseObject = R.fromJson(response.data);
      print(responseObject.toString());
      return R.fromJson(response.data);
    } catch (e) {
      // Handle exception
      rethrow;
    }
  }



}
