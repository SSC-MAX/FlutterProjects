import 'package:flutter/material.dart';

class RegisterFirstPage extends StatelessWidget {
  const RegisterFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('手机快速注册——第一步')), 
      body: Center(
        child: Column(
        children: <Widget>[
          Container(
            width: 300,
            height:100,
            color: Colors.blue
          ),
          SizedBox(height:50),
          ElevatedButton(
            onPressed: (){
              //加载registerSecond页面并用其替换当前页面
              Navigator.of(context).pushReplacementNamed('/registerSecond');
            }, 
            child: Text('下一步'),
            ),
            Text('遇到问题？您可以联系客服')
        ],
      ),
      )
      );
  }
}
