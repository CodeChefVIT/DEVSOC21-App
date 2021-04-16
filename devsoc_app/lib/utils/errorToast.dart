import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/material.dart';

ThemeHelper t = ThemeHelper();

showErrorToast(String message, BuildContext context) {
  SizeHelper s = SizeHelper(context);
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      margin: EdgeInsets.symmetric(
        horizontal: s.wHelper(5),
        vertical: s.hHelper(1),
      ),
      backgroundColor: t.errorColor,
      elevation: 0,
      content: Container(
        child: Text(
          message,
          style: t.smallText,
        ),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
