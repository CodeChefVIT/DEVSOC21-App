import 'package:devsoc_app/api/timeline.dart';
import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:timelines/timelines.dart';

class TimeLine extends StatefulWidget {
  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  final ThemeHelper t = ThemeHelper();
  final TimelineChecker tl = TimelineChecker();
  void initState() {
    tl.checkTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "28th April, 2021",
          style: t.date,
        ),
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '\n6:00 PM\nHack Begins',
                style: t.smallText,
              ),
            ),
          ),
          node: TimelineNode(
            indicator: Obx(
              () {
                return DotIndicator(
                  color: tl.timelineBool[0].value ? t.doneColor : t.activeColor,
                );
              },
            ),
            endConnector: Obx(
              () {
                return SolidLineConnector(
                  color: tl.timelineBool[1].value ? t.doneColor : t.activeColor,
                );
              },
            ),
          ),
        ),
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '\n8:30 PM\nFool Stack Hours',
                style: t.smallText,
              ),
            ),
          ),
          node: TimelineNode(
            indicator: Obx(
              () {
                return DotIndicator(
                  color: tl.timelineBool[1].value ? t.doneColor : t.activeColor,
                );
              },
            ),
            startConnector: Obx(
              () {
                return SolidLineConnector(
                  color: tl.timelineBool[1].value ? t.doneColor : t.activeColor,
                );
              },
            ),
            endConnector: Obx(
              () {
                return SolidLineConnector(
                  color: tl.timelineBool[2].value ? t.doneColor : t.activeColor,
                );
              },
            ),
          ),
        ),
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '\n11:30 PM\nTalk by Mr Jugal Bhatt',
                style: t.smallText,
              ),
            ),
          ),
          node: TimelineNode(
            indicator: Obx(
              () {
                return DotIndicator(
                  color: tl.timelineBool[2].value ? t.doneColor : t.activeColor,
                );
              },
            ),
            startConnector: Obx(
              () {
                return SolidLineConnector(
                  color: tl.timelineBool[2].value ? t.doneColor : t.activeColor,
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: s.hHelper(2),
        ),
        Text(
          "29th April, 2021",
          style: t.date,
        ),
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '\n2:00 AM\nSimping Hours',
                style: t.smallText,
              ),
            ),
          ),
          node: TimelineNode(
            indicator: Obx(
              () {
                return DotIndicator(
                  color: tl.timelineBool[3].value ? t.doneColor : t.activeColor,
                );
              },
            ),
            endConnector: Obx(
              () {
                return SolidLineConnector(
                  color: tl.timelineBool[4].value ? t.doneColor : t.activeColor,
                );
              },
            ),
          ),
        ),
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '\n6:30 AM\nPunjabi Literally Assosciation',
                style: t.smallText,
              ),
            ),
          ),
          node: TimelineNode(
            indicator: Obx(
              () {
                return DotIndicator(
                  color: tl.timelineBool[4].value ? t.doneColor : t.activeColor,
                );
              },
            ),
            startConnector: Obx(
              () {
                return SolidLineConnector(
                  color: tl.timelineBool[4].value ? t.doneColor : t.activeColor,
                );
              },
            ),
            endConnector: Obx(
              () {
                return SolidLineConnector(
                  color: tl.timelineBool[5].value ? t.doneColor : t.activeColor,
                );
              },
            ),
          ),
        ),
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '\n2:30 PM\nReview 1',
                style: t.smallText,
              ),
            ),
          ),
          node: TimelineNode(
            indicator: Obx(
              () {
                return DotIndicator(
                  color: tl.timelineBool[5].value ? t.doneColor : t.activeColor,
                );
              },
            ),
            endConnector: Obx(
              () {
                return SolidLineConnector(
                  color: tl.timelineBool[6].value ? t.doneColor : t.activeColor,
                );
              },
            ),
            startConnector: Obx(
              () {
                return SolidLineConnector(
                  color: tl.timelineBool[5].value ? t.doneColor : t.activeColor,
                );
              },
            ),
          ),
        ),
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '\n6:30 PM\nReview 2',
                style: t.smallText,
              ),
            ),
          ),
          node: TimelineNode(
            indicator: Obx(
              () {
                return DotIndicator(
                  color: tl.timelineBool[6].value ? t.doneColor : t.activeColor,
                );
              },
            ),
            startConnector: Obx(
              () {
                return SolidLineConnector(
                  color: tl.timelineBool[6].value ? t.doneColor : t.activeColor,
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: s.hHelper(2),
        ),
        Text(
          "30th April, 2021",
          style: t.date,
        ),
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '\n2:00 AM\nSimping Hours',
                style: t.smallText,
              ),
            ),
          ),
          node: TimelineNode(
            indicator: Obx(
              () {
                return DotIndicator(
                  color: tl.timelineBool[7].value ? t.doneColor : t.activeColor,
                );
              },
            ),
            endConnector: Obx(
              () {
                return SolidLineConnector(
                  color: tl.timelineBool[8].value ? t.doneColor : t.activeColor,
                );
              },
            ),
          ),
        ),
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '\n6:30 AM\nFinal Submission',
                style: t.smallText,
              ),
            ),
          ),
          node: TimelineNode(
            indicator: Obx(
              () {
                return DotIndicator(
                  color: tl.timelineBool[8].value ? t.doneColor : t.activeColor,
                );
              },
            ),
            startConnector: Obx(
              () {
                return SolidLineConnector(
                  color: tl.timelineBool[8].value ? t.doneColor : t.activeColor,
                );
              },
            ),
            endConnector: Obx(
              () {
                return SolidLineConnector(
                  color: tl.timelineBool[9].value ? t.doneColor : t.activeColor,
                );
              },
            ),
          ),
        ),
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '\n2:30 PM\nResults Announced',
                style: t.smallText,
              ),
            ),
          ),
          node: TimelineNode(
            indicator: Obx(
              () {
                return DotIndicator(
                  color: tl.timelineBool[9].value ? t.doneColor : t.activeColor,
                );
              },
            ),
            startConnector: Obx(
              () {
                return SolidLineConnector(
                  color: tl.timelineBool[9].value ? t.doneColor : t.activeColor,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
