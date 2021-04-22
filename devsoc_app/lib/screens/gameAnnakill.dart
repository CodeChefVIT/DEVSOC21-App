import 'dart:io';

import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Annakill extends StatefulWidget {
  @override
  _AnnakillState createState() => _AnnakillState();
}

class _AnnakillState extends State<Annakill> {
  final ThemeHelper t = ThemeHelper();
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      alignment: Alignment.center,
      child: Container(
        width: s.wHelper(60),
        height: s.hHelper(65),
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl:
              'https://gamepipe.io/iframe/@ishan-khandelwalvuie/devsoc-',
        ),
      ),
    );
  }
}
