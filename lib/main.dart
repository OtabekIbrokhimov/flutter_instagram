import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'pages/homePage.dart';
import 'pages/signIn_Page.dart';
import 'pages/signUp_Page.dart';
import 'pages/splashPage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // notification
  var initAndroidSetting = const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initIosSetting = const IOSInitializationSettings();
  var initSetting = InitializationSettings(android: initAndroidSetting, iOS: initIosSetting);
  await FlutterLocalNotificationsPlugin().initialize(initSetting);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {

    runApp(const MyApp());});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Instagramm",
      home: SplashPage(),
      routes: {
        SplashPage.id: (context) => SplashPage(),
        SignInPage.id: (context) => SignInPage(),
        SignUpPage.id: (context) => SignUpPage(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
