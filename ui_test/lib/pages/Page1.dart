import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:ui_test/components/OverlayWindow.dart';
import 'package:ui_test/components/SlideUpPanel.dart';
import 'package:ui_test/controller/StatusController.dart';
import 'package:ui_test/utils/CommonUtils.dart';

class Page1 extends StatelessWidget {
  Page1({super.key});

  StatusController statusController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: 60.0,
      maxHeight: 200.0,
      renderPanelSheet: false,
      slideDirection: SlideDirection.DOWN,
      defaultPanelState: PanelState.OPEN,
      panel: floatingPanel(statusController), // 面板内容
      collapsed: floatingCollapsed(),
      body: const Center(
        child: Text("页面1", style: TextStyle(fontSize: 20.0, color: Colors.red),),
      ),
    );
  }
}
