import 'package:ebi_project/core/utils/device_utils.dart';
import 'package:flutter/material.dart';

class SizeConfig {
  static double screenWidth(BuildContext context) =>
      DeviceUtils.getScreenWidth(context);
  static double screenHeight(BuildContext context) =>
      DeviceUtils.getScreenHeight(context);

  static double blockSizeHorizontal(BuildContext context) =>
      screenWidth(context) / 100;
  static double blockSizeVertical(BuildContext context) =>
      screenHeight(context) / 100;

  static double getProportionateScreenHeight(
    BuildContext context,
    double inputHeight,
  ) {
    return blockSizeVertical(context) * (inputHeight / 8);
  }

  static double getProportionateScreenWidth(
    BuildContext context,
    double inputWidth,
  ) {
    return blockSizeHorizontal(context) * (inputWidth / 4);
  }
}
