import 'package:bmi_calculator/src/models/bmi_result.dart';
import 'package:flutter/material.dart';
class BmiCalculator{
  static BmiResult calculate({required double height, required double weight}) {
    final double heightInMeter = height / 100;
    final double bmi = weight / (heightInMeter * heightInMeter);

    String category;
    String interpretation;
    Color color = Colors.white;
    if (bmi < 18.5) {
      category = 'Underweight';
      interpretation = 'Eat a bit more.';
      color = Color(0XFF5F7F9C);
    }
    else if (bmi < 25) {
      category = 'Normal';
      interpretation = 'You Have a Normal Body Weight, Good Job.';
      color = Color(0XFF2C9445);
    } else if (bmi < 30) {
      category = 'Overweight';
      interpretation = 'Exercise more';
      color = Color(0XFFA29920);
    }
    else if (bmi < 35) {
      category = 'Obese';
      interpretation = 'Exercise twice a week';
      color = Color(0XFFA9551E);
    }
    else {
      category = 'Extremely Obese';
      interpretation = 'Exercise minimum 4 times a week';
      color = Color(0XFFAF3A3A);
    }


    return BmiResult(
      score: bmi,
      category: category,
      interpretation: interpretation,
      color: color
    );
  }}
