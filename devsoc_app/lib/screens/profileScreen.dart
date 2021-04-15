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
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ThemeHelper t = ThemeHelper();
  String token;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  ProfileGet profile = ProfileGet();
  Map profileDetails = {};
  Auth auth = Auth();
  void initState() {
    getData();
    super.initState();
  }

  void _onRefresh() async {
    final prefs = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    token = extractedUserData['token'];
    profileDetails = await profile.refreshProfile(token);
    _refreshController.refreshCompleted();
  }

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    token = extractedUserData['token'];
    profileDetails = await profile.getProfile(token);
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
                  SmartRefresher(
                    enablePullDown: true,
                    header: CustomHeader(
                      builder: (BuildContext context, _) {
                        return Center(
                          child: CupertinoActivityIndicator(),
                        );
                      },
                    ),
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    child: SingleChildScrollView(
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
                                    launch(devsocLink);
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
                              : RichText(
                                  text: TextSpan(
                                    text: 'Team ',
                                    style: t.smallTextBold,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: profileDetails["user"]["team"]
                                            ["name"],
                                        style: t.smallText,
                                      ),
                                    ],
                                  ),
                                ),
                          SizedBox(
                            height: s.hHelper(3),
                          ),
                          profileDetails["user"]["team"] == null
                              ? Text(
                                  "Create a team to submit an Idea",
                                  style: t.smallText,
                                )
                              : profileDetails["user"]["team"]["submission"]
                                          ["name"] ==
                                      null
                                  ? TextButton(
                                      onPressed: () {
                                        launch(devsocLink);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                        RichText(
                                          text: TextSpan(
                                            text: 'Idea ',
                                            style: t.smallTextBold,
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: profileDetails["user"]
                                                            ["team"]
                                                        ["submission"]["name"]
                                                    .toString(),
                                                style: t.smallText,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: s.hHelper(2),
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
                                              IconData(
                                                profileDetails["user"]["team"]
                                                    ["submission"]["icon"],
                                                fontFamily:
                                                    CupertinoIcons.iconFont,
                                                fontPackage: CupertinoIcons
                                                    .iconFontPackage,
                                              ),
                                              color: Color(
                                                  profileDetails["user"]["team"]
                                                          ["submission"]
                                                      ["iconColor"]),
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
                                profile.profileLoader.value = true;
                                await auth.logout();
                                profile.profileLoader.value = false;
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
