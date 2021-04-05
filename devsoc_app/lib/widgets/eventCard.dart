import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final double duration;
  final double time;
  final double percent;
  final String title;
  EventCard({
    @required this.duration,
    @required this.time,
    this.percent,
    @required this.title,
  });
  final ThemeHelper t = ThemeHelper();
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Positioned(
      top: ((s.hHelper(4) + 20) * time) + s.hHelper(15),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: t.secondaryBgColor,
            ),
            margin: EdgeInsets.only(
              left: s.wHelper(18),
            ),
            height: (s.hHelper(4) + 20) * duration,
            width: s.wHelper(70),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: t.activeColor,
            ),
            margin: EdgeInsets.only(
              left: s.wHelper(18),
            ),
            height: (s.hHelper(4) + 20) * duration,
            width: s.wHelper(70) * percent / 100,
          ),
          Container(
            margin: EdgeInsets.only(
              left: s.wHelper(18),
            ),
            height: (s.hHelper(4) + 20) * duration,
            width: s.wHelper(70),
            padding: EdgeInsets.symmetric(
              horizontal: s.wHelper(2),
              vertical: s.hHelper(1),
            ),
            child: Text(
              title,
              style: t.smallTextBold,
            ),
          ),
        ],
      ),
    );
  }
}
