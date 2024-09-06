import 'package:flutter/material.dart';

class MyColors {
  // Scaffold background
  static const scaffoldLight = Colors.white;
  static const scaffoldDark = Color(0xff212327);

  // container's background holds all buttons
  static const containerLight = Color(0xffF5F5F5);
  static const containerDark = Color(0xff27292E);

  // Operation button background
  static const buttonLight = Color(0xffe9e9e9);
  static const buttonDark = Color(0xff323438);

  // Red Linear gradient
  static const gradient = LinearGradient(
    colors: [
      Color(0xffED0E98),
      Color(0xffFE5A2D),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Text color
  static const textLight = Color(0xff1E1E1E);
  static const textDark = Color(0xffffffff);

  // Secondary text color
  static const secondaryTextLight = Color(0xff637381);
  static const secondaryTextDark = Color(0xffCCCDD7);
}
