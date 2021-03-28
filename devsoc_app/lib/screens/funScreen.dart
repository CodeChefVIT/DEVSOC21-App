import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/material.dart';

class Fun extends StatefulWidget {
  @override
  _FunState createState() => _FunState();
}

class _FunState extends State<Fun> {
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
          children: [
            SizedBox(
              height: s.hHelper(8),
            ),
            Text(
              "Fun",
              style: t.heading,
            ),
          ],
        ),
      ),
    );
  }
}
