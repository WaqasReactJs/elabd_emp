import 'package:elabd_tms_app/components/custom_app_bar.dart';
import 'package:elabd_tms_app/components/custom_button2.dart';
import 'package:elabd_tms_app/components/custom_text.dart';
import 'package:elabd_tms_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/select_index_controller.dart';

class SalaryReportScreen extends StatefulWidget {
  const SalaryReportScreen({Key? key}) : super(key: key);

  @override
  State<SalaryReportScreen> createState() => _SalaryReportScreenState();
}

class _SalaryReportScreenState extends State<SalaryReportScreen> {
  List<int> years = [];
  int? selectedYear; // Store the selected year
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  String? selectedMonth; // Store the selected month
  final selectIndexCtrl = Get.put(SelectIndexController());

  @override
  void initState() {
    super.initState();
    int currentYear = DateTime.now().year;
    int startYear = 1900; // Starting year for the dropdown list

    // Generate the list of years
    for (int year = currentYear; year >= startYear; year--) {
      years.add(year);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Salary Report",
        textColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          InkWell(
            onTap: () {
              dialogShow(context);
            },
            child: Icon(
              Icons.print,
              color: primaryColor,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        child: DropdownButton<int>(
                          underline: Container(),
                          value: selectedYear,
                          // Set the selected year as the value
                          onChanged: (int? year) {
                            setState(() {
                              selectedYear = year; // Update the selected year
                            });
                          },
                          items: [
                            DropdownMenuItem<int>(
                              value: null, // Set the initial value to null
                              child: Text('Select Year'),
                            ),
                            ...years.map((int year) {
                              return DropdownMenuItem<int>(
                                value: year,
                                child: Text(year.toString()),
                              );
                            }).toList(),
                          ],
                        ),
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
                        child: DropdownButton<String>(
                          underline: Container(),

                          value: selectedMonth,
                          // Set the selected month as the value
                          onChanged: (String? month) {
                            setState(() {
                              selectedMonth =
                                  month; // Update the selected month
                            });
                          },
                          items: [
                            DropdownMenuItem<String>(
                              value: null, // Set the initial value to null
                              child: Text('Select Month'),
                            ),
                            ...months.map((String month) {
                              return DropdownMenuItem<String>(
                                value: month,
                                child: Text(month),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 20,
                ),
                basicInfoWidget(),
                SizedBox(
                  height: 20,
                ),
                attendenceInfoWidget(),
                SizedBox(
                  height: 20,
                ),
                deductionInfoWidget(),
                SizedBox(
                  height: 20,
                ),
                summaryWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget basicInfoWidget() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 20, top: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(125, 194, 71, 0.09),
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                text: "Basic Information",
                fontWeight: FontWeight.w700,
                fontSize: 13,
                color: primaryColor,
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: "Name",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: black,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: "Abdul Shakoor",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: hideTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: "Emp Type",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: black,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: "Probition",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: hideTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: "Rooster",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: black,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: "09 AM - 05 PM",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: hideTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: "Account No",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: black,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: "17*********3",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: hideTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: "Bank Name",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: black,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: "HBL",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: hideTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  Widget attendenceInfoWidget() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 20, top: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(125, 194, 71, 0.09),
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                text: "Attendence Information",
                fontWeight: FontWeight.w700,
                fontSize: 13,
                color: primaryColor,
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: "Present",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: black,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: "25",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: hideTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: "Absents",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: black,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: "01",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: hideTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: "Late Minutes (Days)",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: black,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: "02",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: hideTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: "Total Late Minutes",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: black,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: "180",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: hideTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: "Leaves(Paid)",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: black,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: "01",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: hideTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: "Leaves(UnPaid)",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: black,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: "01",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: hideTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  Widget deductionInfoWidget() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 20, top: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(125, 194, 71, 0.09),
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                text: "Deduction Information",
                fontWeight: FontWeight.w700,
                fontSize: 13,
                color: primaryColor,
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: "Absents",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: black,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: "2000/-",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: hideTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: "Leaves(Unpaid)",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: black,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: "1000/-",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: hideTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: "Total Late Minutes",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: black,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: "2500/-",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: hideTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  Widget summaryWidget() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 20, top: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(125, 194, 71, 0.09),
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                text: "Summary",
                fontWeight: FontWeight.w700,
                fontSize: 13,
                color: primaryColor,
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: "Basic Salary",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: black,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: "25000/-",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: hideTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: "Total Deduction",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: black,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: "5000/-",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: hideTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: "Payable Salary",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: black,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: "20000/-",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: hideTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ],
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
              child: Container(
                height: 240,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              width: 25,
                              height: 25,
                              child: Image(
                                image: AssetImage(
                                  "assets/images/print.png",
                                ),
                                color: primaryColor,
                                fit: BoxFit.cover,
                              )),
                        ],
                      ),
                      CustomText(
                        text: "Download Now",
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: black,
                      ),
                      SizedBox(height: 10),
                      CustomText(
                        text: "Salary Report is being downloading...",
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: black,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton2(
                              image: ("assets/images/print.png"),
                              imageColor: Colors.white,
                              width: 155,
                              height: 45,
                              textColor: Colors.white,
                              text: "Download",
                              color: primaryColor,
                              onPressed: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
