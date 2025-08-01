import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  TextEditingController searchBarCotroller = TextEditingController();

  List<String> listTitles = [
    'Account Information',
    'My orders',
    'Returns',
    'Wishlist',
    'Support',
    'Settings',
  ];
}
