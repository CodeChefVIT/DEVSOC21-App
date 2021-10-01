import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  final String title;
  @override
  CustomLoader({required this.title});
  final ThemeHelper t = new ThemeHelper();
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: s.hHelper(8),
        ),
        Text(
          title,
          style: t.heading,
        ),
        Expanded(
          child: Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(t.activeColor),
            ),
          ),
        ),
      ],
    );
  }
}
