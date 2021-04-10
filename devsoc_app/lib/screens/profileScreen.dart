import 'dart:convert';
import 'package:devsoc_app/utils/errorDialog.dart';
import 'package:devsoc_app/api/auth.dart';
import 'package:devsoc_app/api/profile.dart';
import 'package:devsoc_app/constants/links.dart';
import 'package:devsoc_app/constants/svg.dart';
import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:devsoc_app/screens/loginScreen.dart';
import 'package:devsoc_app/utils/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ThemeHelper t = ThemeHelper();
  String token;
  ProfileGet profile = ProfileGet();
  Map profileDetails = {};
  Auth auth = Auth();
  void initState() {
    getData();
    flutterWebviewPlugin.close();
    super.initState();
  }

  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    token = extractedUserData['token'];
    profileDetails = await profile.getProfile(token);
  }

  launchWebview() {
    flutterWebviewPlugin
        .launch(masti, withLocalStorage: true, withJavascript: true)
        .whenComplete(() {
      var opbolte = token.split(" ")[1];
      print(opbolte);
      flutterWebviewPlugin.reload();
      final res = flutterWebviewPlugin.evalJavascript(
          "(function() { try { window.localStorage.setItem('authToken', $opbolte);window.location.reload() } catch (err) { return err; }  })();");
      flutterWebviewPlugin.reload();
      // Wrapped `setItem` into a func that would return some helpful info in case it throws.
      print("Eval result: $res");
    });
  }

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : showMyDialog(context, "Could not launch URL");
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: s.wHelper(6),
        ),
        child: profile.profileLoader.value
            ? Center(
                child: CustomLoader(
                  title: "Profile",
                ),
              )
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: s.hHelper(16),
                        ),
                        Container(
                          height: s.hHelper(16),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: t.secondaryBgColor,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              profileDetails["user"]["avatar"],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: s.hHelper(2),
                        ),
                        Text(
                          profileDetails["user"]["name"],
                          style: t.subheading,
                        ),
                        SizedBox(
                          height: s.hHelper(1),
                        ),
                        profileDetails["user"]["team"] == null
                            ? TextButton(
                                onPressed: () {
                                  launchWebview();
                                  // launch(devsocLink);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: t.activeColor,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: s.wHelper(5),
                                    vertical: s.hHelper(1),
                                  ),
                                  child: Text(
                                    "Create a team",
                                    style: t.smallText,
                                  ),
                                ),
                              )
                            : Text(
                                "Team " +
                                    profileDetails["user"]["team"]["name"],
                                style: t.smallTextBold,
                              ),
                        SizedBox(
                          height: s.hHelper(3),
                        ),
                        profileDetails["user"]["team"] == null
                            ? Text(
                                "Create a team to submit an Idea",
                                style: t.smallText,
                              )
                            : profileDetails["user"]["team"]["submission"] ==
                                    null
                                ? TextButton(
                                    onPressed: () {
                                      launchWebview();
                                      // launch(devsocLink);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: t.activeColor,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: s.wHelper(5),
                                        vertical: s.hHelper(1),
                                      ),
                                      child: Text(
                                        "Submit an Idea",
                                        style: t.smallText,
                                      ),
                                    ),
                                  )
                                : Column(
                                    children: [
                                      Text(
                                        "Idea " +
                                            profileDetails["user"]["team"]
                                                ["submission"]["name"],
                                        style: t.smallTextBold,
                                      ),
                                      SizedBox(
                                        height: s.hHelper(0.5),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            profileDetails["user"]["team"]
                                                ["submission"]["status"],
                                            style: t.smallText,
                                          ),
                                          SizedBox(
                                            width: s.wHelper(2),
                                          ),
                                          Icon(
                                            CupertinoIcons.check_mark,
                                            color: t.acceptColor,
                                            size: 22,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                        SizedBox(
                          height: s.hHelper(3),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: t.altBgColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: s.wHelper(5),
                            vertical: s.hHelper(2),
                          ),
                          width: s.wHelper(90),
                          child: Text(
                            profileDetails["user"]["bio"],
                            style: t.smallText,
                          ),
                        ),
                        SizedBox(
                          height: s.hHelper(3),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _launchURL(profileDetails["user"]["personal"]
                                    ["github"]);
                              },
                              child: SvgPicture.asset(
                                github,
                                height: s.hHelper(3),
                                color: t.activeColor,
                              ),
                            ),
                            SizedBox(
                              width: s.wHelper(10),
                            ),
                            GestureDetector(
                              onTap: () {
                                _launchURL(profileDetails["user"]["personal"]
                                    ["linkedin"]);
                              },
                              child: SvgPicture.asset(
                                linkedin,
                                height: s.hHelper(3),
                                color: t.activeColor,
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
                        SizedBox(
                          height: s.hHelper(8),
                        ),
                        Row(
                          children: [
                            Text(
                              "Profile",
                              style: t.heading,
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () async {
                                await auth.logout();
                                Get.to(() => LoginScreen());
                              },
                              child: Icon(
                                CupertinoIcons.square_arrow_right,
                                color: t.activeColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
