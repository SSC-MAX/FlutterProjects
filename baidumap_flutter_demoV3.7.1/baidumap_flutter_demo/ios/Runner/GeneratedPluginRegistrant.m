//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<device_info_plus/FPPDeviceInfoPlusPlugin.h>)
#import <device_info_plus/FPPDeviceInfoPlusPlugin.h>
#else
@import device_info_plus;
#endif

#if __has_include(<flutter_baidu_mapapi_base/FlutterBmfbasePlugin.h>)
#import <flutter_baidu_mapapi_base/FlutterBmfbasePlugin.h>
#else
@import flutter_baidu_mapapi_base;
#endif

#if __has_include(<flutter_baidu_mapapi_map/FlutterBmfmapPlugin.h>)
#import <flutter_baidu_mapapi_map/FlutterBmfmapPlugin.h>
#else
@import flutter_baidu_mapapi_map;
#endif

#if __has_include(<flutter_baidu_mapapi_search/FlutterBmfsearchPlugin.h>)
#import <flutter_baidu_mapapi_search/FlutterBmfsearchPlugin.h>
#else
@import flutter_baidu_mapapi_search;
#endif

#if __has_include(<flutter_baidu_mapapi_utils/FlutterBmfUtilsPlugin.h>)
#import <flutter_baidu_mapapi_utils/FlutterBmfUtilsPlugin.h>
#else
@import flutter_baidu_mapapi_utils;
#endif

#if __has_include(<flutter_bmflocation/FlutterBmflocationPlugin.h>)
#import <flutter_bmflocation/FlutterBmflocationPlugin.h>
#else
@import flutter_bmflocation;
#endif

#if __has_include(<permission_handler/PermissionHandlerPlugin.h>)
#import <permission_handler/PermissionHandlerPlugin.h>
#else
@import permission_handler;
#endif

#if __has_include(<share_plus/FLTSharePlusPlugin.h>)
#import <share_plus/FLTSharePlusPlugin.h>
#else
@import share_plus;
#endif

#if __has_include(<url_launcher_ios/URLLauncherPlugin.h>)
#import <url_launcher_ios/URLLauncherPlugin.h>
#else
@import url_launcher_ios;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FPPDeviceInfoPlusPlugin registerWithRegistrar:[registry registrarForPlugin:@"FPPDeviceInfoPlusPlugin"]];
  [FlutterBmfbasePlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterBmfbasePlugin"]];
  [FlutterBmfmapPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterBmfmapPlugin"]];
  [FlutterBmfsearchPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterBmfsearchPlugin"]];
  [FlutterBmfUtilsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterBmfUtilsPlugin"]];
  [FlutterBmflocationPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterBmflocationPlugin"]];
  [PermissionHandlerPlugin registerWithRegistrar:[registry registrarForPlugin:@"PermissionHandlerPlugin"]];
  [FLTSharePlusPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharePlusPlugin"]];
  [URLLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"URLLauncherPlugin"]];
}

@end
