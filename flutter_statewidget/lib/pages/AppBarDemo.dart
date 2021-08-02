import 'package:flutter/material.dart';

class AppBarDemoPage extends StatelessWidget {
  const AppBarDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //DefaultTabController必须在MaterialApp的Home中配置
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('自定义标题栏'),
            centerTitle: true, //无论Android还是iOS都将标题居中
            backgroundColor: Colors.red,
            //头部图标，设置后覆盖原有的返回按钮
            //如使用Icon，那么其不可点击
            // leading: IconButton(
            //   icon:Icon(Icons.menu),
            //   onPressed:(){
            //     print('点击了顶部的菜单按钮图标');
            //   }),
            //尾部图标
            // actions: [
            //   IconButton(
            //       icon: Icon(Icons.search),
            //       onPressed: () {
            //         print('点击了顶部的搜索按钮图标');
            //       })
            // ],
            bottom: TabBar(
                //tabs中配置顶部切换菜单
                tabs: [Tab(text: '热门'), Tab(text: '推荐')]),
          ),
          body: Center(
              child: TabBarView(children: [
                ListView(
                  children: [
                    ListTile(
                      title: Text('第一个tab'),
                    ),
                    ListTile(title: Text('第一个tab')),
                    ListTile(title: Text('第一个tab')),
                 ],
            ),
                  ListView(
                    children: [
                      ListTile(title: Text('第二个tab')),
                      ListTile(title: Text('第二个tab')),
                      ListTile(title: Text('第二个tab')),
                   ],
            ),
          ])),
        ));
  }
}
