

import 'package:flutter_statewidget/pages/NewPage.dart';
import 'package:flutter_statewidget/pages/tabs/Setting.dart';
import 'pages/Form.dart';
import 'pages/Search.dart';
import 'pages/Product.dart';
import 'pages/ProductInfo.dart';
import 'pages/user/Login.dart';
import 'pages/user/RegisterFirst.dart';
import 'pages/user/RegisterSecond.dart';
import 'pages/user/RegisterThird.dart';
import 'pages/AppBarDemo.dart';
import 'pages/TabBarController.dart';
import 'pages/tabs/User.dart';
import 'pages/Button.dart';
import 'pages/TextFieldDemo.dart';
import 'pages/FormDemo.dart';
import 'pages/DatePickerDemo.dart';


final mRoutes = {
  '/form': (context) => FormPage(),
  '/search': (context) => SearchPage(),
  'settings': (context) => Setting(),
  'newPage': (context) => NewPage(),
  '/product': (context) => Product(),
  '/productInfo': (context) => ProductInfoPage(),
  '/login': (context) =>LoginPage(),
  '/registerFirst':(context)=>RegisterFirstPage(),
  '/registerSecond': (context)=>RegisterSecondPage(),
  '/registerThird': (context)=>RegisterThirdPage(),
  '/appBarDemo': (context) => AppBarDemoPage(),
  '/tabBarController': (context) => TabBarControllerPage(),
  '/user': (context) => UserPage(),
  '/buttonDemoPage':(context) => ButtonDemoPage(),
  '/textFieldDemo':(context) => TextFieldDemoPage(),
  '/formDemo':(context) => FormDemoPage(),
  '/datePickerDemo':(context) => DatePickerDemo(),
};
