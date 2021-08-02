import 'package:flutter/material.dart';
import 'tabs/Home.dart';
import 'tabs/Setting.dart';
import 'tabs/Catergory.dart';

class MyScaffold extends StatefulWidget {
  final originalIndex;

  MyScaffold({Key? key, this.originalIndex = 0}) : super(key: key);

  @override
  _MyScaffoldState createState() => _MyScaffoldState(this.originalIndex);
}

class _MyScaffoldState extends State<MyScaffold> {
  int mIndex = 0;

  _MyScaffoldState(index) {
    this.mIndex = index;
  }

  List _pageList = [
    HomePage(),
    Category(),
    Setting(),
    HomePage(),
    Category(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('StateWidget'),
        ),

        floatingActionButton: Container(
          height: 80,
          width: 80,
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(top:10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
          ),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              print('点击了浮动按钮');
              setState(() {
                this.mIndex = 1;
              });
            },
            backgroundColor: this.mIndex==1 ? Colors.red : Colors.blue,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: this._pageList[this.mIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this.mIndex,
          onTap: (int index) {
            setState(() {
              print('现在的mIndex=$mIndex');
              this.mIndex = index;
              print('现在的index=$index');
            });
            print(index);
          },
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.blue,
          iconSize: 36.0,
          // fixedColor:Colors.red,  //图标被选中的颜色
          type: BottomNavigationBarType.fixed,
          //配置底部tabs可以有三个以上的按钮
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置'),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.home),
            //   label: '首页'
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.category),
            //   label: '分类'
            // ),
          ],
        ),
        drawer: Drawer(
            child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              // Expanded(
              //   child: DrawerHeader(
              //     child: Text('你好Flutter'),
              //     decoration:BoxDecoration(
              //       // color:Colors.yellow,
              //       image: DecorationImage(
              //         image:NetworkImage('https://www.itying.com/images/flutter/2.png'),
              //         fit: BoxFit.cover
              //       )
              //     )
              //   ),
              // )
              Expanded(
                child: UserAccountsDrawerHeader(
                  accountName: Text('用户名称'),
                  accountEmail: Text('用户@邮箱'),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.itying.com/images/flutter/3.png')),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://www.itying.com/images/flutter/2.png'),
                          fit: BoxFit.cover)),
                  otherAccountsPictures: <Widget>[
                    Image.network(
                        'https://www.itying.com/images/flutter/1.png'),
                    Image.network('https://www.itying.com/images/flutter/4.png')
                  ],
                ),
              )
            ]),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.home)),
              title: Text('我的空间'),
            ),
            Divider(), //分隔线
            ListTile(
                leading: CircleAvatar(child: Icon(Icons.people)),
                title: Text('用户中心'),
                onTap: () {
                  Navigator.of(context).pop(); //返回时隐藏侧边栏
                  Navigator.pushNamed(context, '/user');
                }),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.settings)),
              title: Text('设置中心'),
            ),
            Divider(),
          ],
        )),
        endDrawer: Drawer(child: Text('右侧侧边栏')));
  }
}

class MyTabaDemo extends StatefulWidget {
  MyTabaDemo({Key? key}) : super(key: key);

  @override
  _MyTabaDemoState createState() => _MyTabaDemoState();
}

class _MyTabaDemoState extends State<MyTabaDemo> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('这里是标题')),
        body: Text('这里是主体内容'),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this.currentIndex,
          onTap: (int index) {
            setState(() {
              this.currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置')
          ],
        ));
  }
}
