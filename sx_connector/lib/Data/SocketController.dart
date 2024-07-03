import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sx_connector/Network/common/R.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../utils/CommonUtils.dart';

class SocketController extends GetxController{
  late WebSocketChannel? channel;

  @override
  void onInit() {
    super.onInit();
    channel = WebSocketChannel.connect(buildSocketUrl(defaultTargetPlatform));
  }

  @override
  void onReady() {
    super.onReady();
    // 注册socket
    if(channel!=null){
      channel?.stream.listen((message) {
        // 处理接收到的消息
        logger.i("[WEBSOCKET] 接收到返回消息:\n$message");
      }, onError: (error) {
        // 处理错误
      }, onDone: () {
        // 连接关闭时的处理
        logger.i("Websocket关闭");
      });
    }else{
      logger.e("[WEBSOCKET] Websocket未连接，无法注册");
    }
    
  }

  @override
  void onClose() {
    super.onClose();
    if(channel!=null){
      channel?.sink.close();
    }
  }

  WebSocketChannel? getWSChannel(){
    if(channel!=null){
      return channel;
    }else{
      logger.e("无法获取Websocket，因为Websocket未连接");
      return null;
    }
    
  }

  void setWSChannel(WebSocketChannel channel){
    this.channel = channel;
  }

  // 连接Websocket
  WebSocketChannel? connectWebsocket(){
    try{
      WebSocketChannel channel = WebSocketChannel.connect(buildSocketUrl(defaultTargetPlatform));
      setWSChannel(channel);
      channel.stream.listen((message) {
        // 处理接收到的消息
        logger.i("[WEBSOCKET] 接收到返回消息:\n$message");
      }, onError: (error) {
        // 处理错误
      }, onDone: () {
        // 连接关闭时的处理
        logger.i("Websocket关闭");
      });
      return channel;
    }catch(e){
      logger.e("[WEBSOCKET] 网络错误，Websocket连接失败");
      return null;
    }
    
  }

  // 关闭Websocket
  void closeConnect(WebSocketChannel? channel){
    if(channel!=null){
      channel.sink.close();
    }else{
      logger.e("无法关闭WebSocket,因为WebSocket未连接");
    }
    
  }

  // 发送SOCKET消息
  void sendMessage(WebSocketChannel? channel, dynamic message, int code){
    R request = R(code: code, data: message, msg: "[WEBSOCKET]");
    if(channel!=null){
      try{
        channel.sink.add(jsonEncode(request.toJson()));
        logger.i("发送SOCKET信息成功");
      }catch(e){
        logger.e("发送SOCKET消息失败${e.toString()}");
      }
    }else{
      logger.e("SOCKET未连接，无法发送消息");
    }
    
  }



}