import 'package:devsoc_app/api/auth.dart';
import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:devsoc_app/screens/landingScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String currentText;
  TextEditingController textEditingController = TextEditingController();
  ThemeHelper t = ThemeHelper();
  final Auth a = Auth();
  _submit(BuildContext context) async {
    Map<String, String> body = {"otp": currentText.toString()};
    var map = await a.checkOTP(body);
    print(map);
    if (map["success"] == true) {
      Get.to(() => LandingScreen());
    } else if (map["statusCode"] == "500" || map["statusCode"] == "402") {
      await _showMyDialog(context, map["message"]);
      Get.back();
    } else {
      await _showMyDialog(context, map["message"]);
    }
  }

  Future<void> _showMyDialog(BuildContext context, String message) async {
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

  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Scaffold(
      backgroundColor: t.bgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: s.wHelper(6),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                      "Enter OTP",
                      style: t.heading,
                    ),
                    SizedBox(
                      height: s.hHelper(3),
                    ),
                    Text(
                      "Enter the 6 character OTP you recieved in your mail.",
                      style: t.subheading,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: s.hHelper(20),
              ),
              PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                textStyle: t.subheading,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(14),
                  fieldHeight: s.hHelper(6),
                  fieldWidth: s.wHelper(10),
                  selectedColor: t.activeColor,
                  selectedFillColor: t.altBgColor,
                  activeFillColor: t.altBgColor,
                  activeColor: t.altBgColor,
                  inactiveColor: t.altBgColor,
                  inactiveFillColor: t.altBgColor,
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: t.bgColor,
                cursorColor: t.activeColor,
                enableActiveFill: true,
                controller: textEditingController,
                onCompleted: (v) {
                  _submit(context);
                },
                onChanged: (value) {
                  print(value);
                  setState(() {
                    currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  return true;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
