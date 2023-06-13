import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/select_index_controller.dart';
import 'custom_bottom_nav.dart';

class CustomizedBottomNavigationBar extends StatefulWidget {
  const CustomizedBottomNavigationBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomizedBottomNavigationBarState createState() =>
      _CustomizedBottomNavigationBarState();
}

class _CustomizedBottomNavigationBarState
    extends State<CustomizedBottomNavigationBar> {
  final selectIndexCtrl = Get.put(SelectIndexController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: backgroundColor,
        body: Obx(
          () => selectIndexCtrl.getSelectedView(),
        ),
        bottomNavigationBar: CustomBottomNav(selectIndexCtrl: selectIndexCtrl)
        // BottomAppBar(
        //   color: const Color(0xff182724),
        //   shape: const CircularNotchedRectangle(),
        //   // notchMargin: 8,
        //   child: SizedBox(
        //     height: 8 * SizeConfig.heightMultiplier,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         SizedBox(
        //           width: 5 * SizeConfig.widthMultiplier,
        //         ),
        //         MaterialButton(
        //           onPressed: () => selectIndexCtrl.changeActivePage(0),
        //           minWidth: 50,
        //           child: Container(
        //             height: 80,
        //             width: 50,
        //             decoration: const BoxDecoration(
        //               shape: BoxShape.circle,
        //             ),
        //             child: Image.asset('assets/images/bottom_icon4.png'),
        //           ),
        //         ),
        //         const Spacer(),
        //         MaterialButton(
        //           onPressed: () => selectIndexCtrl.changeActivePage(1),
        //           minWidth: 40,
        //           child: Container(
        //             height: 80,
        //             width: 50,
        //             decoration: const BoxDecoration(
        //               shape: BoxShape.circle,
        //             ),
        //             child: Image.asset('assets/images/bottom_icon4.png'),
        //           ),
        //         ),
        //         Spacer(),
        //         MaterialButton(
        //           onPressed: () => selectIndexCtrl.changeActivePage(2),
        //           minWidth: 50,
        //           child: Container(
        //             height: 80,
        //             width: 50,
        //             decoration: const BoxDecoration(
        //               shape: BoxShape.circle,
        //             ),
        //             child: Image.asset('assets/images/bottom_icon4.png'),
        //           ),
        //         ),
        //         const Spacer(),
        //         MaterialButton(
        //           onPressed: () => selectIndexCtrl.changeActivePage(3),
        //           minWidth: 40,
        //           child: Container(
        //             height: 80,
        //             width: 50,
        //             decoration: const BoxDecoration(
        //               shape: BoxShape.circle,
        //             ),
        //             child: Image.asset('assets/images/bottom_icon4.png'),
        //           ),
        //         ),
        //         SizedBox(
        //           width: 4 * SizeConfig.widthMultiplier,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
