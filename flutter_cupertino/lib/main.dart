import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
    
    );
  }
  
}

class CupertinoDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return new CupertinoPageScaffold(
     navigationBar: CupertinoNavigationBar(
       middle:Text('Cupertino Demo'),
     ),
     child: Center(
       child: CupertinoButton(
         color: CupertinoColors.activeBlue,
         child: Text('Press'), 
         onPressed: (){
           print('点击了按钮');
         }),
     ),
   );
  }
  
}