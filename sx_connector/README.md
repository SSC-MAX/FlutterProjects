# sx_connector

A new Flutter project.

# 响应流程
C1位置/电池状态发生变化时：
1. 向服务器发送请求，触发`NetworkHelper/statusUpdate`，以`StatusR`发送
2. 服务器返回成功状态，并向C2发送C1更新的消息
3. C2接收到C1更新后的状态，以`StatusR`接收，重新渲染页面

# 与服务器的交互
`状态`与服务器的交互通过WebSocket完成
通过`R`中的状态码`code`来区分不同的更新，100表示全状态更新
websocket连接成功时，服务器返回`R`，状态码置0，否则置1
每次发送消息成功时，接收方都需要回复一条`R`，状态码置0，否则置1

# 文件配置
在Windows系统上运行时，为了避免在Android系统上运行时打包时间过长，下载了gradle文件到本地，使用本地文件
在`android/gradle/wrapper/gradle-wrapper.properties`中注释了`distributionUrl`