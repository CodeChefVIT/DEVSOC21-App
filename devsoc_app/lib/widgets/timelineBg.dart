import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:devsoc_app/widgets/eventCard.dart';
import 'package:flutter/material.dart';

class TimelineBackground extends StatelessWidget {
  final ThemeHelper t = ThemeHelper();
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: s.hHelper(14),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "12 AM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "1 AM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "2 AM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "3 AM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "4 AM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "5 AM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "6 AM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "7 AM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "8 AM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "9 AM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "10 AM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "11 AM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "12 PM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "1 PM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "2 PM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "3 PM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "4 PM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "5 PM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "6 PM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "7 PM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "8 PM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "9 PM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "10 PM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
            Container(
              height: 20,
              child: Row(
                children: [
                  Text(
                    "11 PM",
                    style: t.smallTextGrey,
                  ),
                  Spacer(),
                  Container(
                    width: s.wHelper(70),
                    height: 0.5,
                    color: t.inactiveColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.hHelper(4),
            ),
          ],
        ),
        EventCard(duration: 2, time: 7),
        EventCard(duration: 1, time: 10),
        EventCard(duration: 3, time: 16),
      ],
    );
  }
}
