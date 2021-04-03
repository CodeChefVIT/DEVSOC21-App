import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  Map<String, dynamic> form = {
    "title": "Pizza Form",
    "questions": [
      {
        "question": "Email",
        "type": "textfield",
        "value": null,
      },
      {
        "question": "Name",
        "type": "textfield",
        "value": null,
      },
      {
        "question": "T Shirt Size",
        "type": "dropdown",
        "dropdownOptions": [
          "S",
          "M",
          "L",
          "XL",
        ],
        "value": null,
      },
      {
        "question": "Tech Stack",
        "type": "checkbox",
        "checkboxOptions": [
          "Frontend Web",
          "App",
          "Backend",
          "Design",
        ],
        "value": null,
      },
    ],
  };
  ThemeHelper t = ThemeHelper();
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: s.wHelper(6),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: s.hHelper(14),
              ),
            ],
          ),
          Container(
            color: t.bgColor,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: s.hHelper(8),
                ),
                Text(
                  "Forms",
                  style: t.heading,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
