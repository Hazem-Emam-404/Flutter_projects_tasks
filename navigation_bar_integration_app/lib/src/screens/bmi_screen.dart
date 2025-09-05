import 'package:bmi_calculator/src/calculators/bmi_calculator.dart';
import 'package:bmi_calculator/src/models/bmi_result.dart';
import 'package:bmi_calculator/src/screens/result_screen.dart';
import 'package:bmi_calculator/src/widgets/calculate_button_widget.dart';
import 'package:bmi_calculator/src/widgets/male_female_widget.dart';
import 'package:bmi_calculator/src/widgets/weight_age_widget.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/src/constants/app_constants.dart';
import 'package:bmi_calculator/src/widgets/height_widget.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert", style: TextStyle(color: Colors.white)),
          content: const Text(
            "Please choose the gender first",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // close the popup
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> selectedGenderNotifier = ValueNotifier<String>(
      "none",
    );
    final ValueNotifier<int> personHeightNotifier = ValueNotifier<int>(130);
    final ValueNotifier<int> personAgeNotifier = ValueNotifier<int>(10);
    final ValueNotifier<int> personWeightNotifier = ValueNotifier<int>(40);

    void onCalculatePressed() {}

    return Scaffold(
      appBar: myAbbBar,
      body: Column(
        children: [
          Expanded(
            child: MaleFemaleWidget(genderNotifier: selectedGenderNotifier),
          ),
          Expanded(child: HeightWidget(heightNotifier: personHeightNotifier)),
          Expanded(
            child: WeightAgeWidget(
              weightNotifier: personWeightNotifier,
              ageNotifier: personAgeNotifier,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (selectedGenderNotifier.value == "none") {
                _showPopup(context);
              } else {
                BmiResult result = BmiCalculator.calculate(
                  height: personHeightNotifier.value.toDouble(),
                  weight: personWeightNotifier.value.toDouble(),
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(bmiResult: result)));
              }
            },
            child: CalculateButtonWidget(text: "Calculate"),
          ),
        ],
      ),
    );
  }
}
