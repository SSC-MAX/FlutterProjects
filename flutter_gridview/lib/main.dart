import 'package:flutter/material.dart';
import 'res/listData.dart';
/*
 * 网格布局
 */
void main() {
  runApp(MyApp());
}

class MyApp  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:Text('GridView组件'),
        ),
      body: HomeConent(),
        ),
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
    );
  }
}

class HomeConent extends StatelessWidget{
  final length = 20;

  List<Widget> _getListData(){
    List<Widget> list = [];
    for(var i=0; i<length; i++) {
      list.add(Container(
        alignment:Alignment.center,  //对齐方式
        color: Colors.blue,
        child: Text(
          '这是第$i条数据',
          style:TextStyle(color:Colors.white, fontSize:15),
          ),
      ));
    }
    return list;
  }

  //从ListData中动态获取数据
  Widget _getListDataWidget(context, index){
    return Container(
        child: Column(
          children: <Widget>[
            Image.network(listData[index]['imageUrl']),
            SizedBox(height:12),
            Text(
              listData[index]['title'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize:15
              )
            )
          ],
        ),
        decoration: BoxDecoration(

        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    // return GridView.count(
    //   crossAxisSpacing:20.0,  //列与列之间距离
    //   mainAxisSpacing:20.0,  //行与行之间距离
    //   padding:EdgeInsets.all(10),
    //   crossAxisCount: 3,   //列数（一行widget数)
    //   childAspectRatio: 0.7, //每一个widget的宽高比，直接在Container中设置无效
    //   children: _getListData(),);
    return Padding(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(   //关于网格的样式等需要在此方法中设置
          crossAxisSpacing:20.0,  //列与列之间距离
          mainAxisSpacing:20.0,  //行与行之间距离
          crossAxisCount: 3,   //列数（一行widget数)
          childAspectRatio: 0.7, //每一个widget的宽高比，直接在Container中设置无效
      ),
      itemCount:listData.length,    //总widget个数
      itemBuilder: this._getListDataWidget),
    );
  }
}