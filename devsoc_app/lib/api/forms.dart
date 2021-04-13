import 'dart:convert';
import 'dart:io';
import 'package:devsoc_app/constants/links.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FormGet extends GetxController {
  RxBool formLoader = true.obs;

  Future<Map> getForm() async {
    var url = Uri.parse(formRoute);
    try {
      formLoader.value = true;
      var response = await http.get(
        url,
      );
      var res = json.decode(response.body);
      formLoader.value = false;
      return res;
    } catch (e) {
      return {"message": "error"};
    }
  }

  Future<Map> sendForm(Map data) async {
    var prefs = await SharedPreferences.getInstance();
    var url = Uri.parse(submitFormRoute);
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    var _token = extractedUserData['token'].toString();
    Map<dynamic, dynamic> send = {};
    send["questions"] = data["questions"];
    String body = json.encode(send);
    try {
      formLoader.value = true;
      var response = await http.post(
        url,
        body: body,
        headers: {
          HttpHeaders.authorizationHeader: _token,
          HttpHeaders.contentTypeHeader: 'application/json;charset=UTF-8',
        },
      );
      var res = json.decode(response.body);
      formLoader.value = false;
      res["statusCode"] = response.statusCode.toString();
      return res;
    } catch (e) {
      print(e);
      return {"message": "error"};
    }
  }
}
