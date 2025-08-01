import 'package:flutter/material.dart';

class checkoutViewModel extends ChangeNotifier {
  final List<Map<String, dynamic>> items = [
    {'title': 'SHIPPING', 'content': 'Add shipping address', 'trailing': false},
    {
      'title': 'DELIVERY',
      'content': 'FREE\nStandard | 3-4 days',
      'trailing': true,
    },
    {'title': 'PAYMENT', 'content': 'Visa *1234', 'trailing': true},
    {'title': 'PROMOS', 'content': 'Apply promo code', 'trailing': false},
  ];

  final List<Map<String, dynamic>> products = [
    {
      'price': 10.99,
      'image': 'assets/images/homeImages/1.png',
      'description': 'This is First class cotton available only with us',
      'brand': 'Aliya',
      'quantity': 01,
      'product-name': 'Black Abayya Stiched',
    },
    {
      'price': 8.99,
      'image': 'assets/images/homeImages/3.png',
      'description': 'The is Europian Abbaya Lenga',
      'brand': 'Natasha',
      'quantity': 02,
      'product-name': 'White Scrave UnStiched',
    },
  ];
}
