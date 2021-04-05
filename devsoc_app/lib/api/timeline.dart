import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class TimelineChecker extends GetxController {
  Map<String, dynamic> timeline = {
    "today": 2,
    "day1": [
      {
        "title": "Talk on Blockchain",
        "start": "2021-04-05 01:00:00",
        "end": "2021-04-05 04:00:00",
        "startVal": 1,
        "duration": 3,
      },
      {
        "title": "Sad Boy Hours",
        "start": "2021-04-05 05:00:00",
        "end": "2021-04-05 06:00:00",
        "startVal": 5,
        "duration": 1,
      },
      {
        "title": "Review 1",
        "start": "2021-04-05 10:00:00",
        "end": "2021-04-05 12:00:00",
        "startVal": 10,
        "duration": 2,
      },
      {
        "title": "CodeChef Hours",
        "start": "2021-04-05 14:00:00",
        "end": "2021-04-05 15:30:00",
        "startVal": 14,
        "duration": 1.5,
      },
      {
        "title": "TL T",
        "start": "2021-04-05 22:00:00",
        "end": "2021-04-05 23:00:00",
        "startVal": 22,
        "duration": 1,
      },
    ],
    "day2": [
      {
        "title": "Talk on Blockchain by Pranjal",
        "start": "2021-04-06 01:00:00",
        "end": "2021-04-06 02:00:00",
        "startVal": 1,
        "duration": 1,
      },
      {
        "title": "Naseeb life",
        "start": "2021-04-06 05:00:00",
        "end": "2021-04-06 06:00:00",
        "startVal": 5,
        "duration": 1,
      },
      {
        "title": "Technical Meet",
        "start": "2021-04-06 10:00:00",
        "end": "2021-04-06 12:00:00",
        "startVal": 10,
        "duration": 2,
      },
      {
        "title": "TL T",
        "start": "2021-04-06 14:00:00",
        "end": "2021-04-06 15:30:00",
        "startVal": 14,
        "duration": 1.5,
      },
    ],
    "day3": [
      {
        "title": "Talk on NODE",
        "start": "2021-04-07 01:00:00",
        "end": "2021-04-07 03:00:00",
        "startVal": 1,
        "duration": 2,
      },
      {
        "title": "NO THIS IS EPIC",
        "start": "2021-04-07 09:00:00",
        "end": "2021-04-07 10:00:00",
        "startVal": 9,
        "duration": 1,
      },
      {
        "title": "Review 2",
        "start": "2021-04-07 11:00:00",
        "end": "2021-04-07 12:00:00",
        "startVal": 11,
        "duration": 1,
      },
      {
        "title": "Something",
        "start": "2021-04-07 14:00:00",
        "end": "2021-04-07 15:30:00",
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

  RxInt current = 0.obs;

  void checkDay() {
    current.value = timeline["today"];
  }

  void checkTimeOne() {
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
