import 'package:flutter/material.dart';
import 'package:image_to_video/core/constants/app_constants.dart';

class ColorConstants {
  static const Color errorColor = Colors.red;
  static const whiteColor = Colors.white;
  static const greyColor = Colors.grey;
  static const amberColor = Colors.amber;
  static const black = Colors.black;
  static const blue = Color(0xff5795F4);

  //gradient
  static const List<Color> purpleGradientColors = [kPurple, blue];
  static const LinearGradient purpleGradient = LinearGradient(
    colors: purpleGradientColors,
  );

  static const LinearGradient whiteGradient =
      LinearGradient(colors: [whiteColor, kPurple2]);
}
