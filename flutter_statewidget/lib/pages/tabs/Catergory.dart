import 'package:flutter/material.dart';
import '../Form.dart';

class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     RaisedButton(
    //       child: Text('跳转到表单页面并传值'),
    //       onPressed: (){
    //         // Navigator.of(context).push(
    //         //   MaterialPageRoute(
    //         //     builder:(context) => FormPage(title: '跳转传了值')
    //         //   )
    //         // );
    //         Navigator.pushNamed(context, '/form');
    //       })
    //   ],
    // );
    return DefaultTabController(
        length: 8,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              isScrollable: true,  //顶部tab是否可以滑动
              indicatorColor:Colors.red,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(text: '第一个'), 
                Tab(text: '第二个'),
                Tab(text: '第三个'), 
                Tab(text: '第四个'),
                Tab(text: '第五个'), 
                Tab(text: '第六个'),
                Tab(text: '第七个'), 
                Tab(text: '第八个'),
              ]),
            
          ),
          body: TabBarView(
            children: [
              ListView(
                children: [
                  ListTile(title: Text('第一个tab')),
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
               ListView(
                children: [
                  ListTile(title: Text('第三个tab')),
                  ListTile(title: Text('第三个tab')),
                  ListTile(title: Text('第三个tab')),
                ],
              ),
               ListView(
                children: [
                  ListTile(title: Text('第四个tab')),
                  ListTile(title: Text('第四个tab')),
                  ListTile(title: Text('第四个tab')),
                ],
              ),
               ListView(
                children: [
                  ListTile(title: Text('第五个tab')),
                  ListTile(title: Text('第五个tab')),
                  ListTile(title: Text('第五个tab')),
                ],
              ),
               ListView(
                children: [
                  ListTile(title: Text('第六个tab')),
                  ListTile(title: Text('第六个tab')),
                  ListTile(title: Text('第六个tab')),
                ],
              ),
               ListView(
                children: [
                  ListTile(title: Text('第七个tab')),
                  ListTile(title: Text('第七个tab')),
                  ListTile(title: Text('第七个tab')),
                ],
              ),
               ListView(
                children: [
                  ListTile(title: Text('第八个tab')),
                  ListTile(title: Text('第八个tab')),
                  ListTile(title: Text('第八个tab')),
                ],
              ),
            ]),
        ));
  }
}
