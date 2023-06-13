import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elabd_tms_app/models/rooster_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

bool isCheckedIn = false;

class HomeScreenProvider with ChangeNotifier {
  DateTime? checkInDateTime;
  String? formattedDate;
  CollectionReference? collection;
  QuerySnapshot? querySnapshot;

  Future<void> performCheckIn() async {
    if (isCheckedIn) {
      // User has already checked in
      // Handle the case where the user has already checked in
      // Update a boolean flag or notify listeners to trigger UI changes
      notifyListeners();
    } else {
      formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

      // Check if document with current date exists in Firestore collection
      bool documentExists = await _checkIfDocumentExists(formattedDate!);

      if (documentExists) {
        // Document already exists for the current date
        // Handle the case where the user has already checked in
        // Update a boolean flag or notify listeners to trigger UI changes
        notifyListeners();
      } else {
        // Perform the check-in process
        checkInDateTime = DateTime.now();
        await _storeCheckInDateTime();

        // Update the global variable to indicate that the user has checked in
        isCheckedIn = true;

        notifyListeners();
      }
    }
  }

  Future<bool> _checkIfDocumentExists(String date) async {
    try {
      collection = FirebaseFirestore.instance.collection('checkInOut');
      querySnapshot = await collection?.where('date', isEqualTo: date).get();

      return querySnapshot!.docs.isNotEmpty;
    } catch (error) {
      print('Failed to check if document exists: $error');
      return false;
    }
  }

  Future<void> _storeCheckInDateTime() async {
    String formattedTime = DateFormat.Hms().format(DateTime.now());

    try {
      collection = FirebaseFirestore.instance.collection('checkInOut');
      querySnapshot =
          await collection!.where('date', isEqualTo: formattedDate).get();

      if (querySnapshot!.docs.isEmpty) {
        await collection!.add({
          'checkInTime': formattedTime,
          'date': formattedDate,
          'checkOutTime': "",
          'currentUserId': _auth.currentUser?.uid
        });
      } else {
        print('A record for $formattedDate already exists.');
      }
    } catch (error) {
      print('Failed to store check-in time: $error');
    }
  }

  File? _image;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isButtonVisible = true;

  File? get image => _image;
  List<RoosterModel> _roosterList = [];

  List<RoosterModel> get roosters => _roosterList;

  DateTime? checkOutDateTime;
  DateTime now = DateTime.now();
  String? formattedTime;

  Future<void> fetchUsers() async {
    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    final roosters = snapshot.docs.map((doc) {
      final id = doc.id;
      final morning = doc.data()['morningTime'] as String;
      final evening = doc.data()['eveningTime'] as String;
      return RoosterModel(id: id, morning: morning, evening: evening);
    }).toList();
    _roosterList = roosters;
    notifyListeners();
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      _image = File(pickedImage.path);
      notifyListeners();
    }
  }

  Future<bool> isDateStored(String date) async {
    final collection = FirebaseFirestore.instance.collection('checkInOut');
    final querySnapshot =
        await collection.where('date', isEqualTo: date).limit(1).get();
    log("$querySnapshot", name: "QuerySnapShot");
    return querySnapshot.size > 0;
  }

  void performCheckOut() {
    if (checkOutDateTime == null) {
      checkOutDateTime = DateTime.now();
      notifyListeners();
      _storeCheckOutDateTime();
    }
  }

  Future<void> _storeCheckOutDateTime() async {
    formattedTime = DateFormat.Hms().format(now);
    try {
      final collection = FirebaseFirestore.instance.collection('checkInOut');
      await collection
          .where("currentUserId", isEqualTo: _auth.currentUser?.uid)
          .get();
      log("$collection", name: "collection");
    } catch (error) {
      print('Failed to store check-out time: $error');
    }
  }
}
