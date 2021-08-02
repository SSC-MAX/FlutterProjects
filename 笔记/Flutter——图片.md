# 一 相关属性
* BoxFit.fill:全图显示，会被拉伸至充满父容器
* BoxFit.contain: 全图显示，原比例，可能会有空隙
* BoxFit.cover: 若自身无法充满，则通过拉伸、裁剪以充满整个容器
* alignment: Alighment.xxx，表示图片放置的位置

# 二 加载远程图片
直接使用Image.netWork引入
```dart
child: Container(
    child:Image.netWork(
        'img_url',
        alignment:Alignment.bottomRight)
)
```
以上将引入的远程网络图片放置在右下角

# 三 加载本地图片
加载本地图片分为两步：
* 在项目根目录中新建images文件夹，在其下新建2.0x,3.0x文件夹，分别将图片放入其中
* 在pubspec.yaml中新建assets并分别引入图片
pubspec.yaml:
```yaml
assets:
     - images/a.jpeg
     - images/2.0x/a.jpeg
     - images/3.0x/a.jpeg
```
然后就可以正常加载图片：
```dart
child: Container(
    child: Image.asset(
        'images/a.jpeg',
        fit: BoxFit.cover,
    ),
    width: 300,
    height: 300,
)
```
设置后可能会出现第一次热重载后报错无法显示的bug,重新运行可以解决

# 四 圆形图片
## 1.使用container的radius
设置包裹图片的container的radius来实现圆形图片
```dart
child: Container(
    width: 300,
    height: 300,
    decoration: BoxDecoration(
        color: Colors.yellow,
        //圆形图片的处理
        borderRadius: BorderRadius.circular(150),
        image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
        )
    ),
),
```
## 2.使用ClipOval
```dart
 child: Container(
    child: ClipOval(
    child: Image.network(
        imageUrl,
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ),
    ),
),
```
ClipOval实际上是处理成椭圆，对于正方形图片它可以直接处理成圆，但是对于一般图片则不行。此时可以通过设置其长宽相等，然后设置fit为cover来实现将任何图片都化为圆形。