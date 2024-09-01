package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;
import io.flutter.Log;

import io.flutter.embedding.engine.FlutterEngine;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  private static final String TAG = "GeneratedPluginRegistrant";
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    try {
      flutterEngine.getPlugins().add(new dev.fluttercommunity.plus.device_info.DeviceInfoPlusPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin device_info_plus, dev.fluttercommunity.plus.device_info.DeviceInfoPlusPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.baidu.mapapi.base.FlutterBmfbasePlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin flutter_baidu_mapapi_base, com.baidu.mapapi.base.FlutterBmfbasePlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.baidu.bmfmap.FlutterBmfmapPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin flutter_baidu_mapapi_map, com.baidu.bmfmap.FlutterBmfmapPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.baidu.mapapi.search.FlutterBmfsearchPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin flutter_baidu_mapapi_search, com.baidu.mapapi.search.FlutterBmfsearchPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.baidu.mapapi.utils.FlutterBmfUtilsPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin flutter_baidu_mapapi_utils, com.baidu.mapapi.utils.FlutterBmfUtilsPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.baidu.flutter_bmflocation.FlutterBmflocationPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin flutter_bmflocation, com.baidu.flutter_bmflocation.FlutterBmflocationPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin flutter_plugin_android_lifecycle, io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.baseflow.permissionhandler.PermissionHandlerPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin permission_handler, com.baseflow.permissionhandler.PermissionHandlerPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new dev.fluttercommunity.plus.share.SharePlusPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin share_plus, dev.fluttercommunity.plus.share.SharePlusPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.urllauncher.UrlLauncherPlugin());
    } catch (Exception e) {
      Log.e(TAG, "Error registering plugin url_launcher_android, io.flutter.plugins.urllauncher.UrlLauncherPlugin", e);
    }
  }
}