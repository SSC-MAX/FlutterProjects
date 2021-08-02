# Scaffold中的appBar
## 一些自定义属性
* centerTitle 将title居中
* backgroundColor: 背景颜色
* leading: 将在title之前显示，常用作放置图标:
```dart
...
child:Scaffold(
    appBar:AppBar(
        title:Text('这里是标题'),
        leading:IconButton(
            icon:Icon(Icons.menu),
            onPressed(){
                print('点击了顶部按钮图标')
            }
        )
    )
)
```
如果使用Icon，那么不可点击
* bottom: 用法同leading，不过在末尾显示

## 去除DEBUG图标
在MaterialApp中设置`debugShowCheckedModeBanner`为fasle
```dart
return MaterialApp(
    debugShowCheckModeBanner:false,
    ...
)
```

# Tab标签实现页面切换
## 使用DefaultTabController
使用`DefaultTabController`可以实现通过顶部标签切换页面，他有以下规则：
* 必须嵌套在`MaterialApp`的`home`中
* 必须设置`length`属性，表示有几个标签
* 使用`TabBar`及其底下的`tabs`,`Tab()`实现创建标签
* 页面必须包裹在`TabBarView`中，且数量必须与length一致
```dart
return MaterialApp(
    title:'总的标题',
    home: DefaultTabController(
        length:2,
        child:Scaffold(
            appBar:AppBar(
                title:Text('页面子标题'),
            ),
            bottom:TabBar(
                tabs:[
                    Tab(text:'热门'),
                    Tab(text:'推荐')
                ]
            )
            body: Center(
                child:TabBarView(
                    children:<Widget>[
                        ListView(
                            ListTitle(title:Text('第一个标签的内容')),
                            ListTitle(title:Text('第一个标签的内容')),
                            ListTitle(title:Text('第一个标签的内容')),
                        ),
                        ListView(
                            ListTitle(title:Text('第二个标签的内容')),
                            ListTitle(title:Text('第二个标签的内容')),
                            ListTitle(title:Text('第二个标签的内容')),
                        ),
                    ]
                )
            )
        )
    ),
)
```
以上在`DefaultTabController`的body中嵌套了`Scaffold`，然后再`Scaffold`的`body`中嵌套了两个ListView（在`body`的`children`中有且只能由两个子控件)  
若要实现标签占满顶部导航栏不留title,可以将`TaBar`嵌套入`title`中：
```dart
...
child:Scaffold(
    appBar:AppBar(
        title:TabBar(
            tabs:[
                Tab(text:'第一个'),
                Tab(text:'第二个'),
                Tab(text:'第三个')
            ]
        )
    ),
    ...
)
```
## TabBarController的相关属性
* isScrollable: 标签是否可以滑动
* indicatorColor: 指示器的颜色
* labelColor: 标签未选中的颜色
* unselectedLabelColor: 标签选中时的颜色
## TabController
### 使用
1.继承`SingleTickerProviderStateMixin`并设置`initState`方法(**TabController只能使用在StatefulWidget中**)
```dart
class _TabBarControllerPageState extends State<TabBarControllerPage> with SingleTickerProviderStateMixin{
    //声明一个TabController
  TabController? _tabController;
  //重写initState方法
  @override
  initState(){
    super.initState();
    _tabController = TabController(
      vsync: this,
      length:2
    );
  }
```
2.在`TabBar`与`TabBarView`中设置`TabController`:
`TabBar`:
```dart
...
bottom:TabBar(
    controller:_tabController,
)
```
`TabBarView`:
```dart
...
body:TabBarView(
    controller:_tabController,
    children:<Widget>[
        ...
    ]
)
```
### 设置监听
使用`TabBarController`可以设置监听事件，监听标签的变化：
```dart
...
_tabController.addListener((){
    print('当前点击的是${_tabController.index}')
    setState((){})
})
```