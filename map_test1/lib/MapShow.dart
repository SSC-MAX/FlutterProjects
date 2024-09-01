import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_baidu_mapapi_base/src/map/bmf_models.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_search/flutter_baidu_mapapi_search.dart';


class WeatherMapPage extends StatefulWidget{
  const WeatherMapPage({super.key});

  @override
  State<WeatherMapPage> createState() => WeatherMapState();

}

class WeatherMapState extends State<WeatherMapPage>{
  BMFMapController? dituController;
  @override
  void initState() {
    super.initState();
  }

  /// 创建完成回调
  void onBMFMapCreated(BMFMapController controller) {
    dituController = controller;

    /// 地图加载回调
    dituController?.setMapDidLoadCallback(callback: () {
      print('mapDidLoad-地图加载完成!!!');
    });
  }
  /// 设置地图参数
  BMFMapOptions initMapOptions() {
    BMFMapOptions mapOptions = BMFMapOptions(
      center: BMFCoordinate(39.917215, 116.380341),
      zoomLevel: 12,
      changeCenterWithDoubleTouchPointEnabled:true,
      gesturesEnabled:true ,
      scrollEnabled:true ,
      zoomEnabled: true ,
      rotateEnabled :true,
      compassPosition :BMFPoint(0,0) ,
      showMapScaleBar:false ,
      maxZoomLevel:15,
      minZoomLevel:8,
//      mapType: BMFMapType.Satellite
    );
    return mapOptions;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return  Scaffold(
        backgroundColor: Color.fromRGBO(240, 243, 250, 1),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Container(
                width: screenSize.width,
                height: screenSize.height,
                child: BMFMapWidget(
                  onBMFMapCreated: (controller) {
                    onBMFMapCreated(controller);
                  },
                  mapOptions: initMapOptions(),
                ),
              ),
              Positioned(
                top: 20,
                left: 5,
                child: IconButton(
                  onPressed: (){
                    print('===Hello===');
                  },
                  icon:const Icon(Icons.navigate_before,color: Color.fromRGBO(0, 0, 0, 0.3),size: 40,),
                ),
              )

            ],
          ),
        )
    );
  }
}