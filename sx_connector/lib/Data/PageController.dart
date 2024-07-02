import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:sx_connector/Components/TestPage1.dart';
import 'package:sx_connector/Components/TestPage2.dart';
import 'package:sx_connector/Components/TestPage3.dart';

class ComponentsController extends GetxController {
 
  RxInt currentIndex = 1.obs;

  void selectPage(var index) {
    currentIndex.value = index;
  }
}
