import 'package:devsoc_app/api/auth.dart';
import 'package:devsoc_app/constants/links.dart';
import 'package:devsoc_app/constants/svg.dart';
import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:devsoc_app/screens/otpScreen.dart';
import 'package:devsoc_app/utils/errorToast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ThemeHelper t = ThemeHelper();
  bool loader = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final Auth a = Auth();
  _submit() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      _isButtonDisabled = true;
      setState(() {
        loader = true;
      });
      Map<String, String> body = {"email": email.text.toString()};
      var map = await (a.login(body) as Future<Map<dynamic, dynamic>>);
      setState(() {
        loader = false;
      });
      _isButtonDisabled = false;
      if (map["success"] == true) {
        Get.to(
          () => OTPScreen(
            email: email.text.toString(),
          ),
        );
      } else {
        showErrorToast(map["message"], context);
        _isButtonDisabled = false;
      }
    }
  }

  String? validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern as String);
    if (!regex.hasMatch(value) || value == null)
      return 'Enter a valid email address';
    else
      return null;
  }

  void initState() {
    _isButtonDisabled = false;
    super.initState();
  }

  bool _isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: t.bgColor,
        body: Stack(
          children: [
            Container(
              height: s.hHelper(100),
              width: s.wHelper(100),
              child: SvgPicture.asset(
                bg,
                fit: BoxFit.fill,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
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
                    Hero(
                      tag: "devsoc",
                      child: Container(
                        width: double.infinity,
                        child: SvgPicture.asset(
                          devsoc,
                          height: s.hHelper(18),
                        ),
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
                      "Sign in",
                      style: t.subheading,
                    ),
                    SizedBox(
                      height: s.hHelper(1.5),
                    ),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        style: t.smallText,
                        cursorColor: t.activeColor,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          } else {
                            return validateEmail(value);
                          }
                        },
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: s.wHelper(5)),
                          prefixIcon: Icon(
                            CupertinoIcons.mail_solid,
                            color: t.activeColor,
                          ),
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
                          hintText: "Email",
                          hintStyle: t.smallTextColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: s.hHelper(4),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          if (!_isButtonDisabled) {
                            HapticFeedback.lightImpact();
                            _submit();
                          }
                        },
                        child: Container(
                          height: s.hHelper(6),
                          width: s.wHelper(40),
                          decoration: BoxDecoration(
                            color: t.activeColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: loader
                              ? Center(
                                  child: CircularProgressIndicator(
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            t.white),
                                  ),
                                )
                              : Row(
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
                    SizedBox(
                      height: s.hHelper(4),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        "Haven't registered yet?",
                        style: t.smallTextBold,
                      ),
                    ),
                    SizedBox(
                      height: s.hHelper(2),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          launch(devsocLink);
                        },
                        child: Container(
                          height: s.hHelper(6),
                          width: s.wHelper(50),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: t.bgColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: t.secondaryBgColor,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            "Register now!",
                            style: t.smallTextBold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
