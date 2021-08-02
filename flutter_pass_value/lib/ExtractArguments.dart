import 'package:flutter/material.dart';

class ScreenArguments{
  final String title;
  final String message;

  ScreenArguments(this.message,{this.title='默认的标题',} );
}

class ExtractArgumentsScreen extends StatelessWidget{
  static const routeName = '/extractArgument';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}