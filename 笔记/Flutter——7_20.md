# 1. Stack 层叠组件
Stack的用法类似于定位，它可以让它的子组件“浮动”于stack的父组件之上，以实现类似“脱离文档流”的效果。同时，它可以与Alignment和Position联动以实现子组件的定位，这种定位是相对于stack的父组件进行的。如果不进行定位，那么它的所有子组件将堆叠在一起。
## 与Alignment属性联动
Alignment使用(x,y)进行定位，取值范围-1~1,如超出取值范围会消失，(0,0)表示居中，x增加表示右移，y增加表示下移。
```dart
class AlignmentDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Center(
      child:Stack(
        alignment:Alignment(0,0),
        children:<Widget>[
          Container(
            height:200,
            width:200,
            color:Colors.red,
          ),
          Text('显示在Container之上')
        ]
      )
    )
  }
}
```
alignment作为Stack的属性，它的效果会设置到它所有的子组件上，如果Stack有多个不同子组件，会导致它们堆叠到一起。这时可以使用Align组件对每个子组件进行设置：
```dart
class AlignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Stack(
        children:<Widget>[
          Align(
            alignment:Alignment(0,0),
            child:Container(
              width:200,
              height:200,
              color:Colors.blue,
            )
          ),
          Align(
            alignment:Alignment(1,1),
            child:Text('这里是文本')
          )
        ]
      )
    )
  }
}
```
## 与Position组件联动
通过设置Position可以实现绝对定位的效果：
```dart
class PositionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
     child:Container(
       width:300,
       height: 300,
       color: Colors.red,
       child: Stack(
       children: <Widget>[
         Positioned(
           left: 0,
           child: Icon(Icons.search, size:40, color: Colors.white)
           ),
           Positioned(
             right:0,
             bottom:0,
             child: Icon(Icons.home, size:40,color:Colors.white)
           ),
           Positioned(
             left:50,
             right:50,
             top:50,
             bottom:50,
             child: Icon(Icons.sailing, size:40,color:Colors.white)
           )
       ],
     ),
     ) 
    );
  }
}
```

# 2.AspectRatio
它包含两个参数: aspectRatio与child,其中aspectRatio表示设置其子元素的长宽比，此长宽比将根据父组件进行计算,子组件单独的宽高设置无效  
**注意**AspectRatio的父组件只可设置长与宽中的一个，如果同时设置长款AspectRatio将会失效。单独设置其中之一后，将认定其为标准来计算子组件的长或者宽。
```dart
return Container{
  width:600,
  child: AspectRatio(
    aspectRatio:2.0/1.0,
    child:Container(
      color:Colors.green
    )
  )
}
```
此时将认定宽为600为基准，换算出子组件高度为300,即此时子组件的Container宽为600，高为300
```dart
return Container{
  height:100,
  child: AspectRatio(
    aspectRatio:2.0/1.0,
    child:Container(
      color:Colors.green
    )
  )
}
```
此时将认定高为100为基准，换算出子组件宽度为200，即此时子组件的Container宽为200，高为100

# 3. Card
卡片式布局
```dart

```

# 4.Wrap
在其父组件内实现类似流布局的效果，如横向排列时若一行放不下会自动换行。可以通过设置 direction来设置排列的方向  
部分参数：
  * spacing 调整主轴上各组件的间距
  * runSpacing 调整副轴上各组件的间距
  * alignment 主轴对齐方式
  * runAlignment 副轴对齐方式