import 'package:devsoc_app/api/auth.dart';
import 'package:devsoc_app/constants/svg.dart';
import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:devsoc_app/screens/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ThemeHelper t = ThemeHelper();
  Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: s.wHelper(6),
      ),
      child: Stack(
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
                  child: Center(
                    child: Text(
                      "SS",
                      style: t.subheading,
                    ),
                  ),
                ),
                SizedBox(
                  height: s.hHelper(2),
                ),
                Text(
                  "Siddharth Singh",
                  style: t.subheading,
                ),
                SizedBox(
                  height: s.hHelper(1),
                ),
                Text(
                  "Team " + "DEVSOC",
                  style: t.smallTextBold,
                ),
                SizedBox(
                  height: s.hHelper(3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Idea Accepted",
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
                    "Hello, I am an App Developer from CodeChef-VIT and this is my dummy bio. Hello, I am an App Developer from CodeChef-VIT and this is my dummy bio. Hello, I am an App Developer from CodeChef-VIT and this is my dummy bio.",
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
                      onTap: () {},
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
                      onTap: () {},
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
    );
  }
}
