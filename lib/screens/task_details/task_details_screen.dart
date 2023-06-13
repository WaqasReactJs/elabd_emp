import 'package:elabd_tms_app/components/custom_button.dart';
import 'package:elabd_tms_app/components/custom_text.dart';
import 'package:elabd_tms_app/screens/task_details/task_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/custom_app_bar.dart';
import '../../constants/colors.dart';

class TaskDetailScreen extends StatefulWidget {
  const TaskDetailScreen({Key? key}) : super(key: key);

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  int? selectedRadio = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Task Details",
        backgroundColor: Colors.white,
        textColor: black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: "Sign Date:",
                            fontWeight: FontWeight.w500,
                            fontSize: 8,
                            color: black,
                          ),
                          CustomText(
                            text: "May 7 2023",
                            fontWeight: FontWeight.w500,
                            fontSize: 8,
                            color: halfSilverColor,
                          )
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          CustomText(
                            text: "Current Status:",
                            fontWeight: FontWeight.w500,
                            fontSize: 8,
                            color: black,
                          ),
                          CustomText(
                            text: "Inprocess",
                            fontWeight: FontWeight.w500,
                            fontSize: 8,
                            color: halfSilverColor,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Description",
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: halfSilverColor,
                      ),
                      CustomText(
                        text: "TEST TASK by Elabd Tech",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text:
                            "This is a test task description created by Elabd Technologies for testing the skills of UI UX designer in FIGMA.",
                        fontSize: 12,
                        color: black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "1. Login & Sign Up Page",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "2.Home Page",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          CustomText(
                            text: "a. List of daily task(Today)",
                            fontSize: 12,
                            color: black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          CustomText(
                            text:
                                "b. List of Project with Progress in Percentage",
                            fontSize: 12,
                            color: black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomText(
                              text:
                                  "c. A button at top to Check In and Check Out for employee",
                              fontSize: 12,
                              color: black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomText(
                              text:
                                  "d. Bottom Navbar having option -> Home, Tasks, Attendance, Profile",
                              fontSize: 12,
                              color: black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "3.Tasks Page",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          CustomText(
                            text:
                                "a. List of completed, pending and delayed tasks",
                            fontSize: 12,
                            color: black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          CustomText(
                            text:
                                "b. Task name, Project Name, Deadline, Status",
                            fontSize: 12,
                            color: black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "4.Task Detail Page",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomText(
                              text:
                                  "a. Having all detail of task including task description and deadline",
                              fontSize: 12,
                              color: black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "5. Attendence",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomText(
                              text:
                                  "a. A table showing check in and check out times based on dates and column with hours of work on that date 6. Profile",
                              fontSize: 12,
                              color: black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomText(
                              text:
                                  "b.Showing personal details of Employee (Username, Email. Photo, Full Name, Logout button etc.",
                              fontSize: 12,
                              color: black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Note",
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: black,
                          ),
                          Expanded(
                            child: CustomText(
                              text:
                                  "This is a dummy task and is not linked to any of our projects. Some of the Reference Designs Link",
                              fontSize: 12,
                              color: black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: CustomText(
                              text:
                                  "1. https://dribbble.com/shots/16764078-Task-Manager-calender-App",
                              fontSize: 12,
                              color: black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: CustomText(
                              text:
                                  "2. https://dribbble.com/shots/11007749-Task-manager-Mobile-App",
                              fontSize: 12,
                              color: black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CustomText(
                                fontSize: 14,
                                color: primaryColor,
                                text: "Current Status :",
                              ),
                              SizedBox(width: 5),
                              CustomText(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: primaryColor,
                                text: "Assigned",
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: CustomButton(
                                  width: 60,
                                  height: 39,
                                  text: "Change Status",
                                  textColor: Colors.white,
                                  color: primaryColor,
                                  onPressed: () {
                                    dialogShow(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dialogShow(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Consumer<TaskDetailsProvider>(
                builder: (context, provider, _) => Container(
                  height: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CustomText(
                                text: "Change Status",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: black,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Radio<int?>(
                                    value: 1,
                                    groupValue: provider.selectedButton,
                                    onChanged: (value) {
                                      provider.setSelectedButton(value!);
                                    },
                                  ),
                                  CustomText(
                                    text: 'Assigned',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: black,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Radio<int?>(
                                    value: 2,
                                    groupValue: provider.selectedButton,
                                    onChanged: (value) {
                                      provider.setSelectedButton(value!);
                                    },
                                  ),
                                  CustomText(
                                    text: 'On Hold',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Radio<int?>(
                                    value: 3,
                                    groupValue: provider.selectedButton,
                                    onChanged: (value) {
                                      provider.setSelectedButton(value!);
                                    },
                                  ),
                                  CustomText(
                                    text: 'Closed',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: black,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Radio<int?>(
                                    value: 4,
                                    groupValue: provider.selectedButton,
                                    onChanged: (value) {
                                      provider.setSelectedButton(value!);
                                    },
                                  ),
                                  CustomText(
                                    text: 'ReOpen',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Radio<int?>(
                                    value: 5,
                                    groupValue: provider.selectedButton,
                                    onChanged: (value) {
                                      provider.setSelectedButton(value!);
                                    },
                                  ),
                                  CustomText(
                                    text: 'Fixed',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: black,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Radio<int?>(
                                    value: 6,
                                    groupValue: provider.selectedButton,
                                    onChanged: (value) {
                                      provider.setSelectedButton(value!);
                                    },
                                  ),
                                  CustomText(
                                    text: 'Transfered',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Radio<int?>(
                                    value: 7,
                                    groupValue: provider.selectedButton,
                                    onChanged: (value) {
                                      provider.setSelectedButton(value!);
                                    },
                                  ),
                                  CustomText(
                                    text: 'New',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: black,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Radio<int?>(
                                    value: 8,
                                    groupValue: provider.selectedButton,
                                    onChanged: (value) {
                                      provider.setSelectedButton(value!);
                                    },
                                  ),
                                  CustomText(
                                    text: 'Work Started',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: CustomButton(
                                  width: 95,
                                  height: 45,
                                  textColor: silverColor,
                                  text: "Cancel",
                                  color: Colors.white,
                                  onPressed: () {}),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: primaryColor,
                                  ),
                                  color: primaryColor),
                              child: CustomButton(
                                  width: 95,
                                  height: 45,
                                  textColor: Colors.white,
                                  text: "Yes",
                                  color: primaryColor,
                                  onPressed: () {}),
                            )
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
