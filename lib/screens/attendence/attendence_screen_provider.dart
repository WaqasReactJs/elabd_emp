import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendenceScreenProvider with ChangeNotifier {
  int _selectedButton = 1; // Default selected button is 1

  int get selectedButton => _selectedButton;

  void setSelectedButton(int button) {
    _selectedButton = button;
    notifyListeners();
  }

  Stream<List<Map<String, dynamic>>> get checkInOutData {
    final collection = FirebaseFirestore.instance.collection('checkInOut');
    return collection.snapshots().map((snapshot) {
      List<Map<String, dynamic>> data = [];
      snapshot.docs.forEach((doc) {
        data.add(doc.data());
      });
      return data;
    });
  }
}
