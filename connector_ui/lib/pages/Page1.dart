import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("页面1", style: TextStyle(color: Colors.red, fontSize: 30),),
    );
  }
}
