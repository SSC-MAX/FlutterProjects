import 'package:flutter/material.dart';

class TextFieldDemoPage extends StatefulWidget {
  const TextFieldDemoPage({Key? key}) : super(key: key);

  @override
  _TextFieldDemoPageState createState() => _TextFieldDemoPageState();
}

class _TextFieldDemoPageState extends State<TextFieldDemoPage> {
  bool? _flag = false;

  var username = new TextEditingController();

  final myController = TextEditingController();

  void initState() {
    super.initState();
    username.text = '用户名初始值';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('页面被构建一次');
    return Scaffold(
      appBar: AppBar(
        title: Text('表单演示页'),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: '请输入用户名',
                ),
                controller: username,
                //若要获取输入的值不可按以下方法写，否则每输入一次都会导致页面被构建一次，导致光标会跳到开头
                // onChanged: (value){
                //   setState(() {
                //     username.text = value;
                //     print(username.text);
                //   });
                // },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity, //宽度适应屏幕
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(myController.text),
                            );
                          });
                    },
                    child: Text('登录')),
              ),

              SizedBox(
                height: 20,
              ),
              TextDemo(),

              Checkbox(
                value: _flag,
                onChanged: (v) {
                  setState(() {
                   _flag = v;
                  });
                },
              ),
            ],
          )),
    );
  }
}

class TextDemo extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            hintText: '请输入需要搜索的内容',
            border: OutlineInputBorder(),
          ),
        ),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(hintText: '多行文本框'),
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(hintText: '密码框'),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
              icon: Icon(Icons.people),
              border: OutlineInputBorder(),
              labelText: '用户名'),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
