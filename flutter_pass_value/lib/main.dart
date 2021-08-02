import 'package:flutter/material.dart';
import 'package:flutter_pass_value/NewRoute.dart';
import 'ExtractArguments.dart';
import 'SelectionButton.dart';
import 'NewRoute.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // final routes = {
  //   '/':(context,{arguments}) => MyHomePage(),
  //   // '/newPage':(context,{arguments}) => NewPage()
  // };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewRouteOpener(),
      routes: {
        ExtractArgumentsScreen.routeName:(context) => ExtractArgumentsScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text('准备传值'),),
      body: Center(
        child: RaisedButton(
          child: Text('点击跳转传参'),
          onPressed: (){
            Navigator.pushNamed(
                context,
                ExtractArgumentsScreen.routeName,
                arguments: ScreenArguments(
                    'Extract Argument Screen',
                    title:'This message is extracted in the build method.',
                )
            );
          },
        ),
      ),
    ) ;
  }
}

//回传数据
class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Returning Data Demo'),
      ),
      body: Center(
        child: SelectionButton(),
      ),
    );
  }
}

class NewRouteOpener extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('打开新路由'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewPage(title:'传入的标题'))
            );
          },
          child: Text('点击传值'),
        ),
      ),
    );
  }
}