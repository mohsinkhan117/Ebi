import 'package:flutter/material.dart';

class CatagoriesViewModel extends ChangeNotifier {
  TextEditingController searchBarController = TextEditingController();
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectCategory(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
