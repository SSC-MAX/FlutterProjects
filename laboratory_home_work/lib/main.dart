import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Container包裹用于设置背景图片
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //登录按钮
              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    '登录',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //注册按钮
              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    '注册',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                      backgroundColor: MaterialStateProperty.all(Colors.yellow)),
                ),
              ),
            ],
          ),
        ),
      )

    );
  }
}
