import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sx_connector/Data/SocketController.dart';
import 'package:sx_connector/Data/StatusController.dart';
import 'package:sx_connector/utils/CommonUtils.dart';
import '../pojo/StatusR.dart';

String buildUrl(String baseUrl, String param) {
  return baseUrl + param;
}

String getBaseUrl(TargetPlatform platform){
  return platform == TargetPlatform.android ? 'http://10.0.2.2:8080' : 'http://localhost:8080';
}

// 状态发生变化时向服务器发送请求
void statusUpdatePost(TargetPlatform platform, String msg) async{
  StatusController statusController = Get.find();
  try{
    var url = buildUrl(getBaseUrl(platform), '/statusUpdate');
    var response = await Dio().post(url, data: (statusController.buildStatusR(msg)).toJson());
    var data = StatusR.fromJson(response.data['data']);
    logger.i('响应信息 : \n${data.toString()}');
  }catch(e){
    logger.e(e);
  }
}

// 更新Status
void statusUpdateSocket(TargetPlatform platform, String msg) async{
  StatusController statusController = Get.find();
  SocketController socketController = Get.find();
  logger.i("Websocket准备更新状态===>$statusController");
  try{
    var channel = socketController.getWSChannel();
    socketController.sendMessage(channel, statusController.buildStatusR(msg), 100);
  }catch(e){
    logger.e(e);
  }
}

void socketUpdate(TargetPlatform platform, String msg) {
  SocketController socketController = Get.find();
  StatusController statusController = Get.find();
  try{
    var channel = socketController.getWSChannel();
    channel.sink.add(jsonEncode(statusController.buildStatusR(msg).toJson()));
    logger.i("socket发送成功");
  }catch(e){
    logger.e(e);
  }
}
