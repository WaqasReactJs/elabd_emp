import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../models/select_index_controller.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
    required this.selectIndexCtrl,
  });

  final SelectIndexController selectIndexCtrl;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        height: 35,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => InkWell(
                onTap: () => selectIndexCtrl.selectedIndex.value = 0,
                child: Icon(
                  Icons.home_outlined,
                  size: 40,
                  color: (selectIndexCtrl.selectedIndex.value == 0)
                      ? Color(0xff065F14)
                      : Color(0xffc5c5c5),
                  // color: (GlobalVariables.selectedIndex.value == 0)
                  //     ? Get.theme.primaryColor
                  //     : const Color(0xff9B9B9B),
                ),
              ),
            ),
            Obx(
              () => InkWell(
                onTap: () => selectIndexCtrl.selectedIndex.value = 1,
                child: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    'assets/images/bottom_icon2.png',
                    color: (selectIndexCtrl.selectedIndex.value == 1)
                        ? Color(0xff065F14)
                        : Color(0xffc5c5c5),
                    // color: (GlobalVariables.selectedIndex.value == 1)
                    //     ? Get.theme.primaryColor
                    //     : const Color(0xff9B9B9B),
                  ),
                ),
              ),
            ),
            Obx(
              () => InkWell(
                onTap: () => selectIndexCtrl.selectedIndex.value = 2,
                child: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    'assets/images/bottom_icon3.png',

                    color: (selectIndexCtrl.selectedIndex.value == 2)
                        ? Color(0xff065F14)
                        : Color(0xffc5c5c5),
                    // color: (GlobalVariables.selectedIndex.value == 1)
                    //     ? Get.theme.primaryColor
                    //     : const Color(0xff9B9B9B),
                  ),
                ),
              ),
            ),
            Obx(
              () => InkWell(
                onTap: () => selectIndexCtrl.selectedIndex.value = 3,
                child: Container(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    'assets/images/bottom_icon4.png',

                    color: (selectIndexCtrl.selectedIndex.value == 3)
                        ? Color(0xff065F14)
                        : Color(0xffc5c5c5),
                    // color: (GlobalVariables.selectedIndex.value == 3)
                    //     ? Get.theme.primaryColor
                    //     : const Color(0xff9B9B9B),
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //
            //     ],
            //   ),
            // ),
            // Expanded(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
