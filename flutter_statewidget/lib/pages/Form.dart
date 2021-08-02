import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
   String title;
 
  FormPage({this.title="未传值标题"});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title:Text(this.title),
        ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('这里是表单页面'),
            FloatingActionButton(
              child: Text('返回'),
              onPressed: (){
                Navigator.of(context).pop();
              })
          ],
        ),
        
      )
    );
  }
}