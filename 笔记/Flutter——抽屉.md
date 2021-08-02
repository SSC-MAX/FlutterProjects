# Drawer的使用
在`Scaffold`中嵌套`drawer`，会自动在顶部导航栏生成一个菜单图标，点击会在左侧出现一个侧边栏，此侧边栏也可以通过在页面左边缘滑动弹出（如需在页面右侧弹出，应使用`endDrawer`
```dart
return Scaffold(
    drawer:Drawer(
        child:Column(
            //内部自行定义
        )
    )
)
```
# UserAccountsDrawerHeader
它是一个高度封装的在`drawer`中使用的组件，会自动排版用户头像，用户名，用户邮箱，其他用户头像:
```dart
    return Scaffold(
        drawer:Drawer(
            child:Column(
                children:<Widget>[
                    Expanded(
                        child:UserAccountsDrawerHeader(
                            accountName:Text('用户姓名'),
                            accountEmail:Text('用户邮箱'),
                            currentAccountPicture:CircleAvater(    //用户头像
                                backgroundImage:NetWorkImage('...')
                            ),
                            decoration:BoxDecoration(      //其他用户头像
                                image:NetWorkImage('...'),
                                fit:BoxFit.cover
                            ),
                            otherAccountsPictures:<Widget>[
                                Image.network('...'),
                                Image.network('...')
                            ]
                        )
                    )
                ]
            )
        )
    )
```