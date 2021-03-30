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

  void checkTime() {
    DateTime current = DateTime.now().toLocal();
    print(current);
    for (int i = 0; i < timelineNodes.length; i++) {
      if (current.compareTo(timelineNodes[i]) > 0) {
        timelineBool[i].value = true;
      }
    }
  }
}
