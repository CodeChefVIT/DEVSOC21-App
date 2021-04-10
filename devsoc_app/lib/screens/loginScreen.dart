import 'package:devsoc_app/api/auth.dart';
import 'package:devsoc_app/constants/svg.dart';
import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:devsoc_app/screens/otpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:devsoc_app/utils/errorDialog.dart';

class LoginScreen extends StatelessWidget {
  final ThemeHelper t = ThemeHelper();
  final TextEditingController email = TextEditingController();
  final Auth a = Auth();
  _submit(BuildContext context) async {
    Map<String, String> body = {"email": email.text.toString()};
    var map = await a.login(body);
    if (map["success"] == true) {
      Get.to(() => OTPScreen(
            email: email.text.toString(),
          ));
    } else {
      await showMyDialog(context, map["message"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: s.hHelper(100),
                width: s.wHelper(100),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.0, 0.1),
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      t.bgColor,
                      t.secondaryBgColor,
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: s.wHelper(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: s.hHelper(12),
                    ),
                    Container(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        devsoc,
                        color: t.activeColor,
                        height: s.hHelper(25),
                      ),
                    ),
                    SizedBox(
                      height: s.hHelper(3),
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'DEVSOC',
                          style: t.title,
                          children: <TextSpan>[
                            TextSpan(
                              text: '\'21',
                              style: t.titleColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: s.hHelper(8),
                    ),
                    Text(
                      "Sign in",
                      style: t.heading,
                    ),
                    SizedBox(
                      height: s.hHelper(3),
                    ),
                    TextFormField(
                      style: t.smallTextColor,
                      cursorColor: t.activeColor,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: email,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: s.wHelper(5)),
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
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: t.activeColor,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          gapPadding: 1,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: t.activeColor,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          gapPadding: 1,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: t.errorColor,
                            width: 1,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          gapPadding: 1,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: t.activeColor,
                            width: 1,
                          ),
                        ),
                        hintText: "email",
                        hintStyle: t.smallTextColor,
                      ),
                    ),
                    SizedBox(
                      height: s.hHelper(6),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          _submit(context);
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
                              Text(
                                "Continue",
                                style: t.smallTextBold,
                              ),
                              SizedBox(
                                width: s.wHelper(2),
                              ),
                              Icon(
                                CupertinoIcons.arrow_right,
                                color: t.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
