import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:timelines/timelines.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ThemeHelper t = ThemeHelper();
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: s.wHelper(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: s.hHelper(8),
            ),
            Text(
              "Home",
              style: t.heading,
            ),
            SizedBox(
              height: s.hHelper(2),
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
            TimelineTile(
              nodeAlign: TimelineNodeAlign.basic,
              oppositeContents: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '6:00 PM',
                  style: t.smallText,
                ),
              ),
              contents: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hack Begins',
                  style: t.smallText,
                ),
              ),
              node: TimelineNode(
                indicator: DotIndicator(
                  color: t.activeColor,
                ),
                endConnector: SolidLineConnector(
                  color: t.activeColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
