import 'package:devsoc_app/api/auth.dart';
import 'package:devsoc_app/constants/svg.dart';
import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:devsoc_app/screens/landingScreen.dart';
import 'package:devsoc_app/utils/errorToast.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  final String email;
  OTPScreen({@required this.email});
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String currentText;
  TextEditingController textEditingController = TextEditingController();
  ThemeHelper t = ThemeHelper();
  final Auth a = Auth();
  _submit() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String fcmToken;
    await messaging.getToken().then((value) {
      fcmToken = value;
    });
    Map<String, String> body = {
      "otp": currentText.toString().toLowerCase(),
      "email": widget.email,
      "fcmToken": fcmToken,
    };
    var map = await a.checkOTP(body);
    print(map);
    if (map["success"] == true) {
      Get.to(() => LandingScreen());
    } else if (map["statusCode"] == "500" || map["statusCode"] == "402") {
      showErrorToast("OTP Expired", context);
    } else {
      showErrorToast(map["message"], context);
    }
  }

  bool _isButtonDisabled = false;

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text(
              'Going back',
              style: t.smallTextBold,
            ),
            content: new Text(
              'Are you sure you want to go back?',
              style: t.smallText,
            ),
            backgroundColor: t.altBgColor,
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    "NO",
                    style: t.smallTextColor,
                  ),
                ),
              ),
              new GestureDetector(
                onTap: () {
                  Get.back();
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    "YES",
                    style: t.smallTextColor,
                  ),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  _resendOTP() async {
    FocusScope.of(context).unfocus();
    _isButtonDisabled = true;
    Map<String, String> body = {"email": widget.email};
    var map = await a.login(body);
    if (map["success"] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          margin: EdgeInsets.symmetric(
            horizontal: SizeHelper(context).wHelper(5),
            vertical: SizeHelper(context).hHelper(1),
          ),
          backgroundColor: t.activeColor,
          elevation: 0,
          content: Container(
            child: Text(
              "OTP Sent",
              style: t.smallText,
            ),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      showErrorToast(map["message"], context);
      _isButtonDisabled = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: t.bgColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: s.hHelper(100),
                width: s.wHelper(100),
                child: SvgPicture.asset(
                  bg,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: s.wHelper(6),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: s.hHelper(8),
                          ),
                          Container(
                            width: double.infinity,
                            child: SvgPicture.asset(
                              devsoc,
                              height: s.hHelper(18),
                            ),
                          ),
                          SizedBox(
                            height: s.hHelper(2),
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'DEVSOC',
                                style: t.devsocTitle,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '\'21',
                                    style: t.devsocTitleColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: s.hHelper(4),
                          ),
                          Text(
                            "Enter OTP",
                            style: t.heading,
                          ),
                          SizedBox(
                            height: s.hHelper(2),
                          ),
                          Text(
                            "Enter the 6 character OTP you recieved in your mail.",
                            style: t.subheading,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: s.hHelper(6),
                    ),
                    PinCodeTextField(
                      inputFormatters: [UpperCaseTextFormatter()],
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
                        FocusScope.of(context).unfocus();
                        _submit();
                      },
                      useHapticFeedback: true,
                      hapticFeedbackTypes: HapticFeedbackTypes.medium,
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
                    SizedBox(
                      height: s.hHelper(10),
                    ),
                    TextButton(
                      onPressed: () {
                        if (!_isButtonDisabled) {
                          _resendOTP();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: s.wHelper(5),
                          vertical: s.hHelper(1),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: t.secondaryBgColor,
                        ),
                        child: Text(
                          "Resend OTP",
                          style: t.smallTextBold,
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

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text?.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
