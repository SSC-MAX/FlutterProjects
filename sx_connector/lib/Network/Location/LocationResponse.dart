class LocationResponse {
  final int? code;
  final AddressComponent? data;
  final String? msg;

  LocationResponse({required this.code, required this.data, required this.msg});

  LocationResponse.fromJSON(Map<String, dynamic> json)
      : code = json['code'],
        data = AddressComponent.fromJson(json['data']),
        msg = json['msg'];

  Map<String, dynamic> toJson() => {'code': code, 'data': data, 'msg': msg};
}

class AddressComponent {
  final String? city;
  final String? province;
  final String? adcode;
  final String? district;
  final String? towncode;
  final String? country;
  final String? township;

  AddressComponent(
      {required this.city,
      required this.province,
      required this.adcode,
      required this.district,
      required this.towncode,
      required this.country,
      required this.township});

  AddressComponent.fromJson(Map<String, dynamic> json)
      : city = json['city'],
        province = json['province'],
        adcode = json['adcode'],
        district = json['district'],
        towncode = json['towncode'],
        country = json['country'],
        township = json['township'];

  Map<String, dynamic> toJson() => {
        'city': city,
        'province': province,
        'adcode': adcode,
        'district': district,
        'towncode': towncode,
        'country': country,
        'township': township
      };

  @override
  String toString() {
    return "{\ncity:$city,\nprovince:$province,\nadcode:$adcode,\ndistrict:$district,\ntowncode:$towncode,\ncountry:$country,\ntownship:$township\n}";
  }
}

// "city": "合肥市",
//         "province": "安徽省",
//         "adcode": "340102",
//         "district": "瑶海区",
//         "towncode": "340102011000",
//         "country": "中国",
//         "township": "长淮街道"