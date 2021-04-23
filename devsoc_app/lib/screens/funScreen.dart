import 'dart:io';

import 'package:devsoc_app/constants/links.dart';
import 'package:devsoc_app/constants/svg.dart';
import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:devsoc_app/screens/gameAnnakill.dart';
import 'package:devsoc_app/screens/gameDevtris.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Fun extends StatefulWidget {
  @override
  _FunState createState() => _FunState();
}

class _FunState extends State<Fun> {
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light,
    );
    super.initState();
  }

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
                    devTris ? DevTris() : Container(),
                    annakill ? Annakill() : Container()
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: s.hHelper(15),
                      ),
                      Text(
                        "Games",
                        style: t.subheading,
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
                              Padding(
                                padding: EdgeInsets.only(
                                  right: s.wHelper(4),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    devtris,
                                    height: s.wHelper(15),
                                    width: s.wHelper(15),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Text(
                                '''Play\nDevTris''',
                                style: t.gameTitle,
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
                          if (Platform.isAndroid) {
                            launch(
                              "https://gamepipe.io/iframe/@ishan-khandelwalvuie/devsoc-",
                            );
                          } else {
                            setState(() {
                              annakill = true;
                              home = false;
                            });
                          }
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
                              Padding(
                                padding: EdgeInsets.only(
                                  right: s.wHelper(4),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    anna,
                                    height: s.wHelper(15),
                                    width: s.wHelper(15),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Text(
                                '''Play\nAnna Dodge''',
                                style: t.gameTitle,
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
                      SizedBox(
                        height: s.hHelper(2),
                      ),
                      Text(
                        "Filters",
                        style: t.subheading,
                      ),
                      SizedBox(
                        height: s.hHelper(2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              launch(filterLink1);
                            },
                            child: Container(
                              height: s.wHelper(40),
                              width: s.wHelper(40),
                              decoration: BoxDecoration(
                                color: t.activeColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  "Offline DEVSOC Vibes",
                                  style: t.smallTextBold,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              launch(filterLink2);
                            },
                            child: Container(
                              height: s.wHelper(40),
                              width: s.wHelper(40),
                              decoration: BoxDecoration(
                                color: t.activeColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  "DEVSOC Hologram",
                                  style: t.smallTextBold,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          Container(
            color: t.bgColor,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                !annakill
                    ? SizedBox(
                        height: s.hHelper(8),
                      )
                    : SizedBox(
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
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.portraitUp,
                              ]);
                              SystemChrome.setSystemUIOverlayStyle(
                                SystemUiOverlayStyle.light,
                              );
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
