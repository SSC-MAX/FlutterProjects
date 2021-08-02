底部导航栏的实现可以使用`Scaffold`的子组件`bottomNavigationBar`实现，导航栏中每一项包裹在BottomNavigationBarItem中:
```dart
class Demo extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return Scaffold(
            appBar:AppBar(
                title:Text('标题')
            ),
            body:Text('主体内容'),
            bottomNavigationBar:BottomNavigationBar(
                items:[
                    BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: '分类'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '设置'
            )
        ]
    ),
);
}
}
```
**注意：**以上方法在导航栏标签数量小于等于3个时可以奏效，大于3个图标将变成空白，此时可以通过设置`type: BottomNavigationBarType.fixed`来解决：
```dart
...
bottomNavigationBar:BottomNavigationBar(
    type:BottomNavigationBarType.fixed,
    items:[
        ...
    ]
)
```
设置选中的标签变色需要使用`currentIndex`(当前选中的标签的索引数，从0开始)与`onTap`(被选中时调用),在`onTap`中进行设置，当标签被点击时修改`currentIndex`的值为它的索引。
```dart
class _TabState extends State {
    int _mIndex = 0;
    @override
    Widget build(BuildContext context){
        return Scaffold(
            currentIndex:this._mIndex,
            appBar:AppBar(title:Text('这里是标题')),
            body:Text('主体内容'),
            onTap:(int index){
                setState((){
                    _mIndex = index;
                })
            }
            bottomNavigationBar:BottomNavigationBar(
            )
        )
    }
}
```
选中与未选中时的颜色可以通过设置`selectedItemColor`与`unselectedItemColor`调整  
选中标签切换页面可以通过将页面存入一个list，然后在`body`中引入当前索引对应的list中的页面:
```dart
class _TabState extends State{
     int _mIndex = 0;
     List pageList = [
         Page1(),
         Page2(),
         Page3()
     ];
    @override
    Widget build(BuildContext context){
        return Scaffold(
            currentIndex:this._mIndex,
            appBar:AppBar(title:Text('这里是标题')),
            body:this.pageList[currentIndex],
            onTap:(int index){
                setState((){
                    _mIndex = index;
                })
            }
            bottomNavigationBar:BottomNavigationBar(
            )
        )
    }
}
```