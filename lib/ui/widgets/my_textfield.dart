import 'package:ebi/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  bool isObscure;
  IconData? prefixIcon;
  double horizontalPadding;
  double verticalPadding;

  MyTextfield({
    required this.hintText,
    required this.controller,
    required this.isObscure,
    this.horizontalPadding = 20,
    this.verticalPadding = 10,
    super.key,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: SizedBox(
        height: 50,
        child: TextField(
          obscureText: isObscure,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(
              prefixIcon,
              color: AppColors.borderPrimary,
              size: 35,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xf828282)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xf828282)),
            ),
            fillColor: Color(0xf828282),
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.borderPrimary, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
