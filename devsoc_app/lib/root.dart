import 'package:devsoc_app/api/auth.dart';
import 'package:devsoc_app/screens/landingScreen.dart';
import 'package:devsoc_app/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

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
    super.initState();
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
