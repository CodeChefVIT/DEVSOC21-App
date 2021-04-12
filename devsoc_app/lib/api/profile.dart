import 'dart:convert';
import 'dart:io';
import 'package:devsoc_app/constants/links.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileGet extends GetxController {
  RxBool profileLoader = true.obs;

  Future<Map> getProfile(String token) async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey("profile")) {
      print("no lol no");
      var url = Uri.parse(profileRoute);
      try {
        var response = await http.get(url, headers: {
          HttpHeaders.authorizationHeader: token,
        });
        var res = json.decode(response.body);
        print(res);
        prefs.setString("profile", response.body);
        profileLoader.value = false;
        return res;
      } catch (e) {
        return {"message": "error"};
      }
    } else {
      profileLoader.value = true;
      var res = json.decode(prefs.getString("profile"));
      profileLoader.value = false;
      return res;
    }
  }

  Future<Map> refreshProfile(String token) async {
    final prefs = await SharedPreferences.getInstance();
    var url = Uri.parse(profileRoute);
    try {
      profileLoader.value = true;
      var response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: token,
      });
      var res = json.decode(response.body);
      print(res);
      prefs.setString("profile", response.body);
      profileLoader.value = false;
      return res;
    } catch (e) {
      return {"message": "error"};
    }
  }
}
