import 'dart:convert';
import 'dart:io';
import 'package:devsoc_app/api/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:devsoc_app/constants/links.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class Auth extends GetxController {
  String _email;
  String _token;

  String get email => _email;
  String get token => _token;
  bool get isReg {
    return token != null;
  }

  ProfileGet p = ProfileGet();

  Future<Map> login(Map<String, String> body) async {
    var url = Uri.parse(loginRoute);
    try {
      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        _email = body["email"];
        print(_email);
      }
      var res = json.decode(response.body);
      return res;
    } catch (e) {
      return {"message": "error"};
    }
  }

  Future<Map> checkOTP(Map<String, String> body) async {
    var url = Uri.parse(otpRoute);
    try {
      var response = await http.post(
        url,
        body: jsonEncode(body),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );
      var res = json.decode(response.body);
      print(response.statusCode);
      print(res);
      res["statusCode"] = response.statusCode.toString();
      if (response.statusCode == 200) {
        _token = "Bearer " + res["token"];
        print(_token);
        authSuccess.value = true;
        final prefs = await SharedPreferences.getInstance();
        final _prefsData = jsonEncode({
          'token': _token,
          'email': _email,
        });
        await prefs.setString('userData', _prefsData);
      }
      return res;
    } catch (e) {
      print(e);
      return {"message": "Error"};
    }
  }

  Future<void> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      authSuccess.value = false;
      return authSuccess.value;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    _token = extractedUserData['token'];
    _email = extractedUserData['email'];
    authSuccess.value = true;
    return authSuccess.value;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    var token = extractedUserData['token'];
    try {
      var _ = await http.post(
        Uri.parse(logoutRoute),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: token,
        },
      );
      print(_.body);
      await prefs.clear();
      authSuccess.value = false;
      _token = null;
      _email = null;
    } catch (e) {
      print(e);
    }
  }

  RxBool authSuccess = false.obs;
}
