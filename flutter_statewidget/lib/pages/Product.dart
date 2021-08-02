import 'package:flutter/material.dart';
import 'package:flutter_statewidget/pages/ProductInfo.dart';

class Product extends StatefulWidget {
  Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('商品页面')
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
             ElevatedButton(
               onPressed: (){
                 Navigator.pushNamed(
                   context, 
                  '/productInfo',
                  arguments: ProductInfoData('欢迎进入商品详情页面参观')
                 );
               }, 
               child: Text('跳转到商品详情'))
         ],
       ),
    );
  }
}