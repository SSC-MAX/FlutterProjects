import 'package:flutter/material.dart';

class ProductInfoPage extends StatefulWidget {
  ProductInfoPage({Key? key}) : super(key: key);

  @override
  _ProductInfoPageState createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ProductInfoData;
    return Scaffold(
      appBar: AppBar(title: Text('商品详情')), 
      body: Text(args.pid));
  }
}

class ProductInfoData {
  final String pid;
  ProductInfoData(this.pid);
}
