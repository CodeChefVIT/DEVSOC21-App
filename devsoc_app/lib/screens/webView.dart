import 'package:devsoc_app/constants/links.dart';
import 'package:devsoc_app/helpers/size.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DevsocWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Container(
      height: s.hHelper(100),
      width: s.wHelper(100),
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: devsocLink,
      ),
    );
  }
}
