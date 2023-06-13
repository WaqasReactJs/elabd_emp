// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
//
// import '../home/custom_bottom_nav_bar.dart';
//
// class LoginController extends GetxController {
//
//
//   // RxString? email = "".obs;
//   // RxString? password = "".obs;
//
//   login(BuildContext context) async {
//     log("$context Login", name: "LoginExe");
//     // Get the entered username and password
//     final username = emailController.text;
//     final password = passwordController.text;
//
//     // Query the database to check if admin exists
//     // final database = getIt<AppDatabase>();
//     // final adminExists = await database.loginTableDao.checkAdminExists(username, password);
//     if (emailController != "" && password != "") {
//       Get.to(CustomizedBottomNavigationBar());
//
//       // getIt<SharedPreferencesModel>().setLoginStatus(true);
//     } else {
//       Fluttertoast.showToast(
//           msg: 'Incorrect username or password',
//           toastLength: Toast.LENGTH_SHORT,
//           backgroundColor: Colors.red);
//     }
//   }
// }
