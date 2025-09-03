import 'package:bmi_calculator/src/constants/app_constants.dart';
import 'package:bmi_calculator/src/models/bmi_result.dart';
import 'package:bmi_calculator/src/widgets/calculate_button_widget.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.bmiResult});
  final BmiResult bmiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAbbBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Your Result",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: AppColors.inactiveCard, borderRadius: BorderRadius.circular(12)),
              width: double.infinity,
              margin: EdgeInsets.all(20).copyWith(bottom: 40, top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 50,),
                  Text(bmiResult.category, style: TextStyle(color: bmiResult.color, fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(height: 20,),
                  Text(bmiResult.score.toStringAsFixed(0), style: TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.bold),),
                  SizedBox(height: 50,),
                  Text(bmiResult.interpretation, style: AppTextStyles.propertyTextStyle,textAlign: TextAlign.center,)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: CalculateButtonWidget(text: "Re-Calculate"),
          ),

        ],
      ),
    );
  }
}
