import 'package:flutter/material.dart';

class ButtonDemoPage extends StatelessWidget {
  const ButtonDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('自定义按钮'),
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.black,size: 40,),
          onPressed: (){
            print('点击了浮动按钮');
          },
          backgroundColor: Colors.yellow,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //调整宽高的按钮
              Container(
                width: 300,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    print('点击了宽高按钮');
                  },
                  child: Text(
                    '调整宽高按钮',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellow)),
                ),
              ),

              SizedBox(height: 20),

              //图标按钮
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.home),
                  label: Text('图标按钮')),

              SizedBox(height: 20),

              //自适应按钮
              //包裹在Row中可以实现横向占满，如果不包裹在Row中就将高度占满
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          print('点击了自适应按钮');
                        },
                        child: Text('自适应按钮'),
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {},
                child: Text('圆角按钮'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black),  //字体颜色
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
                ),
              ),

              SizedBox(height: 20),

              Container(
                height: 80,
                child:ElevatedButton(
                  onPressed: () {},
                  child: Text('圆形按钮'),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(CircleBorder(
                          side: BorderSide(color: Colors.white))),
                      elevation: MaterialStateProperty.all(20)
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
