// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
//
// class ProfileController extends GetxController {
//   final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
//   final fullNameController = TextEditingController();
//   final userNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   // RxString? email = "".obs;
//   // RxString? password = "".obs;
//
//   login(BuildContext context) async {
//     log("$context Login", name: "LoginExe");
//     // Get the entered username and password
//     final email = emailController.text;
//     final password = passwordController.text;
//     final fullname = passwordController.text;
//     final username = passwordController.text;
//
//     // Query the database to check if admin exists
//     // final database = getIt<AppDatabase>();
//     // final adminExists = await database.loginTableDao.checkAdminExists(username, password);
//     if (emailController != "" &&
//         passwordController != "" &&
//         userNameController != "" &&
//         fullNameController != null) {
//       //Get.to();
//
//       // getIt<SharedPreferencesModel>().setLoginStatus(true);
//     } else {
//       Fluttertoast.showToast(
//           msg: 'Please Fill All Fields',
//           toastLength: Toast.LENGTH_SHORT,
//           backgroundColor: Colors.red);
//     }
//   }
// }
