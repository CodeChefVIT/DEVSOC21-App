import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  final double duration;
  final double time;
  @override
  EventCard({@required this.duration, @required this.time});
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  final ThemeHelper t = ThemeHelper();
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Positioned(
      top: ((s.hHelper(4) + 20) * widget.time) + s.hHelper(15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: t.activeColor,
        ),
        margin: EdgeInsets.only(
          left: s.wHelper(18),
        ),
        height: (s.hHelper(4) + 20) * widget.duration,
        width: s.wHelper(70),
      ),
    );
  }
}
