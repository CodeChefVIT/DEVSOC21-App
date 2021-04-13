import 'package:devsoc_app/api/forms.dart';
import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:devsoc_app/screens/formSubmitted.dart';
import 'package:devsoc_app/utils/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  ThemeHelper t = new ThemeHelper();
  FormGet f = FormGet();
  Map<String, dynamic> res = {};
  Map<dynamic, dynamic> resSubmit = {};
  Map<dynamic, dynamic> form = {};

  Map<String, bool> checkBoxMap = {};
  final _formKey = GlobalKey<FormState>();

  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    res = await f.getForm();
    form = res["form"];
    for (var questions in form["questions"]) {
      if (questions["type"] == "checkbox") {
        for (var i in questions["checkboxOptions"]) {
          checkBoxMap[i] = false;
        }
      }
      if (questions["type"] == "dropdown") {
        questions["value"] = questions["dropdownOptions"][0];
      }
    }
  }

  void _submit() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      for (var questions in form["questions"]) {
        if (questions["type"] == "checkbox") {
          for (var i in questions["checkboxOptions"]) {
            if (checkBoxMap[i] == true) {
              questions["value"].add(i);
            }
          }
        }
      }
      resSubmit = await f.sendForm(form);
      print(resSubmit);
      Get.to(() => FormSubmitted());
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: s.wHelper(6),
        ),
        child: f.formLoader.value
            ? Center(
                child: CustomLoader(
                  title: "Forms",
                ),
              )
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: Form(
                      key: _formKey,
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
                                    margin:
                                        EdgeInsets.only(bottom: s.hHelper(2)),
                                    child: TextFormField(
                                      style: t.smallTextColor,
                                      cursorColor: t.activeColor,
                                      onChanged: (value) {
                                        question["value"] = value;
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                          borderSide: BorderSide(
                                            color: t.activeColor,
                                            width: 1,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          gapPadding: 1,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                          borderSide: BorderSide(
                                            color: t.activeColor,
                                            width: 1,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          gapPadding: 1,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                          borderSide: BorderSide(
                                            color: t.errorColor,
                                            width: 1,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          gapPadding: 1,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              border: Border.all(
                                                  color: t.activeColor),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12)),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: s.wHelper(5)),
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(
                                                bottom: s.hHelper(2)),
                                            child: DropdownButton(
                                              items: question["dropdownOptions"]
                                                  .map<DropdownMenuItem>(
                                                      (value) {
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
                                                  question["dropdownOptions"]
                                                      [0],
                                            ),
                                          ),
                                        ],
                                      )
                                    : question["type"] == "checkbox"
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                question["question"],
                                                style: t.smallText,
                                              ),
                                              SizedBox(
                                                height: s.hHelper(1),
                                              ),
                                              for (var i in question[
                                                  "checkboxOptions"])
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: t.activeColor,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  margin: EdgeInsets.symmetric(
                                                    vertical: s.hHelper(0.8),
                                                  ),
                                                  child: CheckboxListTile(
                                                    title: Text(
                                                      i,
                                                      style: t.smallTextColor,
                                                    ),
                                                    checkColor: t.altBgColor,
                                                    activeColor: t.activeColor,
                                                    value: checkBoxMap[i],
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        checkBoxMap[i] =
                                                            newValue;
                                                        print(checkBoxMap);
                                                      });
                                                    },
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading, //  <-- leading Checkbox
                                                  ),
                                                )
                                            ],
                                          )
                                        : Container(),
                          SizedBox(
                            height: s.hHelper(2),
                          ),
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {
                                _submit();
                              },
                              child: Container(
                                height: s.hHelper(8),
                                width: s.wHelper(40),
                                decoration: BoxDecoration(
                                  color: t.activeColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.checkmark_alt,
                                      color: t.white,
                                    ),
                                    SizedBox(
                                      width: s.wHelper(2),
                                    ),
                                    Text(
                                      "Submit",
                                      style: t.smallTextBold,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: s.hHelper(2),
                          ),
                        ],
                      ),
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
      ),
    );
  }
}
