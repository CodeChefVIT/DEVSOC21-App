import 'dart:convert';
import 'package:devsoc_app/constants/links.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

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
}
