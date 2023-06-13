import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../models/shared_preferences_model.dart';
import '../../services/auth_services.dart';
import '../home/custom_bottom_nav_bar.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isSignupCompleted = false;
  late final bool status;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      navigateUser();
    });

    if (!_isSignupCompleted) {
      signup();
    }
  }

  void signup() async {
    String email = "kwaqassahil0777@gmail.com";
    String password = "admin123";
    final authProvider =
        Provider.of<AuthServiceProvider>(context, listen: false);

    bool signInSuccessful = await authProvider.signUp(email, password);
    log("$signInSuccessful", name: "signInSuccessful");

    setState(() {
      _isSignupCompleted = true;
    });
  }

  void navigateUser() async {
    status = getIt<SharedPreferencesModel>().getLoginStatus();

    if (status == true) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return const CustomizedBottomNavigationBar();
      }));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return LoginScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 175,
                  height: 180,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/splash_img.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "eLabd eMp",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "eLabd Employee App",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
