import 'package:flutter/material.dart';
class AppColors{
  static const Color primary = Color(0xFF24263B);
  static const Color inactiveCard  = Color(0xFF333244);
  static const Color activeCard  = Color(0xFF24263B);
  static const Color accent = Color(0xFF24263B);
  static const Color button = Color(0xFF24263B);
}

class AppTextStyles {
  // text style appbar title
  static const TextStyle labelTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  // text style for male, female, age, height, and weight texts
  static const TextStyle propertyTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: Color(0xFF8B8C9E),
  );
  // text style calculate and re calculate buttons' texts
  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const TextStyle numberTextStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

}

final AppBar myAbbBar = AppBar(
  title: Text("BMI Calculator", style: AppTextStyles.labelTextStyle.copyWith(),),
  centerTitle: true,
);