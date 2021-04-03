import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  ThemeHelper t = new ThemeHelper();
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
        "dropdownOptions": <String>[
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

  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: s.wHelper(6),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: s.hHelper(14),
                ),
                Text(
                  form["title"],
                  style: t.subheading,
                ),
                SizedBox(
                  height: s.hHelper(2),
                ),
                for (var question in form["questions"])
                  question["type"] == "textfield"
                      ? Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: s.hHelper(2)),
                          child: TextFormField(
                            style: t.smallTextColor,
                            cursorColor: t.activeColor,
                            onChanged: (value) {
                              question["value"] = value;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: s.wHelper(5)),
                              border: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                borderSide: BorderSide(
                                  color: t.activeColor,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                  color: t.activeColor,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                  color: t.activeColor,
                                  width: 1,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                  color: t.activeColor,
                                  width: 1,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                  color: t.activeColor,
                                  width: 1,
                                ),
                              ),
                              hintText: question["question"],
                              hintStyle: t.smallTextColor,
                            ),
                          ),
                        )
                      : question["type"] == "dropdown"
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  question["question"],
                                  style: t.smallText,
                                ),
                                SizedBox(
                                  height: s.hHelper(1),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: t.activeColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: s.wHelper(5)),
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(bottom: s.hHelper(2)),
                                  child: DropdownButton(
                                    items: question["dropdownOptions"]
                                        .map<DropdownMenuItem>((value) {
                                      return new DropdownMenuItem(
                                        value: value,
                                        child: Container(
                                          width: s.wHelper(70),
                                          child: new Text(
                                            value,
                                            style: t.smallTextColor,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        question["value"] = value;
                                      });
                                    },
                                    underline: Container(),
                                    value: question["value"] ??
                                        question["dropdownOptions"][0],
                                  ),
                                ),
                              ],
                            )
                          : question["type"] == "checkbox"
                              ? Container()
                              : Container(),
              ],
            ),
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
