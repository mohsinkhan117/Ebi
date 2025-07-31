// lib/core/helper_functions/helper_function.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HelperFunctions {
  // Navigate to screen
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  // Navigate to screen without stack
  static void navigateToScreenPermanently(BuildContext context, String route) {
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static String getFormattedDate(
    DateTime date, {
    String format = 'dd MMM yyyy',
  }) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
        i,
        i + rowSize > widgets.length ? widgets.length : i + rowSize,
      );
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
