import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sx_connector/Components/Location/LocationHelper.dart';
import 'package:sx_connector/Data/SocketController.dart';
import 'package:sx_connector/Data/StatusController.dart';
import 'package:sx_connector/Network/Location/LocationNetworkTest.dart';
import 'package:sx_connector/Network/common/NetworkHelp.dart';
import 'package:sx_connector/Network/common/R.dart';
import 'package:sx_connector/utils/CommonUtils.dart';
import 'package:sx_connector/utils/WidgetBuilders.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class TestPage1 extends StatelessWidget {
  const TestPage1({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Hello World"),
          const SizedBox(
            height: 25,
          ),
          const ElevatedButton(
              onPressed: getLocation, child: Text("获取位置")),
          const SizedBox(
            height: 25,
          ),
          // BatteryPage()
          // BatteryWindow(),
          // const Network(),
          LocationNetworkTest(),
          const SizedBox(
            height: 25,
          ),
          // BatteryPage(),
          ElevatedButton(
              onPressed: () {
                Toast("显示Toast");
              },
              child: const Text("显示Toast")),
          ElevatedButton(
              onPressed: () {
                StatusController controller = Get.find();
                logger
                    .i('检查StatusController数据:\n${controller.toString()}');
              },
              child: const Text('检查StatusController')),
          ElevatedButton(
              onPressed: () {
                statusUpdatePost(defaultTargetPlatform, "测试");
              },
              child: const Text("发送状态")),
          ElevatedButton(
              onPressed: () {
                SocketController socketController = Get.find();
                WebSocketChannel channel =
                socketController.getWSChannel();
                R request = R(
                    code: 101,
                    data: "连接测试",
                    msg: "来自:$defaultTargetPlatform");
                channel.sink.add(jsonEncode(request.toJson()));
                logger.d("发送Socket消息");
                // channel.sink.add("Flutter发来消息");
                // socketUpdate(defaultTargetPlatform, "Socket");
              },
              child: const Text("发送Socket消息")),
          ElevatedButton(
              onPressed: () {
                SocketController socketController = Get.find();
                socketController
                    .closeConnect(socketController.getWSChannel());
              },
              child: const Text("关闭WebSocket")),
          ElevatedButton(
              onPressed: () {
                SocketController socketController = Get.find();
                socketController.connectWebsocket();
              },
              child: const Text("连接WebSocket")),
        ],
      ),
    );
  }
}
