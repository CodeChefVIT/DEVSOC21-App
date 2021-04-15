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
        color: t.altBgColor,
      ),
      // padding: EdgeInsets.all(20),
      child: Container(
        width: s.wHelper(80),
        height: s.hHelper(65),
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://ishan-001.github.io/DEVSOC-game/',
        ),
      ),
    );
  }
}
