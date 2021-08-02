import 'package:flutter/material.dart';

class FormDemoPage extends StatefulWidget {
  const FormDemoPage({Key? key}) : super(key: key);

  @override
  _FormDemoPageState createState() => _FormDemoPageState();
}

class _FormDemoPageState extends State<FormDemoPage> {

  String? username;
  int? sex;
  String info = '';

  List hobby = [
    {
      "checked": true,
      "title": "吃饭"
    },
    {
      "checked": false,
      "title": "睡觉"
    },
    {
      "checked": true,
      "title": "写代码"
    }
  ];

  List<Widget> _getHobby() {
    List<Widget> tempList = [];
    for (var i = 0; i < this.hobby.length; i++) {
      tempList.add(
          Row(
            children: [
              Text(this.hobby[i]["title"] + ":"),
              Checkbox(
                value: this.hobby[i]["checked"],
                onChanged: (value) {
                  setState(() {
                    this.hobby[i]["checked"] = value;
                  });
                },
              )
            ],
          )
      );
    }
    return tempList;
  }

  void _sexChanged(value) {
    setState(() {
      this.sex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('学员信息登记系统'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  hintText: '输入用户信息'
              ),
              onChanged: (value) {
                setState(() {
                  this.username = value;
                });
              },
            ),
            Row(
              children: <Widget>[
                Text('男'),
                Radio(
                    value: 1,
                    groupValue: this.sex,
                    onChanged: _sexChanged),
                SizedBox(width: 20),

                Text('女'),
                Radio(
                    value: 2,
                    groupValue: this.sex,
                    onChanged: _sexChanged),
              ],
            ),

            Container(
              width: double.infinity, //宽度适应屏幕
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    print(this.sex);
                    print(this.username);
                  },
                  child: Text('登录')),
            ),

            //爱好
            SizedBox(height: 40,),
            Column(
              children: _getHobby(),
            ),

            TextField(
              maxLength: 4,
              decoration: InputDecoration(
                hintText: '描述信息',
                border: OutlineInputBorder()
              ),
              onChanged: (value){
                setState(() {
                  this.info = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
