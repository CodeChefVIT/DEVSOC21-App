import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeHelper {
  Color bgColor = Color(0xff000000);
  Color secondaryBgColor = Color(0xff0026e3);
  Color activeColor = Color(0xff147ffd);
  Color inactiveColor = Color(0xff636363);
  Color white = Color(0xffe8ecff);
  Color doneColor = Color(0xff02f0bc);

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

  TextStyle smallTextGrey = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xff636363),
  );
}
