import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_statewidget/pages/ProductInfo.dart';
import '../Search.dart';

class HomePage extends StatefulWidget {
  HomePage() {
    print('构建了HomePage');
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;


  @override
  void initState() {
    super.initState();

    Map userInfo = {
      "username":"张三",
      "age":20
    };

    print(jsonEncode(userInfo));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('${this.count}'),
          RaisedButton(
              child: Text('点击递增'),
              onPressed: () {
                setState(() {
                  count++;
                });
              }),
          RaisedButton(
              child: Text('归零'),
              onPressed: () {
                setState(() {
                  count = 0;
                });
              }),
          RaisedButton(
            child: Text('跳转到搜索页面'),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
              //路由跳转
              //  Navigator.of(context).push(
              //    MaterialPageRoute(
              //      builder: (context)=>SearchPage())
              //  );
              Navigator.pushNamed(context, '/search',
                  arguments: SearchPageData('主体内容'));
            },
          ),
          SizedBox(height: 20),
          RaisedButton(
            child: Text('跳转到表单页面并传值'),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () {},
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/product');
            },
            child: Text('点击进入商品页面'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/appBarDemo');
            },
            child: Text('点击进入自定义标题栏'),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tabBarController');
              },
              child: Text('点击跳转到TabBarControllerPage')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/buttonDemoPage');
              },
              child: Text('点击跳转到按钮研究')),
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/textFieldDemo');
              },
              child: Text('点击跳转到表单演示页面')),
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/formDemo');
              },
              child: Text('点击跳转到表单')),
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/datePickerDemo');
              },
              child: Text('点击跳转到时间')),
        ],
      ),
    );
  }
}
