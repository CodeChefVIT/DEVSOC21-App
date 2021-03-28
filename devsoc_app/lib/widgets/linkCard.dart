import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LinkCard extends StatelessWidget {
  final String title;
  final String imgPath;
  final Color bgColor;
  LinkCard({@required this.title, @required this.imgPath, @required this.bgColor});
  final ThemeHelper t = ThemeHelper();
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Container(
      padding: EdgeInsets.all(12),
      width: s.wHelper(42),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: s.wHelper(6),
            height: s.hHelper(3),
            child: SvgPicture.asset(imgPath),
          ),
          SizedBox(
            width: s.wHelper(3),
          ),
          Center(
            child: Text(
              title,
              style: t.smallText,
            ),
          ),
        ],
      ),
    );
  }
}
