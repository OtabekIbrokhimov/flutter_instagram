import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/servises/pref_servise.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
class Utils {
  // FireSnackBar
  static fireSnackBar(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey.shade400.withOpacity(0.9),
        content: Text(msg, style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.center,),
        duration: const Duration(milliseconds: 2500),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        shape: const StadiumBorder(),
      ),
    );
  }

  static String getMonthDayYear(String date) {
    final DateTime now = DateTime.parse(date);
    final String formatted = DateFormat.yMMMMd().format(now);
    return formatted;
  }
  // static Future<bool> CommonDialog
  static Future<Map<String, String>> deviceParams() async{
    Map <String, String>params = {};
    var deviceInfo = DeviceInfoPlugin();
    String fcmToken = (await Prefs.load(StorageKeys.TOKEN))!;
    if(Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      params.addAll({
        'device_id': iosDeviceInfo.identifierForVendor!,
        'device_type': 'I',
        'device_token': fcmToken,
      });
    }
    if(Platform.isAndroid){
      var androidDeviceInfo = await deviceInfo.androidInfo;
      params.addAll({
        'device_id': androidDeviceInfo.androidId!,
        'device_type': 'A',
        'device_token': fcmToken,
      });
    }
    return params;
  }
  static Future <void> showLocalNotification(Map<String,dynamic>message)async{
    String title = message['title'];
    String body = message['body'];

    if(Platform.isAndroid){
      title = message['notification']['title'];
      body = message['notification']['body'];
    }
    var android  = const AndroidNotificationDetails("channelId", 'channelName',channelDescription: 'channelDescription');
    var iOS = const IOSNotificationDetails();
    var platform = NotificationDetails(android: android,iOS: iOS);

    int id = Random().nextInt((pow(2, 31)-1).toInt());
    await FlutterLocalNotificationsPlugin().show(id, title, body, platform);
  }
}