/*
 * @Descripttion: 
 * @version: 
 * @Author: sc
 * @Date: 2024-07-04 14:56:43
 */
import 'package:flutter/material.dart';
import 'package:ui_view_laboratory/components/SlideUpPanel.dart';

void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: buildSlideUpPanel(context),

      ),
    );
  }
}