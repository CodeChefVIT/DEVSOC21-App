import 'dart:convert';
import 'dart:ffi';

import 'package:devsoc_app/constants/links.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class Auth extends GetxController {
  String _email;
  String _token;

  String get email => _email;
  String get token => _token;

  Future<Map> login(Map<String, String> body) async {
    var url = Uri.parse(loginRoute);
    try {
      var response = await http.post(url, body: body);
      print(response.statusCode);
      print(response.body);
      var res = json.decode(response.body);
      return res;
    } catch (e) {
      return {"message": "error"};
    }
  }

  Future<Map> checkOTP(Map<String, String> body) async {
    var url = Uri.parse(otpRoute);
    try {
      var response = await http.post(url, body: body);
      print(response.statusCode);
      print(response.body);
      var res = json.decode(response.body);
      return res;
    } catch (e) {
      return {"message": "error"};
    }
  }

  RxBool authSuccess = false.obs;
}
