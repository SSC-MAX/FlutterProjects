import 'package:flutter/material.dart';
import 'package:flutter_pass_value/SelectionScreen.dart';

class SelectionButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          _navigateAndDisplaySelection(context);
        },
        child: Text('选择一项吧，任何一项都行'),
    );
  }

  void _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    //设置SnackBar
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result'),));
  }

}