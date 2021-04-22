import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeHelper {
  Color bgColor = Color(0xff000000);
  Color altBgColor = Color(0xff1a1a1a);
  Color secondaryBgColor = Color(0xff0026e3);
  Color activeColor = Color(0xff147ffd);
  Color inactiveColor = Color(0xff636363);
  Color white = Color(0xffe8ecff);
  Color errorColor = Color(0xffff1f5a);
  Color acceptColor = Color(0xff1fff8b);

  TextStyle title = GoogleFonts.montserrat(
    color: Color(0xffe8ecff),
    fontSize: 36,
    fontWeight: FontWeight.w700,
    letterSpacing: 2,
  );

  TextStyle devsocTitle = GoogleFonts.montserrat(
    color: Color(0xffe8ecff),
    fontSize: 32,
    fontWeight: FontWeight.w500,
    letterSpacing: 2,
  );

  TextStyle devsocTitleColor = GoogleFonts.montserrat(
    color: Color(0xff147ffd),
    fontSize: 32,
    fontWeight: FontWeight.w500,
    letterSpacing: 2,
  );

  TextStyle announcementTitle = GoogleFonts.montserrat(
    color: Color(0xffe8ecff),
    fontSize: 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.1,
  );

  TextStyle titleColor = GoogleFonts.montserrat(
    color: Color(0xff147ffd),
    fontSize: 36,
    fontWeight: FontWeight.w700,
    letterSpacing: 2,
  );

  TextStyle heading = GoogleFonts.montserrat(
    color: Color(0xffe8ecff),
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: 2,
  );

  TextStyle subheading = GoogleFonts.montserrat(
    color: Color(0xffe8ecff),
    fontSize: 22,
    fontWeight: FontWeight.w400,
    letterSpacing: 1,
  );

  TextStyle subheadingColor = GoogleFonts.montserrat(
    color: Color(0xff147ffd),
    fontSize: 22,
    fontWeight: FontWeight.w400,
    letterSpacing: 1,
  );

  TextStyle date = GoogleFonts.montserrat(
    color: Color(0xffe8ecff),
    fontSize: 18,
    fontWeight: FontWeight.w300,
    letterSpacing: 1,
  );

  TextStyle smallTextColor = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xff147ffd),
  );

  TextStyle smallText = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Color(0xffe8ecff),
  );

  TextStyle smallTextBold = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xffe8ecff),
  );

  TextStyle smallTextGrey = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xff636363),
  );

  TextStyle gameTitle = GoogleFonts.montserrat(
    color: Color(0xffe8ecff),
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 1,
  );
}
