import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../components/custom_app_bar.dart';
import '../../components/custom_text.dart';
import '../../constants/colors.dart';
import 'attendence_screen_provider.dart';

class AttendenceScreen extends StatefulWidget {
  const AttendenceScreen({Key? key}) : super(key: key);

  @override
  State<AttendenceScreen> createState() => _AttendenceScreenState();
}

class _AttendenceScreenState extends State<AttendenceScreen> {
  int? selectedRadio = 1;
  DateTime? _selectedDate;

  TextEditingController _textEditingController = TextEditingController();
  TextEditingController selectDateController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController _firstDateController = TextEditingController();
  TextEditingController _secondDateController = TextEditingController();

  String selectedDate = "Select";

  @override
  void initState() {
    super.initState();

    String currentMonthName = DateFormat('MMMM').format(DateTime.now());
    _textEditingController.text = currentMonthName;
    startDateController.text = selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    // final attendenceController = Get.put(AttendenceController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Attendence",
        backgroundColor: Colors.white,
        textColor: black,
      ),
      body: SafeArea(
        child: ListView(physics: ScrollPhysics(), children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
            child: Column(
              children: [
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
                      Row(
                        children: [
                          Expanded(
                            child: Consumer<AttendenceScreenProvider>(
                              builder: (context, provider, _) => Row(
                                children: [
                                  Radio<int>(
                                    value: 1,
                                    groupValue: provider.selectedButton,
                                    onChanged: (value) {
                                      provider.setSelectedButton(value!);
                                    },
                                  ),
                                  Text('Monthly'),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            child: Consumer<AttendenceScreenProvider>(
                              builder: (context, provider, _) => Row(
                                children: [
                                  Radio<int>(
                                    value: 2,
                                    groupValue: provider.selectedButton,
                                    onChanged: (value) {
                                      provider.setSelectedButton(value!);
                                    },
                                  ),
                                  Text('Custom'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Consumer<AttendenceScreenProvider>(
                        builder: (context, provider, _) {
                          if (provider.selectedButton == 1) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, bottom: 8),
                                  child: Text("Select Month"),
                                ),
                                decoratedTextField1(context),
                              ],
                            );
                          } else if (provider.selectedButton == 2) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, bottom: 8),
                                  child: Text("Select Date"),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: decoratedTextField2(context)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                        child: decoratedTextField3(context)),
                                  ],
                                ),
                              ],
                            );
                          } else {
                            return Container(); // Default case
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                attendenceHistory1()
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget attendenceHistory1() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
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
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              CustomText(
                text: "Attendance History",
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  // Handle print action
                },
                child: Container(
                  width: 20,
                  height: 20,
                  child: Image(
                    image: AssetImage("assets/images/print.png"),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  // Handle download action
                },
                child: Container(
                  width: 20,
                  height: 20,
                  child: Image(
                    image: AssetImage("assets/images/downloader.png"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 18),
          Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: halfGreenColorText,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: 20,
                  height: 20,
                  child: Image(
                    color: primaryColor,
                    image: AssetImage("assets/images/checkIn.png"),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Check In",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
                  CustomText(
                    text: "May 9, 2023",
                    fontSize: 8,
                    color: halfSilverColorText,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    text: "07:59",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
                  CustomText(
                    text: "Early 1 minute",
                    fontSize: 8,
                    color: halfSilverColorText,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 18),
          Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 0, 0, 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: 20,
                  height: 20,
                  child: Image(
                    color: halfRedColor,
                    image: AssetImage("assets/images/checkIn.png"),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Check Out",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
                  CustomText(
                    text: "May 9, 2023",
                    fontSize: 8,
                    color: halfSilverColorText,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    text: "07:59",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
                  CustomText(
                    text: "Early 1 minute",
                    fontSize: 8,
                    color: halfSilverColorText,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
          Consumer<AttendenceScreenProvider>(
            builder: (context, provider, _) {
              return StreamBuilder<List<Map<String, dynamic>>>(
                stream: provider.checkInOutData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // Data is available
                    List<Map<String, dynamic>> data = snapshot.data!;

                    // Sort the data list based on check-in and check-out timestamps
                    data.sort((a, b) {
                      final checkInDateTimeA =
                          a['checkInDateTime'] as Timestamp?;
                      final checkInDateTimeB =
                          b['checkInDateTime'] as Timestamp?;
                      final checkOutDateTimeA =
                          a['checkOutDateTime'] as Timestamp?;
                      final checkOutDateTimeB =
                          b['checkOutDateTime'] as Timestamp?;

                      if (checkInDateTimeA != null &&
                          checkInDateTimeB != null) {
                        return checkInDateTimeB
                            .toDate()
                            .compareTo(checkInDateTimeA.toDate());
                      } else if (checkInDateTimeA != null) {
                        return -1; // Move documents with check-in timestamp to the top
                      } else if (checkInDateTimeB != null) {
                        return 1; // Move documents with check-in timestamp to the top
                      } else if (checkOutDateTimeA != null &&
                          checkOutDateTimeB != null) {
                        return checkOutDateTimeB
                            .toDate()
                            .compareTo(checkOutDateTimeA.toDate());
                      } else if (checkOutDateTimeA != null) {
                        return -1; // Move documents with check-out timestamp to the top
                      } else if (checkOutDateTimeB != null) {
                        return 1; // Move documents with check-out timestamp to the top
                      }

                      // If both check-in and check-out timestamps are null, preserve the original order
                      return 0;
                    });

                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          // Extract data from each item in the sorted list
                          final checkInDateTime =
                              data[index]['checkInDateTime'] as Timestamp?;
                          final checkOutDateTime =
                              data[index]['checkOutDateTime'] as Timestamp?;
                          DateTime? dateTime1, dateTime2;
                          String? timeIn, timeOut, dateIn, dateOut;
                          // Process the check-in date and time
                          if (checkInDateTime != null) {
                            dateTime1 = checkInDateTime.toDate();
                            timeIn = DateFormat('hh:mm a').format(dateTime1!);
                            dateIn = DateFormat('yyyy-MM-dd').format(dateTime1);
                          }
                          // Process the check-out date and time
                          if (checkOutDateTime != null) {
                            dateTime2 = checkOutDateTime.toDate();
                            timeOut = DateFormat('hh:mm a').format(dateTime2!);
                            dateOut =
                                DateFormat('yyyy-MM-dd').format(dateTime2);
                          }

                          // Build and return the list tile
                          return ListTile(
                            title: Column(
                              children: [
                                if (dateIn != null && timeIn != null)
                                  Text('Check-in: $dateIn $timeIn'),
                                Row(
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(255, 0, 0, 0.5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: Image(
                                          color: halfRedColor,
                                          image: AssetImage(
                                              "assets/images/checkIn.png"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: "Check In",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: black,
                                        ),
                                        CustomText(
                                          text: dateIn.toString(),
                                          fontSize: 8,
                                          color: halfSilverColorText,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          text: timeIn.toString(),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: black,
                                        ),
                                        CustomText(
                                          text: "Early 1 minute",
                                          fontSize: 8,
                                          color: halfSilverColorText,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                if (dateOut != null && timeOut != null)
                                  Text('Check-out: $dateOut $timeOut'),
                                Row(
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: halfGreenColorText,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: Image(
                                          color: Colors.green,
                                          image: AssetImage(
                                              "assets/images/checkIn.png"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: "Check Out",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: black,
                                        ),
                                        CustomText(
                                          text: dateOut.toString(),
                                          fontSize: 8,
                                          color: halfSilverColorText,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          text: timeOut.toString(),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: black,
                                        ),
                                        CustomText(
                                          text: "Early 1 minute",
                                          fontSize: 8,
                                          color: halfSilverColorText,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    // Error occurred while fetching data
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // No data available
                    return Text("No Such Check-In and Check-Out Time");
                  }
                },
              );
            },
          ),
          SizedBox(height: 18),
        ],
      ),
    );
  }

  Widget decoratedTextField1(BuildContext context) {
    return Container(
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
      child: TextField(
        controller: _textEditingController,
        readOnly: true,
        onTap: () {
          _selectDate(context);
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          suffixIcon: Icon(Icons.calendar_today),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget decoratedTextField2(BuildContext context) {
    return Container(
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
      child: TextField(
        controller: _firstDateController,
        readOnly: true,
        onTap: () {
          _selectFirstDate(context);
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          suffixIcon: _firstDateController.text.isNotEmpty
              ? null
              : Icon(Icons.calendar_today),
          filled: true,
          fillColor: Colors.white,
          hintText: "Start Date",
        ),
      ),
    );
  }

  Widget decoratedTextField3(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
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
      child: TextField(
        controller: _secondDateController,
        readOnly: true,
        onTap: () {
          _selectSecondDate(context);
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          suffixIcon: _secondDateController.text.isNotEmpty
              ? null
              : Icon(Icons.calendar_today),
          filled: true,
          fillColor: Colors.white,
          hintText: "End Date",
        ),
      ),
    );
  }

  Future<void> _selectFirstDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) _firstDateController.text = picked.toString();
  }

  Future<void> _selectSecondDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) _secondDateController.text = picked.toString();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      String monthName = DateFormat('MMMM').format(selectedDate);

      _textEditingController.text = monthName;
    } else {
      // If no date is selected, set the current month as the default value
      String currentMonthName = DateFormat('MMMM').format(DateTime.now());
      _textEditingController.text = currentMonthName;
    }
  }
}
