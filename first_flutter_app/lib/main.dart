import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

///App根页面
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //注册路由表
      routes: {
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        //决定了应用的初始路由是哪一个命名路由
        "new_page": (context) => NewRoute(),
        "passed_page": (context) => EchoRoute(),
        "route1": (context) => Route1(),
        "route2": (context) => Route2(),
      },
      // home: MyHomePage(title: 'Flutter Demo Home Page'),   已在路由表中注册了HomePage就不需要再在这里注册
    );
  }
}

///主页面 开启即为此
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have clicked this button many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              child: Text("Open a new Route"),
              textColor: Colors.blue,
              onPressed: () {
                //使用命名路由导航到新路由
                Navigator.pushNamed(context, "new_page");
              },
            ),
            //打开TipRoute的按钮
            FlatButton(
                onPressed: () async {
                  var result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return TipRoute(
                      text: "我是提示xxx",
                    );
                  }));
                  print("返回值是: $result");
                },
                child: Text("点击打开TipRoute")),

            //打开测试路由
            FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TestRoute();
                  }));
                },
                child: Text("点击打开册测试路由")),

            //传递参数
            FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed("passed_page", arguments: "你好");
                },
                child: Text("点击开始尝试传递参数")),

            RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Route1();
                  }));
                },
                child: Text('点击进入Route1')),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}

//一个新的路由
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Route"),
      ),
      body: Center(
        child: Text("This is a new route"),
      ),
    );
  }
}

//用于返回一个返回值的路由
class TipRoute extends StatelessWidget {
  TipRoute({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () async {
          //打开TipRoute
          var result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return TipRoute(
              text: "我是提示xxx",
            );
          }));
          print("路由返回值:$result");
        },
        child: Text("打开提示页"),
      ),
    );
  }
}

class TestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TestRouteState();
  }
}

class _TestRouteState extends State<TestRoute> {
  int _counter = 0;

  void _testCounter() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("测试路由"),
      ),
      body: new Center(
        child: new Column(
          //以下这行用于将children定位于正中心
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("你点击了计数器："),
            new Text(
              '$_counter次',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _testCounter();
        },
        tooltip: 'Test',
        child: new Icon(Icons.add),
        backgroundColor: Colors.green, //修改按钮颜色
      ),
    );
  }
}

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    return new Scaffold(
      appBar: new AppBar(
        title: Text("这里是尝试参数传递的命名路由"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Text("这里是尝试参数传递的命名路由"),
            new Text("传递过来的参数是："),
            new Text(
              '$args',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}

class Route1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args2_1 = ModalRoute.of(context)!.settings.arguments;
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Route1'),
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            RaisedButton(
              // onPressed: () async {
              //   var result = await Navigator.push(context,
              //       MaterialPageRoute(builder: (context) {
              //     return Route2(text: "这里是传递的消息");
              //   }));
              //   print(result);
              // },
              onPressed: () {
                Navigator.of(context)
                    .pushNamed("route2", arguments: "Route1向Route2问好");
              },
              child: Text("点击传递数据并进入Route2"),
            ),
            Text('以下是Route2返回给Route1的数据'),
            Text('$args2_1'),
          ],
        ),
      ),
    );
  }
}

class Route2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args1_2 = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Route2"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("以下是从Route1发送过来的数据："),
            Text(
              '$args1_2',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
                onPressed: () => Navigator.of(context)
                    .pushNamed("route1", arguments: "Route2向Route1问好"),
                child: Text("点击返回Route1并返回数据"))
          ],
        ),
      ),
    );
  }
}

//生成随机英文
// class RandomWordsWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final wordPair = new WordPair.random();
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: new Text(wordPair.toString()),
//     );
//   }
// }

///路由——传值
// class TipRoute extends StatelessWidget {
//   TipRoute({Key? key,
//   required this.text,
//   }): super(key: key);
//
//   final String text;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(
//         title: Text("提示")
//       ),
//       body:Padding(
//         padding: EdgeInsets.all(18),
//         child:Center(
//           child:Column(
//             children: <Widget>[
//               Text(text),
//               RaisedButton(
//                 onPressed:()=> Navigator.pop(context,"我是返回值") ,
//                 child: Text("返回"),)
//             ]
//           )
//         )
//       )
//     );
//   }
// }
//
//
