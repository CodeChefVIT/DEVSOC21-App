import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class TimeLine extends StatelessWidget {
  final ThemeHelper t = ThemeHelper();
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
            indicator: DotIndicator(
              color: t.activeColor,
            ),
            endConnector: SolidLineConnector(
              color: t.activeColor,
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
            indicator: DotIndicator(
              color: t.activeColor,
            ),
            startConnector: SolidLineConnector(
              color: t.activeColor,
            ),
            endConnector: SolidLineConnector(
              color: t.activeColor,
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
            indicator: DotIndicator(
              color: t.activeColor,
            ),
            startConnector: SolidLineConnector(
              color: t.activeColor,
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
            indicator: DotIndicator(
              color: t.activeColor,
            ),
            endConnector: SolidLineConnector(
              color: t.activeColor,
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
            indicator: DotIndicator(
              color: t.activeColor,
            ),
            startConnector: SolidLineConnector(
              color: t.activeColor,
            ),
            endConnector: SolidLineConnector(
              color: t.activeColor,
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
            indicator: DotIndicator(
              color: t.activeColor,
            ),
            endConnector: SolidLineConnector(
              color: t.activeColor,
            ),
            startConnector: SolidLineConnector(
              color: t.activeColor,
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
            indicator: DotIndicator(
              color: t.activeColor,
            ),
            startConnector: SolidLineConnector(
              color: t.activeColor,
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
            indicator: DotIndicator(
              color: t.activeColor,
            ),
            endConnector: SolidLineConnector(
              color: t.activeColor,
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
            indicator: DotIndicator(
              color: t.activeColor,
            ),
            startConnector: SolidLineConnector(
              color: t.activeColor,
            ),
            endConnector: SolidLineConnector(
              color: t.activeColor,
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
            indicator: DotIndicator(
              color: t.activeColor,
            ),
            startConnector: SolidLineConnector(
              color: t.activeColor,
            ),
          ),
        ),
      ],
    );
  }
}
