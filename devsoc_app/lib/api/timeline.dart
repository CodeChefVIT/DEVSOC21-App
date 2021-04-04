import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class TimelineChecker extends GetxController {
  List<DateTime> timelineNodes = [
    DateTime.parse("2021-03-29 18:00:00").toLocal(),
    DateTime.parse("2021-03-29 20:30:00").toLocal(),
    DateTime.parse("2021-03-29 23:30:00").toLocal(),
    DateTime.parse("2021-03-30 02:00:00").toLocal(),
    DateTime.parse("2021-03-30 06:30:00").toLocal(),
    DateTime.parse("2021-03-30 14:30:00").toLocal(),
    DateTime.parse("2021-03-30 18:30:00").toLocal(),
    DateTime.parse("2021-03-31 02:00:00").toLocal(),
    DateTime.parse("2021-03-31 06:30:00").toLocal(),
    DateTime.parse("2021-03-31 14:30:00").toLocal(),
  ];

  Map<String, dynamic> timeline = {
    "today": 1,
    "day1": [
      {
        "start": "2021-04-05 01:00:00",
        "end": "2021-04-05 03:00:00",
        "startVal": 1,
        "duration": 2,
      },
      {
        "start": "2021-04-05 05:00:00",
        "end": "2021-04-05 06:00:00",
        "startVal": 5,
        "duration": 1,
      },
      {
        "start": "2021-04-05 10:00:00",
        "end": "2021-04-05 12:00:00",
        "startVal": 10,
        "duration": 2,
      },
      {
        "start": "2021-04-05 14:00:00",
        "end": "2021-04-05 15:30:00",
        "startVal": 14,
        "duration": 1.5,
      },
    ],
    "day2": [
      {
        "start": "2021-04-06 01:00:00",
        "end": "2021-04-06 03:00:00",
        "startVal": 1,
        "duration": 2,
      },
      {
        "start": "2021-04-06 05:00:00",
        "end": "2021-04-06 06:00:00",
        "startVal": 5,
        "duration": 1,
      },
      {
        "start": "2021-04-06 10:00:00",
        "end": "2021-04-06 12:00:00",
        "startVal": 10,
        "duration": 2,
      },
      {
        "start": "2021-04-06 14:00:00",
        "end": "2021-04-06 15:30:00",
        "startVal": 14,
        "duration": 1.5,
      },
    ],
  };

  List<Map<String, dynamic>> timelineCurrent = [];

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

  List<RxBool> timelineBool = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
  ];

  void checkTimeOne() {
    DateTime now = DateTime.now();
    if (timeline["today"] == 1) {
      timelineCurrent = timeline["day1"];
    } else if (timeline["today"] == 2) {
      timelineCurrent = timeline["day2"];
    }
    for (var i in timelineCurrent) {
      calcPerc(now, DateTime.parse(i["start"]), DateTime.parse(i["end"]));
    }
  }
}
