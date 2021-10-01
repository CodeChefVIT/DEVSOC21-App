import 'package:flutter/material.dart';

class SizeHelper {
  SizeHelper(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
  }

  late double height;
  late double width;

  hHelper(double percent) {
    return height * percent / 100;
  }

  wHelper(double percent) {
    return width * percent / 100;
  }
}
