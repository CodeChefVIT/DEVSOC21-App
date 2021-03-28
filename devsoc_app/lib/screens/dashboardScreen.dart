import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ThemeHelper t = ThemeHelper();
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: s.wHelper(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: s.hHelper(8),
            ),
            Text(
              "Home",
              style: GoogleFonts.montserrat(
                color: t.white,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: s.hHelper(2),
            ),
            Text(
              "Announcements",
              style: GoogleFonts.montserrat(
                color: t.white,
                fontSize: 22,
                fontWeight: FontWeight.w400,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: s.hHelper(1),
            ),
            Container(
              height: s.hHelper(15),
              child: DottedBorder(
                dashPattern: [20, 25],
                strokeWidth: 2,
                borderType: BorderType.RRect,
                radius: Radius.circular(30),
                color: t.activeColor,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: double.maxFinite,
                  child: Center(
                    child: Text(
                      'No Announcements yet!',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: t.activeColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: s.hHelper(2),
            ),
            Text(
              "Timeline",
              style: GoogleFonts.montserrat(
                color: t.white,
                fontSize: 22,
                fontWeight: FontWeight.w400,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: s.hHelper(1),
            ),
          ],
        ),
      ),
    );
  }
}
