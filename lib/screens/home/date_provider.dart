import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DateProvider extends ChangeNotifier {
  bool showFirstButton = true;
  bool showSecondButton = false;

  Future<void> storeCurrentDate() async {
    final currentDate = DateTime.now();

    // Store the current date in Firestore
    await FirebaseFirestore.instance
        .collection('dates')
        .doc(currentDate.toIso8601String())
        .set({});

    // Check if Firestore has the current date
    final snapshot = await FirebaseFirestore.instance
        .collection('dates')
        .doc("2023-06-13T09:59:48.349371")
        .get();
//currentDate.toIso8601String()
    if (snapshot.exists) {
      showFirstButton = false;
      showSecondButton = true;
      notifyListeners();
    }
  }
}
