import 'package:elabd_tms_app/screens/forgot_password/forgot-password_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text.dart';
import '../../components/custom_text_field.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../main.dart';
import '../../models/shared_preferences_model.dart';
import '../../services/auth_services.dart';
import '../home/custom_bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var countryCode;
  bool _obscureText = true;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthServiceProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 277,
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/login_img.png'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: 'Welcome Back!',
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Form(
                            key: loginFormKey,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10, right: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: CustomTextField(
                                    hinttext: "Enter Your Email",
                                    controller: emailController,
                                    type: TextInputType.emailAddress,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6 * width),
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: TextField(
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        controller: passwordController,
                                        cursorColor: Colors.black,
                                        obscureText: _obscureText,
                                        decoration: InputDecoration(
                                          border: InputBorder
                                              .none, // Remove the border
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: Colors.black,
                                          ),
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _obscureText = !_obscureText;
                                              });
                                            },
                                            child: Icon(
                                              _obscureText
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(ForgotPasswordScreen());
                                      },
                                      child: CustomText(
                                        text: 'Forgot Password',
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomButton(
                                  width: 275,
                                  height: 55,
                                  textColor: Colors.white,
                                  color: Color(0xff065F14),
                                  text: 'Sign in',
                                  onPressed: () async {
                                    // login(context)
                                    String email = emailController.text.trim();
                                    String password =
                                        passwordController.text.trim();
                                    if (loginFormKey.currentState!.validate()) {
                                      bool signInSuccessful = await authProvider
                                          .signIn(email, password);
                                      if (signInSuccessful) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CustomizedBottomNavigationBar()),
                                        );
                                        getIt<SharedPreferencesModel>()
                                            .setLoginStatus(true);
                                      } else {
                                        Fluttertoast.showToast(
                                            msg:
                                                "User does not exit or invalid email or password");
                                      }
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Please Fill All Fields");
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomButton(
                                    width: 275,
                                    height: 55,
                                    textColor: primaryColor,
                                    color: Color(0xffEAEAEA),
                                    text: 'Biometric Sign in',
                                    onPressed: () {})
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
