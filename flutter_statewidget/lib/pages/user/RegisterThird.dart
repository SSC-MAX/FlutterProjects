import 'package:flutter/material.dart';
import '/pages/Tabs.dart';
import '/pages/tabs/Setting.dart';

class RegisterThirdPage extends StatelessWidget {
  const RegisterThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('注册——第三步')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    //由于之前使用的一直是替换路由，所以这里可以以替换路由的形式通过直接pop来返回到根界面
                    // Navigator.pop(context);
                    //回到指定路由并清空之前的所有
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                        builder: (context) => MyScaffold(originalIndex: 2,)),
                        (route) => route == null
                      );
                  },
                  child: Text('点击回到主界面'))
            ],
          ),
        ));
  }
}