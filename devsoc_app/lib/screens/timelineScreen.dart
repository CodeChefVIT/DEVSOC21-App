import 'package:devsoc_app/api/timeline.dart';
import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:devsoc_app/widgets/timelineBg.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  ThemeHelper t = ThemeHelper();
  TimelineChecker tl = TimelineChecker();
  void initState() {
    tl.checkDay();
    tl.checkTimeOne();
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
          Padding(
            padding: EdgeInsets.only(top: s.hHelper(15)),
            child: SingleChildScrollView(
              child: TimelineBackground(tl),
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
                  "Timeline",
                  style: t.heading,
                ),
                SizedBox(
                  height: s.hHelper(2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        tl.current.value = 1;
                        tl.checkTimeOne();
                      },
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            color: tl.current.value == 1
                                ? t.activeColor
                                : t.altBgColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: s.hHelper(2),
                            horizontal: s.wHelper(8),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "30",
                                style: tl.current.value == 1
                                    ? t.subheading
                                    : t.subheadingColor,
                              ),
                              Text(
                                "APR",
                                style: tl.current.value == 1
                                    ? t.smallText
                                    : t.smallTextColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        tl.current.value = 2;
                        tl.checkTimeOne();
                      },
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            color: tl.current.value == 2
                                ? t.activeColor
                                : t.altBgColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: s.hHelper(2),
                            horizontal: s.wHelper(8),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "01",
                                style: tl.current.value == 2
                                    ? t.subheading
                                    : t.subheadingColor,
                              ),
                              Text(
                                "MAY",
                                style: tl.current.value == 2
                                    ? t.smallText
                                    : t.smallTextColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        tl.current.value = 3;
                        tl.checkTimeOne();
                      },
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            color: tl.current.value == 3
                                ? t.activeColor
                                : t.altBgColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: s.hHelper(2),
                            horizontal: s.wHelper(8),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "02",
                                style: tl.current.value == 3
                                    ? t.subheading
                                    : t.subheadingColor,
                              ),
                              Text(
                                "MAY",
                                style: tl.current.value == 3
                                    ? t.smallText
                                    : t.smallTextColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: s.hHelper(2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
