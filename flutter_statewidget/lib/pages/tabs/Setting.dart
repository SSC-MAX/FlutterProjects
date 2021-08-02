import 'package:flutter/material.dart';
import '/Routes.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('设置的标题')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                print('理应跳转');
                Navigator.pushNamed(
                  context, 
                  '/login');
              },
              child: Text('跳转到登录页面'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context, 
                  '/registerFirst'
                );
              },
              child: Text('跳转到注册页面'),
            ),
            
          ],
        ),
      ),
    );
  }
}
