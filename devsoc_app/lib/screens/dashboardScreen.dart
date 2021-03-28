import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:devsoc_app/widgets/timeline.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ThemeHelper t = ThemeHelper();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: s.hHelper(14),
                ),
                Text(
                  "Announcements",
                  style: t.subheading,
                ),
                SizedBox(
                  height: s.hHelper(2),
                ),
                Container(
                  height: s.hHelper(15),
                  child: DottedBorder(
                    dashPattern: [20, 25],
                    strokeWidth: 2,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(30),
                    color: t.activeColor,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: double.maxFinite,
                      child: Center(
                        child: Text(
                          'No Announcements yet!',
                          style: t.smallTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: s.hHelper(3),
                ),
                Text(
                  "Timeline",
                  style: t.subheading,
                ),
                SizedBox(
                  height: s.hHelper(1),
                ),
                TimeLine(),
                SizedBox(
                  height: s.hHelper(3),
                ),
                Text(
                  "Links",
                  style: t.subheading,
                ),
                SizedBox(
                  height: s.hHelper(2),
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
                Text(
                  "Home",
                  style: t.heading,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
