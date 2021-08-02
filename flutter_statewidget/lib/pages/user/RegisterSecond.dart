import 'package:flutter/material.dart';

class RegisterSecondPage extends StatelessWidget {
  const RegisterSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('第二步——注册')), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('注册的第二步'),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              child: Text('返回上一步')
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushReplacementNamed('/registerThird');
              }, 
              child: Text('下一步')
            ),
          ],
        ),
      ));
  }
}
