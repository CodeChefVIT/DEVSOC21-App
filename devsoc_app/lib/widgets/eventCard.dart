import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EventCard extends StatelessWidget {
  final double duration;
  final double time;
  final double percent;
  final String title;
  final String details;
  final String imgPath;
  EventCard({
    @required this.duration,
    @required this.time,
    this.percent,
    @required this.title,
    @required this.details,
    @required this.imgPath,
  });
  final ThemeHelper t = ThemeHelper();
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Positioned(
      top: ((s.hHelper(4) + 20) * time) + s.hHelper(15.2),
      child: GestureDetector(
        onTap: () async {
          if (details != null) {
            await showMyDialog(context, details, imgPath);
          }
        },
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
              height: (s.hHelper(4) + 20) * duration - s.hHelper(0.2),
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
              height: (s.hHelper(4) + 20) * duration - s.hHelper(0.2),
              width: s.wHelper(70) * percent / 100,
            ),
            Container(
              margin: EdgeInsets.only(
                left: s.wHelper(18),
              ),
              height: (s.hHelper(4) + 20) * duration - s.hHelper(0.2),
              width: s.wHelper(70),
              padding: EdgeInsets.symmetric(
                horizontal: s.wHelper(2),
                vertical: s.hHelper(1),
              ),
              child: Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: s.hHelper(1.5),
                  fontWeight: FontWeight.w600,
                  color: Color(0xffe8ecff),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showMyDialog(
      BuildContext context, String message, String imgPath) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: t.altBgColor,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                imgPath != null
                    ? Image.network(
                        imgPath,
                      )
                    : Container(),
                Text(
                  message,
                  style: t.smallText,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Close',
                style: t.smallTextColor,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
