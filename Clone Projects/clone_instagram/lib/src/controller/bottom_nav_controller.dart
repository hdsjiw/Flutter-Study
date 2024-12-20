import 'dart:io';

import 'package:clone_instagram/src/components/message_popup.dart';
import 'package:clone_instagram/src/pages/upload.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => Upload());
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    // hasGesture 추가
    pageIndex(value);
    if (!hasGesture) return; // 제스처가 없는 경우 종료
    if (bottomHistory.last != value) {
      bottomHistory.add(value);
      print(bottomHistory);
    }
    // if (!bottomHistory.contains(value)) {
    //   bottomHistory.remove(value);
    // }
    // bottomHistory.add(value);
    // print(bottomHistory);
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      print('exit');
      showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup(
          message: '종료하시겠습니까?',
          okCallback: () {
            exit(0);
          },
          cancalCallback: Get.back,
          title: '시스템',
        ),
      );
      return true;
    } else {
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      print(bottomHistory);
      return false;
    }
  }
}
