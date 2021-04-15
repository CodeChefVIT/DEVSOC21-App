import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:devsoc_app/screens/gameDevtris.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Fun extends StatefulWidget {
  @override
  _FunState createState() => _FunState();
}

class _FunState extends State<Fun> {
  ThemeHelper t = ThemeHelper();
  bool devTris = false;
  bool annakill = false;
  bool home = true;
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: s.wHelper(6),
      ),
      child: Stack(
        children: [
          !home
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: s.hHelper(15),
                    ),
                    DevTris()
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: s.hHelper(15),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          devTris = true;
                          home = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: t.activeColor,
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: s.hHelper(1),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: s.wHelper(4),
                        ),
                        alignment: Alignment.centerLeft,
                        height: s.hHelper(10),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Text(
                              '''Play\nDevTris''',
                              style: t.subheading,
                            ),
                            Spacer(),
                            Icon(
                              CupertinoIcons.chevron_right,
                              color: t.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          annakill = true;
                          home = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: t.activeColor,
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: s.hHelper(1),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: s.wHelper(4),
                        ),
                        alignment: Alignment.centerLeft,
                        height: s.hHelper(10),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Text(
                              '''Play\nAnna Kill''',
                              style: t.subheading,
                            ),
                            Spacer(),
                            Icon(
                              CupertinoIcons.chevron_right,
                              color: t.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.all(
                    //       Radius.circular(10),
                    //     ),
                    //     color: t.altBgColor,
                    //   ),
                    //   padding: EdgeInsets.all(20),
                    //   child: Container(
                    //     width: s.wHelper(100),
                    //     height: s.hHelper(60),
                    //     child: WebView(
                    //       javascriptMode: JavascriptMode.unrestricted,
                    //       initialUrl: 'https://devtris.codechefvit.com',
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
          Container(
            color: t.bgColor,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: s.hHelper(8),
                ),
                Row(
                  children: [
                    Text(
                      "Fun",
                      style: t.heading,
                    ),
                    Spacer(),
                    !home
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                home = true;
                                devTris = false;
                                annakill = false;
                              });
                            },
                            child: Icon(
                              CupertinoIcons.clear,
                              color: t.errorColor,
                            ),
                          )
                        : Container()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
