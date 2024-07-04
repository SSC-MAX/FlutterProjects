import 'package:flutter/material.dart';
import 'package:ui_test/components/OverlayWindow.dart';
import 'package:ui_test/utils/CommonUtils.dart';

class Page1 extends StatelessWidget {
  Page1({super.key});

  OverlayEntry overlayEntry = buildOverlayWindow();

  @override
  Widget build(BuildContext context) {
    OverlayState overlayState = Overlay.of(context);
    return Center(
      child: Column(
        children: [
          const Text("页面1", style: TextStyle(color: Colors.red, fontSize: 30),),
          ElevatedButton(onPressed: ()=>_showFloatingWidget(overlayState, overlayEntry), child: const Text("显示")),
          SizedBox(height: 300,),
          ElevatedButton(onPressed: ()=>_removeFloatingWidget(overlayState, overlayEntry), child: const Text("隐藏"))
        ],
      ),
    );
  }

  // 创建并显示悬浮窗小部件
  void _showFloatingWidget(OverlayState overlayState, OverlayEntry overlayEntry) {
    overlayState.insert(overlayEntry);
    logger.i("显示");
    // 当你想要移除悬浮窗时，调用以下函数
    // overlayEntry.remove();
  }

  // 创建并显示悬浮窗小部件
  void _removeFloatingWidget(OverlayState overlayState, OverlayEntry overlayEntry) {
    // 当你想要移除悬浮窗时，调用以下函数
    overlayEntry.remove();
    logger.i("隐藏");
  }
}
