# 普通路由
## 打开与退出
使用`Navigator`进行路由的打开和退出  
打开并跳转到NewRoute页面：
```dart
...
RaisedButton(
    onPressed:(){
        Navigator.of(context).push(
            context,
            MaterialPageRoute(builder:(context) {
                return NewRoute();
            })
        );
    },
    child:Text('点击跳转')
)
```
`MaterialPageRoute`表示一个占据整个屏幕的模拟路由页面  
回退到上一级使用pop():
```dart
...
RaisedButton(
    onPressed:(){
        Navigator.of(context).pop(
            context
        );
    },
    child:Text('点击跳转')
)
```
在上一级的页面使用一个变量接收即可：
```dart
...
RaisedButton(
    onPressed:(){
        final result = Navigator.of(context).push(
            context,
            MaterialPageRoute(builder:(context) => NewPage()),
        );
    },
    child:Text('点击跳转')
)
```
## 数据传递
向打开的路由传值: 在被打开的路由中设置构造函数，将需要传入的值设置为参数并在MaterialPageRoute中返回时传入数值。  
被打开的页面:
```dart
class NewPage extends StatelessWidget{
    String title;
    NewPage(this.title)

    Widget build(BuildContext context){
        return Scaffold(
            appBar:AppBar(this.title),
            body:Text('被打开的页面')
        )
    }
}
```
打开NewPage:
```dart
...
RaisedButton(
    onPressed: (){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewPage('传入的标题'))
        );
    },
    child: Text('点击传值'),
)
```
不使用箭头函数，直接return并传入值也是可以的  
**注意:**如果NewPage中的参数为可选参数，需要在构造函数中为其赋上一个初始值，同时在打开它的时候需要指定传给哪个参数，如以上若title为可选参数，传值时需要：`NewPage(title:'传入的标题')`，但是如果不是可选参数就不需要指定参数的名称。  
向上一个页面返回数据：
```dart
...
RaisedButton(
    onPressed:(){
        Navigator.pop(
            context,
            '返回的数据'
        );
    },
    child:Text('点击返回数据')
)
```

# 命名路由
在MyApp中设置注册表，为每一个路由注册一个名字，直接使用此名打开路由：
```dart
class MyApp extends StatelessWidget{
    Widget build(BuildContext context){
        ...
        initalRoute:'/',
        routes:{
            '/':(context) => HomePage(),
            '/newPage':(context)=>NewPage(),
        }
    }
}
```
`initialRoute`表示App将从哪一个路由开始运行，设置它的时候**不可设置Home**  
打开命名路由：
```dart
...
RaisedButton(
    onPressed:(){
        Navigator.pushNamed(
            context,
            'newPage')
    },
    child:Text('点击打开新路由')
)
```
## 向新的路由传递数据：  
1.创建一个类用于存储需要传递的数据，将需要传递的数据以构造函数参数的形式展现：
```dart
class ScreenArguments{
  final String title;
  final String message;

  ScreenArguments(this.message,{this.title='默认的标题',} );
}
```
2.创建接收数据的路由：
```dart
class ExtractArgumentsScreen extends StatelessWidget{
  static const routeName = '/extractArgument';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}
```
设置routeName是为了注册路由的时候直接引用。设置args是为了获取被传递的数据，以后可以通过args取到需要的数据。  
3.设置传递数据的路由
```dart
...
child: RaisedButton(
          child: Text('点击跳转传参'),
          onPressed: (){
            Navigator.pushNamed(
                context,
                ExtractArgumentsScreen.routeName,
                arguments: ScreenArguments(
                    'Extract Argument Screen',
                    title:'This message is extracted in the build method.',
                )
            );
          },
        ),
```
通过pushNamed的参数arguments将需要传递的数据赋值给存储数据的类  
## 向上一个路由返回数据
同普通路由，通过pop的第二个参数传值

# 路由替换
使用`Navigator.pushReplacementNamed()`打开的新路由会将当前路由替换（可以理解为当前路由出栈新路由进栈）：
```dart
...
ElevatedButton(
    onPressed(
        Navigator.pushReplacementNamed(
            context,
            '/newPage2'
        )
    ),
    child:Text('点击替换路由')
),
```
如之前newPage -> newPage1 -> newPage2,以上替换之后变为newPage -> newPage2,此时从newPage2按下返回键或调用`Navigator.pop()`可以直接返回到newPage

# 直接返回到根路由
使用`Navigator.pushAndRemoveUntil()`，表示清除当前页面之上的所有页面直到指定页面
```dart
ElevatedButton(
    onPressed(
        Navigator.pushAndRemoveUntil(
            MaterialPageRoute(
                builder:(context) => HomePage()
            ),
            (route) => route == null
        );
    ),
    child:Text('退回到主界面')
)
```
以上点击按钮可以直接退回到主界面(HomePage)