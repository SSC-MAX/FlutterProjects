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
      home: Scaffold(
        appBar:AppBar(
          title: Text('Padding Row Column')
        ) ,
        body: TestDemo(),
        )
    );
  }

}

class IconContainer extends StatelessWidget {

  double size = 15;
  Color? color;
  IconData? icon;

  IconContainer(icon,{color,size,}){
    this.size =size;
    this.color =color;
    this.icon =icon;
}

  @override
  Widget build(BuildContext context) {
   return Container(
     height:100.0,
     width:100.0,
     color: color,
     child: Center(
       child:Icon(
         icon,
         size:size,
         color: Colors.white,)
     ),

   );
  }
}


//Row与Column
class LayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconContainer(Icons.search,color: Colors.blue,size: 20.0,),
        IconContainer(Icons.home,color: Colors.orange,size: 20.0,),
        IconContainer(Icons.window,color: Colors.red,size: 20.0,)
      ],
    );
  }
}

//Expanding 设置其flex，效果同layout_weight
class ExpandedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: IconContainer(Icons.ac_unit, color: Colors.blue,size: 20.0,)
          ),
          Expanded(
            flex: 1,
            child: IconContainer(Icons.access_alarm, color:Colors.orange, size: 20.0,))
      ],
    );
  }
}

class PractiseDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Container(
        //   height:200.0,
        //   color: Colors.black,
        // ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: IconContainer(Icons.search, color: Colors.green,size: 20.0,),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: IconContainer(Icons.home,color: Colors.orange, size: 20.0,),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconContainer(Icons.window,color: Colors.red,size: 20.0,),
                  )
                ]
              ))

          ]
        )
      ],
    );
  }
}

class TestDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
     children: <Widget>[
        SizedBox(width:10),
        Expanded(
          flex: 1,
          child: Container(
            height: 180,
            color: Colors.blue,
          ),
          ),
          SizedBox(width:10),
          Expanded(
            flex: 1,
            child:Container(
              height: 180,
              child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.orange,
                )
              ),
              SizedBox(height:10),  //此处的设置不会影响到上下的Container，它们会自适应
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              )
            ]
          ),
            )
             )
        ]
    );
  }
}