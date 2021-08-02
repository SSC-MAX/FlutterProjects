# ListView
默认为垂直列表，在ListView中可以使用ListTitle来添加项
```dart
Widget build(BuildContext context){
    return ListView(
        childern<Widget>[
            ListTitle(
                title:Text('这里是一级大标题'),
                subtitle:Text('这里是二级小标题')
            )
        ]
    )
}
```
title表示一级标题，subtitle表示二级标题  
## 加入图片
同时，可以使用leading来在项的前方添加图标，图标是通过Icon组件来实现的：
```dart
ListTitle(
    leading:Icon(Icons.settings),
)
```
以上使用了设置图标（内置），图标可以设置颜色、大小：
```dart
ListTitle(
    leading:Icon(Icons.settings, color:Colors.yellow, size:40),
)
```
也可以使用trailing在项的尾部添加图标，用法同leading:
```dart
ListTitle(
    title:Text('这里是一级标题'),
    trailing:Icon(Icons.settings),
)
```
如要使用图片，直接替换Icon即可，用法与图片相同
**注意:在垂直列表中，对诸如container的宽度的设置将失效，默认为占满**
## 水平列表
修改scrollDirection为Axis.Horizontal
```dart
Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      ...
```
**注意:水平列表中对高度的设置将会失效，默认将垂直占满父元素**
如果必须对高度进行设置，可以在其外套一层container，并设置其高度
```dart
Widget build(BuildContext context) {
    return Container(
        height:180.0,
        child: ListView(
            scrollDirection: Axis.horizontal,
            ...
        )
    )
```
此时ListView的高度被设置为180.0