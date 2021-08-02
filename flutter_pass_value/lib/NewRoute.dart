import 'package:flutter/material.dart';

class NewPage extends StatelessWidget{
  String title;
  NewPage({this.title='未传入的标题'}){}


  Widget build(BuildContext context){
    return Scaffold(
        appBar:AppBar(title:Text(this.title)),
        body:Text('被打开的页面')
    );
  }
}