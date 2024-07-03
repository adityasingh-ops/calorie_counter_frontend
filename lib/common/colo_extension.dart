
import 'package:flutter/material.dart';

class TColor {
static Color get primaryColor1 => const Color(0xff4CAF50); // Green
static Color get primaryColor2 => const Color(0xff03A9F4); // Light Blue

static Color get secondaryColor1 => const Color(0xffFF9800); // Orange
static Color get secondaryColor2 => const Color(0xffCDDC39); // Lime Green


  static List<Color> get primaryG => [ primaryColor2, primaryColor1 ];
  static List<Color> get secondaryG => [secondaryColor2, secondaryColor1];

  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get lightGray => const Color(0xffF7F8F8);



}