class StatusR{
  late int code;
  late int batteryLevel;
  late String batteryStatus;
  late double longitude;
  late double latitude;
  late String author;
  late String msg;

  StatusR({required this.code, required this.batteryLevel, required this.batteryStatus, required this.longitude, required this.latitude, required this.author, required this.msg});

  StatusR.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        batteryLevel = json['batteryLevel'],
        batteryStatus = json['batteryStatus'],
        longitude = json['longitude'],
        latitude = json['latitude'],
        author = json['author'],
        msg = json['msg'];

  Map<String, dynamic> toJson() => {
    'code':code,
    'batteryLevel': batteryLevel,
    'batteryStatus': batteryStatus,
    'longitude':longitude,
    'latitude':latitude,
    'author': author,
    'msg':msg
  };

  static StatusR error(){
    return StatusR(code: 0, batteryLevel:-1, batteryStatus: "", longitude: -1, latitude: -1, author: "", msg: "出现错误");
  }

  @override
  String toString() {
    return 'code : $code\nbatteryLevel : $batteryLevel\nbatteryStatus : $batteryStatus\nlongitude : $longitude\nlatitude : $latitude\nauthor : $author\nmsg : $msg';
  }

}