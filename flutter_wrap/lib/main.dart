import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter_Wrap',
     home: Scaffold(
       appBar: AppBar(
         title: Text('Wrap'),
        ),
        body:LayoutDemo(),
     ),
   );
  }
}

class LayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //Wrap会根据其父布局进行对齐
    return Wrap(
      spacing:10,
      direction: Axis.horizontal,
      children: <Widget>[
        MyButton( text: '这是一个按钮',),
        MyButton( text: '这是一个按钮',),
        MyButton( text: '这是一个按钮',),
        MyButton( text: '这是一个按钮',),
        MyButton( text: '这是一个按钮',),
        MyButton( text: '这是一个按钮',),
        MyButton( text: '这是一个按钮',),
        MyButton( text: '这是一个按钮',),
        MyButton( text: '这是一个按钮',),
        MyButton( text: '这是一个按钮',),
      ],
    );
    
  }
}

class MyButton extends StatelessWidget{
  final String text;
  const MyButton({Key? key, required this.text}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.text),
      onPressed:(){
        print('点击了按钮');
      }
    );
  }
}