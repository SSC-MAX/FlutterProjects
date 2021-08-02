import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class DatePickerDemo extends StatefulWidget {
  const DatePickerDemo({Key? key}) : super(key: key);

  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {

  DateTime _nowDate = DateTime.now();


  @override
  void initState() {
    super.initState();
    print(_nowDate);
    //时间戳转化为日期
    //print(DateTime.fromMillisecondsSinceEpoch(1559967090998));
    print(formatDate(DateTime.now(), [yyyy,'年',mm,'月',dd]));
  }

  _showDatePicker(){
    showDatePicker(
      context:context,
      initialDate: _nowDate,
      firstDate: DateTime(1980),
      lastDate: DateTime(2100)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DatePicker'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //InKell 可点击组件,可视为无特效的按钮
          InkWell(
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('2018-12-19'),
                Icon(Icons.arrow_drop_down)
              ],
            ),
            onTap: (){
              print('打开日期组件');
              _showDatePicker();
            },
          )

        ],
      ),
    );
  }
  
}
