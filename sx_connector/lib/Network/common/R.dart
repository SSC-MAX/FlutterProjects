class R {
  final int? code;
  final dynamic data;
  final String? msg;

  R({required this.code, required this.data, required this.msg});

  R.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        data = json['data'],
        msg = json['msg'];

  Map<String, dynamic> toJson() => {
        'code': code,
        'data': data,
        'msg': msg,
      };

  @override
  String toString() {
    // TODO: implement toString
    return "{输出CommonResponse:\ncode: $code,\ndata:$data,\nmsg: $msg}";
  }
}
