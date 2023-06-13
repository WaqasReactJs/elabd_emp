import 'package:flutter/material.dart';

class TaskDetailsProvider with ChangeNotifier {
  int _selectedButton = 1; // Default selected button is 1

  int get selectedButton => _selectedButton;

  void setSelectedButton(int button) {
    _selectedButton = button;
    notifyListeners();
  }
}
