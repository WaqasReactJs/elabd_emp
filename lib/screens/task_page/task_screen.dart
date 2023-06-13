import 'package:elabd_tms_app/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import '../../components/custom_text.dart';
import '../../constants/colors.dart';
import '../task_details/task_details_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: "Task Page",
        textColor: black,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
          child: Column(
            children: [
              WeeklyDatePicker(
                selectedDay: _selectedDay,
                changeDay: (value) => setState(() {
                  _selectedDay = value;
                }),
                enableWeeknumberText: false,
                weeknumberColor: const Color(0xFF57AF87),
                weeknumberTextColor: Colors.white,
                backgroundColor: Colors.transparent,
                weekdayTextColor: const Color(0xFF8A8A8A),
                digitsColor: const Color(0xff7B6F72),
                selectedBackgroundColor: const Color(0xFF57AF87),
                weekdays: ["Mo", "Tu", "We", "Th", "Fr"],
                daysInWeek: 5,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(20),
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
                child: Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Color(0xffC8E5B2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        width: 20,
                        height: 20,
                        child: Image(
                          color: primaryColor,
                          image: AssetImage("assets/images/uxappicon.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      children: [
                        CustomText(
                          text: "UX App Project",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: black,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: "Status : ",
                              fontSize: 10,
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                            CustomText(
                              text: "Completed ",
                              fontSize: 10,
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              child: Image(
                                color: primaryColor,
                                image:
                                    AssetImage("assets/images/circle_tick.png"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(TaskDetailScreen());
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image(
                              color: primaryColor,
                              image: AssetImage("assets/images/forward.png"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(20),
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
                child: Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Color(0xffC8E5B2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        width: 20,
                        height: 20,
                        child: Image(
                          color: primaryColor,
                          image: AssetImage("assets/images/websiteicon.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      children: [
                        CustomText(
                          text: "Web Site Design",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: black,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: "Status : ",
                              fontSize: 10,
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                            CustomText(
                              text: "Assigned ",
                              fontSize: 10,
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              child: Image(
                                color: primaryColor,
                                image:
                                    AssetImage("assets/images/circle_tick.png"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(TaskDetailScreen());
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image(
                              color: primaryColor,
                              image: AssetImage("assets/images/forward.png"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
