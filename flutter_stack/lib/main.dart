import 'package:flutter/material.dart';

/*
Stack:类似绝对定位
  Alignment:
    Alignment.center 居中
    Alignment()  使用(x,y)表示位置，取值范围-1~1，x增加表示右移，y增加 表示下移（若超出取值范围，会消失）
 */

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack实现定位布局',
      home: Scaffold(
        appBar: AppBar(title: Text('Stack')),
        body: AspectRatioDemo(),
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
        width:600,
        height:600,
        color:Colors.red,
       
        child: Stack(
        // alignment: Alignment.center,
          
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            color: Colors.green,
          ), 
          Text(
            '这里是一个文本', 
            style:TextStyle(
              color: Colors.white,
            ) ,
            ),
            Text(
            '尝试混入其中', 
            style:TextStyle(
              color: Colors.black,
            ) ,
            ),
         
          
        ],
      ),
      )
      
      
      
    );
  }
}

class PositionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
     child:Container(
       width:300,
       height: 300,
       color: Colors.red,
       child: Stack(
       children: <Widget>[
         Positioned(
           left: 0,
           child: Icon(Icons.search, size:40, color: Colors.white)
           ),
           Positioned(
             right:0,
             bottom:0,
             child: Icon(Icons.home, size:40,color:Colors.white)
           ),
           Positioned(
             left:50,
             right:50,
             top:50,
             bottom:50,
             child: Icon(Icons.sailing, size:40,color:Colors.white)
           )
       ],
     ),
     ) 
    );
  }
}

class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      height:100,
      color: Colors.green,
      child: AspectRatio(
        aspectRatio:3.0/1.0,   //设置内部child的长宽比，此长宽比会根据父元素的长宽比确定
        child: Container(
          
          height:600,
          color: Colors.red
        ),
      ),
    );
  }
}

//
class CardDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('张三', style:TextStyle(fontSize:28)),
                subtitle: Text('高级工程师')
              ),
              ListTile(
                title: Text('电话:123456789'),
              ),
              ListTile(
                title: Text('邮箱:1245@12354.com',),
              ),
            ]
          )
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('张三', style:TextStyle(fontSize:28)),
                subtitle: Text('高级工程师')
              ),
              ListTile(
                title: Text('电话:123456789'),
              ),
              ListTile(
                title: Text('邮箱:1245@12354.com',),
              ),
            ]
          )
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('张三', style:TextStyle(fontSize:28)),
                subtitle: Text('高级工程师')
              ),
              ListTile(
                title: Text('电话:123456789'),
              ),
              ListTile(
                title: Text('邮箱:1245@12354.com',),
              ),
            ]
          )
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('张三', style:TextStyle(fontSize:28)),
                subtitle: Text('高级工程师')
              ),
              ListTile(
                title: Text('电话:123456789'),
              ),
              ListTile(
                title: Text('邮箱:1245@12354.com',),
              ),
            ]
          )
        ),
      ]
    );
  }
}

class CardPractise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio:16/9,
                child:Image.network('https://www.itying.com/images/flutter/2.png',fit:BoxFit.cover),
              ),
              ListTile(
                leading: ClipOval(
                  child:Image.network('https://www.itying.com/images/flutter/2.png') ,
                ),
                title: Text('标题'),
                subtitle: Text('描述'),
              )
            ],
          ),
        ),

        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio:16/9,
                child:Image.network('https://www.itying.com/images/flutter/2.png',fit:BoxFit.cover),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://www.itying.com/images/flutter/2.png'),
                ),
                title: Text('标题'),
                subtitle: Text('描述'),
              )
            ],
          ),
        ),
      ]
    );
  }
  
}