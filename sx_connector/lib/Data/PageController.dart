/*
 * @Descripttion: 
 * @version: 
 * @Author: wxy
 * @Date: 2024-07-02 20:35:04
 */
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ComponentsController extends GetxController {
  RxInt currentIndex = 1.obs;

  void selectPage(var index) {
    currentIndex.value = index;
  }
}
