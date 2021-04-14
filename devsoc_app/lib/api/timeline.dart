import 'dart:convert';
import 'package:devsoc_app/constants/links.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimelineChecker extends GetxController {
  Future<void> getTimeline() async {
    try {
      var response = await Dio().get(timelineRoute);
      Map<dynamic, dynamic> res = json.decode(response.toString());
      timeline = res["data"];
      print(timeline);
    } catch (e) {
      print(e);
    }
  }

  RxBool loader = true.obs;

  Map<dynamic, dynamic> timeline = {};

  List<dynamic> timelineCurrent = [];

  void calcPerc(DateTime now, DateTime one, DateTime two) {
    if (now.compareTo(one) == -1) {
      percentNodeOne.add(0.0.obs);
    } else if (now.compareTo(two) == 1) {
      percentNodeOne.add(100.0.obs);
    } else {
      percentNodeOne.add(((now.difference(one).inSeconds) /
              (one.difference(two).inSeconds) *
              100)
          .abs()
          .obs);
    }
  }

  List<RxDouble> percentNodeOne = [];

  RxInt current = 0.obs;

  Future checkDay() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("timeline")) {
      loader.value = true;
      await getTimeline();
      prefs.setString("timeline", jsonEncode(timeline));
      current.value = timeline["today"];
      loader.value = false;
    } else {
      loader.value = true;
      timeline = json.decode(prefs.getString("timeline"));
      current.value = timeline["today"];
      loader.value = false;
    }
  }

  Future refreshTimeline() async {
    final prefs = await SharedPreferences.getInstance();
    loader.value = true;
    await getTimeline();
    prefs.setString("timeline", jsonEncode(timeline));
    current.value = timeline["today"];
    loader.value = false;
  }

  void checkTimeOne() async {
    DateTime now = DateTime.now();

    percentNodeOne.clear();
    if (current.value == 1) {
      timelineCurrent = timeline["day1"];
    } else if (current.value == 2) {
      timelineCurrent = timeline["day2"];
    } else if (current.value == 3) {
      timelineCurrent = timeline["day3"];
    }
    for (var i in timelineCurrent) {
      calcPerc(now, DateTime.parse(i["start"]), DateTime.parse(i["end"]));
    }
  }
}
