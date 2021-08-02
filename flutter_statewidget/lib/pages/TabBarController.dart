import 'package:flutter/material.dart';

class TabBarControllerPage extends StatefulWidget {
  TabBarControllerPage({Key? key}) : super(key: key);

  @override
  _TabBarControllerPageState createState() => _TabBarControllerPageState();
}

class _TabBarControllerPageState extends State<TabBarControllerPage> with SingleTickerProviderStateMixin{
  //使用TabController可以实现时间绑定
  TabController? _tabController;
  @override
  initState(){
    super.initState();
    _tabController = TabController(
      vsync: this,
      length:2
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text:'热销'),
            Tab(text:'推荐'),
          ]),
      ),
      body: TabBarView(
        controller:_tabController,
        children: [
          Center(child:Text('热销')),
          Center(child: Text('推荐'),)
        ]),
    );
  }
}
