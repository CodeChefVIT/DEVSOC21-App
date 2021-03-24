import 'package:flutter/material.dart';

class SizeHelper {
  SizeHelper(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
  }

  double height;
  double width;

  hHelper(double percent) {
    return height * percent / 100;
  }

  wHelper(double percent) {
    return width * percent / 100;
  }
}
