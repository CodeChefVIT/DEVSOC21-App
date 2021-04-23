import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:devsoc_app/screens/landingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FormSubmitted extends StatefulWidget {
  @override
  _FormSubmittedState createState() => _FormSubmittedState();
}

class _FormSubmittedState extends State<FormSubmitted> {
  final ThemeHelper t = ThemeHelper();
  void initState() {
    HapticFeedback.heavyImpact();
    new Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => LandingScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.checkmark_seal_fill,
              color: t.activeColor,
              size: 36,
            ),
            SizedBox(
              height: s.hHelper(2),
            ),
            Text(
              "Form submitted successfully!",
              style: t.smallTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
