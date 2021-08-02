import 'package:flutter/material.dart';

class SearchPageData {
  String message;
  SearchPageData(this.message);
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SearchPageData;
    return Scaffold(
      appBar: AppBar(title:Text('搜索页面')),
      body: Text('搜索页面内容区域${args.message}'),
    );
  }
}