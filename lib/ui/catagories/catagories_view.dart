import 'package:flutter/material.dart';

class CatagoriesView extends StatelessWidget {
  static const routeName = '/catagories-View';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => CatagoriesView(),
      settings: RouteSettings(name: routeName),
    );
  }

  const CatagoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: SearchBar()));
  }
}
