import 'package:devsoc_app/api/timeline.dart';
import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:devsoc_app/widgets/timelineBg.dart';
import 'package:flutter/material.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  ThemeHelper t = ThemeHelper();
  TimelineChecker tl = TimelineChecker();
  void initState() {
    tl.checkTimeOne();
    for (int i = 0; i < tl.timelineOne.length; i++) {
      print(tl.percentNodeOne[i].value);
    }
    super.initState();
  }

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
            child: TimelineBackground(tl),
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
                  "Timeline",
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
