import 'package:elabd_tms_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/attendence/attendence_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/task_page/task_screen.dart';

class SelectIndexController extends GetxController {
  //RxList pages = [].obs;
  RxString name = "".obs;

  var selectedIndex = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  getSelectedView() {
    print(selectedIndex.value);
    switch (selectedIndex.value) {
      case 0:
        return HomeScreen();
      case 1:
        return AttendenceScreen();
      case 2:
        return TaskScreen();
      case 3:
        return ProfileScreen();

      default:
        return Container(
          color: Colors.red,
          height: 400,
          width: 200,
        );
    }
  }
}
