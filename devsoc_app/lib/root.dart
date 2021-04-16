import 'package:devsoc_app/api/auth.dart';
import 'package:devsoc_app/screens/landingScreen.dart';
import 'package:devsoc_app/screens/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'utils/loader.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light,
    );
    _fcm();
    super.initState();
  }

  _fcm() async {
    await Firebase.initializeApp();
    FirebaseMessaging.onMessage.listen((event) {
      print(event.data);
    });

    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessageOpenedApp.listen((event) {});

    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  Auth auth = Auth();
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        canvasColor: Color(0xff00133d),
        unselectedWidgetColor: Color(0xff147ffd),
      ),
      home: auth.isReg
          ? LandingScreen()
          : FutureBuilder(
              future: auth.tryAutoLogin(),
              builder: (context, res) {
                if (res.connectionState == ConnectionState.waiting) {
                  return Scaffold(
                    backgroundColor: Color(0xff000000),
                    body: CustomLoader(
                      title: "",
                    ),
                  );
                } else {
                  if (auth.authSuccess.value) {
                    return LandingScreen();
                  } else {
                    return LoginScreen();
                  }
                }
              }),
      debugShowCheckedModeBanner: false,
    );
  }
}
