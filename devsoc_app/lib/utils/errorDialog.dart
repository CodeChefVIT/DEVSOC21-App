import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ThemeHelper t = ThemeHelper();

Future<void> showMyDialog(BuildContext context, String message) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: t.altBgColor,
        title: Text(
          'Message',
          style: t.smallTextBold,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
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
