import 'package:bmi_calculator/src/constants/app_constants.dart';
import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  final ValueNotifier<int> heightNotifier;
  const HeightWidget({required this.heightNotifier,super.key});

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  double height = 130;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.inactiveCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Height", style: AppTextStyles.propertyTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                height.toInt().toString(),
                style: AppTextStyles.numberTextStyle,
              ),
              Text("cm", style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
          Slider(
            value: height,
            onChanged: (double value) {
              setState(() {
                height = value;
              });
            },
            min: 130,
            max: 210,
            activeColor: Colors.red,
            inactiveColor: Colors.white,
            onChangeEnd: (double value){
              widget.heightNotifier.value = value.toInt();
            },

          ),
        ],
      ),
    );
  }
}
