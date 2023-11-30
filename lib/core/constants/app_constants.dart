// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> kVibrateLight() async => await HapticFeedback.lightImpact();

const Color kBackGroundColor = Color(0xffF5F6FA);
const Color kPrimaryColor = Color(0xff1A434D);
const Color kBeige = Color(0xffFBF2E9);
const Color kDarkBeige = Color(0xffF1E8E6);
const Color kPurple = Color(0xff6C63FF);
const Color kPurple2 = Color(0xffD3C2F7);
const Color kMidPurple = Color(0xffE6DEF6);

const Color kTextBlack = Color(0xff2E2F37);
const Color kBlack = Colors.black;
const Color kWhite = Colors.white;
const kGrey = Color(0xffBBBCC7);

const kDisabledButtonColor = Color(0xffDADADA);
const Color kSecondaryGray = Color(0xff211F30);
const Color kErrorTextColor = Colors.red;
const Color kSuccessColor = Color(0xff5cb85c);

const double horizantalPadding = 17;
const double defaultSizedBoxPadding = 15;

const String assetImageFilePath = "assets/images/";

const String imagePlaceHolder =
    'https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png?w=640';
const String cameraImage =
    'https://static.vecteezy.com/system/resources/previews/003/715/574/non_2x/camera-sign-and-symbol-photo-icon-or-image-icon-vector.jpg';

TextStyle kBoldLargeTitleStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 48,
    fontWeight: FontWeight.bold,
  );
}

TextStyle kLargeTitleStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
}

TextStyle kBoldTitleStyle(Color color) {
  return TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.bold,
    color: kPrimaryColor,
  );
}

TextStyle kTitleStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
}

TextStyle kContentStyleBold(Color color) {
  return TextStyle(
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}

TextStyle kContentStyleThin(Color color) {
  return TextStyle(
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}

TextStyle kHintTextStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}

TextStyle kLoginButtonTextStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
}
