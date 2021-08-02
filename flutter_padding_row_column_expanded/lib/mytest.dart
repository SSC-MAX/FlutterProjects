import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('测试')),
        body: TestDemo(),
      ),
    );
  }
}

class IconContainerTest extends StatelessWidget {
  double height =10;
  double iconSize = 15.0;
  IconData? icon;
  Color? color;
  IconContainerTest( double height, double iconSize,IconData icon, Color color,){
    this.height = height;
    this.iconSize = iconSize;
    this.icon = icon;
    this.color = color;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height:height,
      color: color,
      child:Center(
        child:Icon(
          icon,
          size: iconSize,
          color: Colors.white,)
      ),
    );
  }
}

class TestDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Row(
     children: <Widget>[
       Expanded(
         flex: 2,
         child:IconContainerTest(180, 20, Icons.home, Colors.blue) ),
        Expanded(
          flex: 1,
          //竖着的两项再用Container包裹一层
          child: Container(
            height: 180,
            child: Column(
            children: [
              Expanded(
                flex: 1,
                child: IconContainerTest(100,20,Icons.search, Colors.orange),
              ),
              Expanded(
                flex: 1,
                child: IconContainerTest(100, 20, Icons.window, Colors.red))
            ],
          ),
          )
        )
     ],
   );
  }
}