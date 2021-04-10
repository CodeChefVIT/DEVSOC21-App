import 'dart:convert';
import 'package:devsoc_app/constants/links.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class Announcements extends GetxController {
  RxBool announcementsLoader = true.obs;

  Future<Map> getAnnouncements() async {
    var url = Uri.parse(announcementRoute);
    try {
      announcementsLoader.value = true;
      var response = await http.get(
        url,
      );
      var res = json.decode(response.body);
      print(res);
      announcementsLoader.value = false;
      return res;
    } catch (e) {
      return {"message": "error"};
    }
  }
}
