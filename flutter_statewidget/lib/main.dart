import 'package:flutter/material.dart';
import 'pages/Tabs.dart';
import 'Routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //消除DEBUG的图标
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyScaffold(),
      // routes: {
      //   '/form':(context)=>FormPage(),
      //   '/search':(context)=>SearchPage(),
      // },
      routes: mRoutes,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[],
    );
  }
}

class HomePageX extends StatefulWidget {
  HomePageX({Key? key}) : super(key: key);

  @override
  _HomePageXState createState() => _HomePageXState();
}

class _HomePageXState extends State<HomePageX> {
  int countNum = 0;
  @override
  Widget build(BuildContext context) {
    print('build方法被执行');
    return Column(
      children: <Widget>[
        SizedBox(
          height: 200,
        ),
        Chip(label: Text('${this.countNum}')),
        RaisedButton(
            child: Text('按钮'),
            onPressed: () {
              setState(() {
                this.countNum++;
              });
            }),
        RaisedButton(
            child: Text('清零'),
            onPressed: () {
              setState(() {
                this.countNum = 0;
              });
            })
      ],
    );
  }
}
