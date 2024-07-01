import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() async {
  final wsUrl = Uri.parse('ws://localhost:8080/websocket/flutter1234');
  final channel = WebSocketChannel.connect(wsUrl);

  channel.stream.listen((message) {
    // 处理接收到的消息
    print("接收到了返回的消息");
  }, onError: (error) {
    // 处理错误
  }, onDone: () {
    // 连接关闭时的处理
  });

  channel.sink.add(jsonEncode("123"));
}