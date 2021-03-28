import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeHelper {
  Color bgColor = Color(0xff00133d);
  Color activeColor = Color(0xff3b78ff);
  Color inactiveColor = Color(0xff636363);
  Color white = Color(0xffe8ecff);

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

  TextStyle smallTextColor = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Color(0xff3b78ff),
  );
}
