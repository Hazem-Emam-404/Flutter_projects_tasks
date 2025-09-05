import 'package:bmi_calculator/src/constants/app_constants.dart';
import 'package:flutter/material.dart';

class WeightAgeWidget extends StatefulWidget {
  final ValueNotifier<int> weightNotifier;
  final ValueNotifier<int> ageNotifier;
  const WeightAgeWidget({
    super.key,
    required this.weightNotifier,
    required this.ageNotifier,
  });

  @override
  State<WeightAgeWidget> createState() => _MaleFemaleWidgetState();
}

class _MaleFemaleWidgetState extends State<WeightAgeWidget> {



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: PropertyContainer(text: "Weight", min: 40, max: 200, notifier: widget.weightNotifier )
          ),
          Expanded(
            child: PropertyContainer(text: "Age", min: 10, max: 80, notifier: widget.ageNotifier )
          ),
        ],
      ),
    );
  }
}

class PropertyContainer extends StatefulWidget {
  final String text;
  final int min;
  final int max;
  final ValueNotifier<int> notifier;
  int value = 0;
  PropertyContainer({
    required this.text,
    required this.min,
    required this.max,
    required this.notifier,
    super.key,
  }){value = min;}
  @override
  State<PropertyContainer> createState() => _PropertyContainerState();
}

class _PropertyContainerState extends State<PropertyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.inactiveCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.text,style: AppTextStyles.propertyTextStyle,),
          Text(widget.value.toString(), style: AppTextStyles.numberTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  if(widget.value > widget.min){
                    setState(() {
                      widget.value --;
                      widget.notifier.value = widget.value;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.grey,
                  shadowColor: Colors.black,
                  elevation: 4
                ),
                child: Icon(Icons.remove, color: Colors.white, size: 25,),
              ),
              ElevatedButton(
                onPressed: () {
                  if(widget.value < widget.max){
                    setState(() {
                      widget.value ++;
                      widget.notifier.value = widget.value;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.grey,
                  shadowColor: Colors.black,
                  elevation: 4,

                ),
                child: Icon(Icons.add, color: Colors.white, size: 25,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
