import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter的列表'),
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  //自定义一个方法来创建列表
  List<Widget> _getData() {
    List<Widget> list = [];
    for (var i = 0; i < 20; i++) {
      String count = (i + 1).toString();
      list.add(ListTile(
        leading: Icon(
          Icons.access_alarm,
          color: Colors.yellow,
        ), //此处使用Image
        title: Text('我是列表第$count项'),
        subtitle: Text('我是列表第$count的子标题'),
      ));
    }
    return list;
  }

  
  

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getData(),
    );
  }
}
