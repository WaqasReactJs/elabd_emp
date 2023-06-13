import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elabd_tms_app/screens/attendence/attendence_screen.dart';
import 'package:elabd_tms_app/screens/home/home_screen_provider.dart';
import 'package:elabd_tms_app/screens/salary_report/salary_report_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../components/custom_app_bar.dart';
import '../../components/custom_button.dart';
import '../../components/custom_text.dart';
import '../../constants/colors.dart';
import '../../models/attendence_model.dart';
import '../../models/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AttendenceModel> attendenceList =
      List<AttendenceModel>.empty(growable: true);
  List<TaskModel> taskList = List<TaskModel>.empty(growable: true);
  bool isButtonVisible = true;

  CollectionReference? collection;
  QuerySnapshot? querySnapshot;
  String? formattedDate;

  bool isCheckedIn = false;

  callThisFunction() async {
    log("$callThisFunction", name: "callthisfunction");
    formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    collection = FirebaseFirestore.instance.collection('checkInOut');
    querySnapshot =
        await collection?.where('date', isEqualTo: formattedDate).get();
    log("$querySnapshot", name: "querySnapshot");
    isCheckedIn = querySnapshot!.docs.isNotEmpty;
    log("$isCheckedIn", name: "isCheckedIn");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callThisFunction();

    ////
    attendenceList.add(AttendenceModel(key: "10", value: "2"));
    attendenceList.add(AttendenceModel(key: "20", value: "4"));
    attendenceList.add(AttendenceModel(key: "30", value: "6"));
    attendenceList.add(AttendenceModel(key: "30", value: "8"));
    attendenceList.add(AttendenceModel(key: "40", value: "7"));
    attendenceList.add(AttendenceModel(key: "50", value: "8"));
    attendenceList.add(AttendenceModel(key: "60", value: "4"));
    attendenceList.add(AttendenceModel(key: "70", value: "4"));
    attendenceList.add(AttendenceModel(key: "80", value: "4"));
    attendenceList.add(AttendenceModel(key: "90", value: "4"));
    attendenceList.add(AttendenceModel(key: "100", value: "4"));
    //
    taskList.add(TaskModel(key: "10", value: "2"));
    taskList.add(TaskModel(key: "20", value: "4"));
    taskList.add(TaskModel(key: "30", value: "5"));
    taskList.add(TaskModel(key: "40", value: "6"));
    taskList.add(TaskModel(key: "50", value: "7"));
    taskList.add(TaskModel(key: "60", value: "8"));
    taskList.add(TaskModel(key: "70", value: "9"));
    taskList.add(TaskModel(key: "80", value: "10"));
    taskList.add(TaskModel(key: "90", value: "6"));
    taskList.add(TaskModel(key: "100", value: "4"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Home",
        backgroundColor: Colors.white,
        textColor: Colors.black,
      ),
      body: SafeArea(
        child: Consumer<HomeScreenProvider>(builder: (context, provider, _) {
          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: DateTime.now().toString(),
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                  ),
                  CustomText(
                    text: "Toady",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(children: [
                        Consumer<HomeScreenProvider>(
                          builder: (context, imageProvider, _) {
                            final selectedImage = imageProvider.image;

                            return InkWell(
                              onTap: () {
                                _dialogBuilder(context, imageProvider);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: (selectedImage != null)
                                          ? FileImage(
                                              selectedImage,
                                            )
                                          : AssetImage('assets/images/home.png')
                                              as ImageProvider,
                                      fit: BoxFit.cover),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "AHMED",
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ]),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  dashboardContainer(),
                  SizedBox(height: 20),
                  attendanceContainer(),
                  SizedBox(height: 20),
                  attendanceReportContainer(),
                  SizedBox(
                    height: 30,
                  ),
                  taskReportContainer(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        child: Image(
                          image: AssetImage("assets/images/salaryreport.png"),
                        ),
                      ),
                      Spacer(),
                      CustomText(
                        text: "Salary Report",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Get.to(SalaryReportScreen());
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          child: Image(
                            image: AssetImage("assets/images/forward.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  // Future<void> _pickImage(ImageSource source) async {
  //   final pickedImage = await ImagePicker().pickImage(source: source);
  //   if (pickedImage != null) {
  //     final imageFile = File(pickedImage.path);
  //     .setImage(imageFile);
  //   }
  // }

  Widget attendanceContainer() {
    return InkWell(
      onTap: () {
        Get.to(AttendenceScreen());
      },
      child: Container(
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText(
            text: "Attendance",
            color: primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: 10,
          ),
          // Consumer<HomeScreenProvider>(
          //   builder: (context, provider, _) {
          //     // FirebaseFirestore.instance.collection('checkInOut').
          //     final checkInDateTime = provider.checkInDateTime;
          //     final checkOutDateTime = provider.checkOutDateTime;
          //
          //     return
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CustomText(
                    text: "8:00:00 am",
                    color: halfSilverColor,
                    fontSize: 12,
                  ),
                  // if (provider.isButtonVisible)

                  Consumer<HomeScreenProvider>(
                    builder: (context, provider, _) {
                      if (isCheckedIn == true) {
                        // User has already checked in, show a message
                        return Text('You have checked in');
                      } else {
                        // User has not checked in, show the button
                        return CustomButton(
                          textColor: Colors.white,
                          image: "assets/images/checkIn.png",
                          width: 140,
                          height: 55,
                          color: primaryColor,
                          text: 'Checkin',
                          onPressed: provider.performCheckIn,
                        );
                      }

                      // if (provider.checkInDateTime != null) {
                      //   // User has already checked in, show a message
                      //   return Text('You have checked in');
                      // } else {
                      //   // User has not checked in, show the button
                      //   return CustomButton(
                      //     textColor: Colors.white,
                      //     image: "assets/images/checkIn.png",
                      //     width: 140,
                      //     height: 55,
                      //     color: primaryColor,
                      //     text: 'Checkin',
                      //     onPressed: provider.performCheckIn,
                      //   );
                      // }
                    },
                  )
                  // if (checkInDateTime != null)
                  //   CustomText(
                  //     text:
                  //         'Checkin Time: \n${DateFormat.Hms().format(checkInDateTime)}',
                  //     color: Colors.black,
                  //     fontSize: 16,
                  //   ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(
                    text: "5:00:00 pm",
                    color: halfSilverColor,
                    fontSize: 12,
                  ),
                  // if (checkInDateTime != null && checkOutDateTime == null)
                  Consumer<HomeScreenProvider>(builder: (context, provider, _) {
                    return CustomButton(
                      image: "assets/images/checkIn.png",
                      width: 140,
                      height: 55,
                      textColor: Colors.white,
                      color: redColor,
                      text: 'Check Out',
                      onPressed: () {
                        provider.performCheckOut();
                      },
                    );
                  })

                  // if (checkOutDateTime != null)
                  //   CustomText(
                  //     text:
                  //         'Checkout Time: \n${DateFormat.Hms().format(checkOutDateTime)}',
                  //     color: Colors.black,
                  //     fontSize: 16,
                  //   ),
                ],
              ),
            ],
          )
          // },
        ]),
      ),
    );
  }

  Widget dashboardContainer() {
    return Container(
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
            text: "Dashboard",
            color: primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(
                        text: "ASSIGNED TASK",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: skyBlueColor,
                      ),
                      SizedBox(width: 20),
                      CustomText(
                        text: "0",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: skyBlueColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(
                        text: "CLOSED TASK",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: halfBlacColor,
                      ),
                      SizedBox(width: 20),
                      CustomText(
                        text: "303",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: halfBlacColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(
                        text: "REOPENED TASK",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: redColor,
                      ),
                      SizedBox(width: 20),
                      CustomText(
                        text: "0",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: redColor,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(
                        text: "ASSIGNED TASK",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: skyBlueColor,
                      ),
                      SizedBox(width: 20),
                      CustomText(
                        text: "0",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: skyBlueColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(
                        text: "CLOSED TASK",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: halfBlacColor,
                      ),
                      SizedBox(width: 20),
                      CustomText(
                        text: "303",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: halfBlacColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(
                        text: "REOPENED TASK",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: redColor,
                      ),
                      SizedBox(width: 20),
                      CustomText(
                        text: "0",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: redColor,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget attendanceReportContainer() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                text: "Statistics",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: black,
              ),
              Spacer(),
              CustomText(
                text: "Monthly",
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
              Container(
                width: 20,
                height: 20,
                child: Image(
                  image: AssetImage("assets/images/dropdown.png"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                child: Image(
                  image: AssetImage("assets/images/clock.png"),
                ),
              ),
              Spacer(),
              CustomText(
                text: "Attendence Report",
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
              Spacer(),
              CustomText(
                text: "93%",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: black,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            child: BarChart(
              BarChartData(
                backgroundColor: Colors.white,
                barGroups: _chartGroup(),
                borderData: FlBorderData(
                  border:
                      const Border(bottom: BorderSide(), left: BorderSide()),
                ),
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toString(),
                          style: const TextStyle(fontSize: 10),
                        );
                      },
                    ),
                  ),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget taskReportContainer() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                child: Image(
                  image: AssetImage("assets/images/taskreport.png"),
                ),
              ),
              Spacer(),
              CustomText(
                text: "Tasks Report",
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
              Spacer(),
              CustomText(
                text: "93%",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: black,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            child: BarChart(
              BarChartData(
                backgroundColor: Colors.white,
                barGroups: taskChartGroup(),
                borderData: FlBorderData(
                  border:
                      const Border(bottom: BorderSide(), left: BorderSide()),
                ),
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(sideTitles: bottomTilesTask),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toString(),
                          style: const TextStyle(fontSize: 10),
                        );
                      },
                    ),
                  ),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> taskChartGroup() {
    List<BarChartGroupData> list =
        List<BarChartGroupData>.empty(growable: true);
    for (int i = 0; i < taskList.length; i++) {
      list.add(BarChartGroupData(x: i, barRods: [
        BarChartRodData(
            toY: double.parse(attendenceList[i].value!),
            color: Colors.deepOrange)
      ]));
    }
    return list;
  }

  SideTitles get bottomTilesTask => SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) {
        String text = "";
        switch (value.toInt()) {
          case 0:
            text = "1";
            break;
          case 1:
            text = "2";
            break;
          case 2:
            text = "3";
            break;
          case 3:
            text = "4";
            break;
          case 4:
            text = "5";
            break;
          case 5:
            text = "6";
            break;
          case 6:
            text = "7";
            break;
        }
        return Text(
          text,
          style: const TextStyle(fontSize: 10),
        );
      });

  List<BarChartGroupData> _chartGroup() {
    List<BarChartGroupData> list =
        List<BarChartGroupData>.empty(growable: true);
    for (int i = 0; i < attendenceList.length; i++) {
      list.add(BarChartGroupData(x: i, barRods: [
        BarChartRodData(
            toY: double.parse(attendenceList[i].value!),
            color: Colors.deepOrange)
      ]));
    }
    return list;
  }

  SideTitles get _bottomTitles => SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) {
        String text = "";
        switch (value.toInt()) {
          case 0:
            text = "1";
            break;
          case 1:
            text = "2";
            break;
          case 2:
            text = "3";
            break;
          case 3:
            text = "4";
            break;
          case 4:
            text = "5";
            break;
          case 5:
            text = "6";
            break;
          case 6:
            text = "7";
            break;
        }
        return Text(
          text,
          style: const TextStyle(fontSize: 10),
        );
      });

  Future<void> _dialogBuilder(
      BuildContext context, HomeScreenProvider imageProvider) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    imageProvider.pickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: const [
                      CircleAvatar(
                        child: Icon(Icons.picture_in_picture_sharp),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Picked Icon from Gallery",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () async {
                      // Capture a photo
                      imageProvider.pickImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: const [
                        CircleAvatar(
                          child: Icon(Icons.camera_alt),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Picked Image from Camera",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
