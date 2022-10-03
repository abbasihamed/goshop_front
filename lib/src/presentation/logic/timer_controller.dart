import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  int _minutes = 2;
  int _seconds = 0;

  Timer? _timer;

  int get minutes => _minutes;
  int get seconds => _seconds;

  Future startTimer() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_minutes != 0 && _seconds == 0) {
        _minutes--;
        _seconds = 59;
      }
      if (_minutes == 0 && _seconds == 0) {
        timer.cancel();
      }
      _seconds--;
      update();
    });
  }

  stopTimer() {
    _minutes = 2;
    _seconds = 0;
    _timer!.cancel();
    update();
  }
}
