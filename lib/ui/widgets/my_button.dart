import 'package:ebi/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final textChild;
  void Function()? onTap;

  MyButton({required this.textChild, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Center(
          child: Text(
            textChild,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(color: AppColors.textWhite),
          ),
        ),
      ),
    );
  }
}
