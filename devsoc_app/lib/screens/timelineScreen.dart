import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/material.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  ThemeHelper t = ThemeHelper();

  void initState() {
    DateTime now = DateTime.now();
    // print(((now.difference(one).inSeconds) /
    //         (one.difference(two).inSeconds) *
    //         100)
    //     .abs());
    calcPerc(now);
    super.initState();
  }

  void calcPerc(DateTime now) {
    if (now.compareTo(one) == -1) {
      print(((0) / (one.difference(two).inSeconds) * 100).abs());
    } else {
      print(((now.difference(one).inSeconds) /
              (one.difference(two).inSeconds) *
              100)
          .abs());
    }
  }

  DateTime one = DateTime.parse("2021-04-04 23:00:00");
  DateTime two = DateTime.parse("2021-04-04 24:10:00");
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: s.wHelper(6),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: s.hHelper(14),
              ),
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
