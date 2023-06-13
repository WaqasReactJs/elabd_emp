import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text.dart';
import '../../components/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Forgot Password?',
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
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
                        hinttext: "Enter Your Register Email",
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                      width: 173,
                      height: 55,
                      textColor: Colors.white,
                      color: Color(0xff065F14),
                      text: 'Reset Password',
                      onPressed: () {
                        auth
                            .sendPasswordResetEmail(email: emailController.text)
                            .then((value) {
                          Fluttertoast.showToast(
                              msg:
                                  "We have send you email to recover password, please check email");
                        }).onError((error, stackTrace) {
                          Fluttertoast.showToast(msg: error.toString());
                        });
                      },
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
