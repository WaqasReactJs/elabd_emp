import 'package:elabd_tms_app/components/custom_app_bar.dart';
import 'package:elabd_tms_app/components/custom_button.dart';
import 'package:elabd_tms_app/components/custom_text.dart';
import 'package:elabd_tms_app/constants/colors.dart';
import 'package:elabd_tms_app/main.dart';
import 'package:elabd_tms_app/models/select_index_controller.dart';
import 'package:elabd_tms_app/models/shared_preferences_model.dart';
import 'package:elabd_tms_app/screens/login/login_screen.dart';
import 'package:elabd_tms_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/custom_text_field.dart';
import '../../constants/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _obscureText = true;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Profile",
        backgroundColor: Colors.white,
        textColor: black,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 95,
                        height: 95,
                        child: Image(
                          color: primaryColor,
                          image: AssetImage("assets/images/profile.png"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Abdul Shakoor",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: "Full Name",
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: black,
              ),
              SizedBox(
                height: 10,
              ),
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
                  hinttext: "Full Name",
                  controller: emailController,
                  type: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "Username",
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: black,
              ),
              SizedBox(
                height: 10,
              ),
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
                  hinttext: "UI&UXdesigner",
                  controller: emailController,
                  type: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "Email Address",
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: black,
              ),
              SizedBox(
                height: 10,
              ),
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
                  hinttext: "elabd@gmail.com",
                  controller: emailController,
                  type: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "Password",
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: black,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6 * width),
                child: Container(
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
                  child: Center(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      controller: passwordController,
                      cursorColor: Colors.black,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        border: InputBorder.none, // Remove the border
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.grey,
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
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "Joined 4 Mar 2022",
                fontWeight: FontWeight.w600,
                fontSize: 11,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      width: 90,
                      height: 39,
                      textColor: redColor,
                      text: "Logout",
                      color: Color.fromRGBO(226, 20, 20, 0.18),
                      onPressed: () {
                        dialogShow(context);
                      }),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  void dialogShow(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Consumer<AuthServiceProvider>(
                builder: (context, provider, _) => Container(
                  height: 180,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CustomText(
                                text: "Are You sure You want to Logout!!",
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: black,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                                width: 95,
                                height: 45,
                                textColor: Colors.white,
                                text: "No",
                                color: primaryColor,
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            CustomButton(
                                width: 95,
                                height: 45,
                                textColor: Colors.white,
                                text: "Yes",
                                color: redColor,
                                onPressed: () async {
                                  bool logout = await provider.signOut();

                                  if (logout) {
                                    Navigator.pop(context);
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return LoginScreen();
                                    }));
                                    getIt<SelectIndexController>()
                                        .selectedIndex
                                        .value = 0;
                                    getIt<SharedPreferencesModel>()
                                        .setLoginStatus(false);
                                  }
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
