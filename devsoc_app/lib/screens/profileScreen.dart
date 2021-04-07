import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                  "Profile",
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
