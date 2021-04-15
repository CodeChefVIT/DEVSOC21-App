import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DevTris extends StatelessWidget {
  final ThemeHelper t = ThemeHelper();
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
      padding: EdgeInsets.all(20),
      child: Container(
        width: s.wHelper(100),
        height: s.hHelper(60),
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://devtris.codechefvit.com',
        ),
      ),
    );
  }
}
