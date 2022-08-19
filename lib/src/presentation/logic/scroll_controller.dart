import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListScrollController extends GetxController {
  ScrollController scrollController = ScrollController();

  void goNext() {
    scrollController.animateTo(
      scrollController.offset + 300,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    update();
  }

  void goBack() {
    scrollController.animateTo(
      scrollController.offset - 300,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    update();
  }
}
