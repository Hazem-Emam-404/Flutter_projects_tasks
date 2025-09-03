import 'package:bmi_calculator/src/constants/app_constants.dart';
import 'package:flutter/material.dart';

class MaleFemaleWidget extends StatefulWidget {
  final ValueNotifier<String> genderNotifier;
  const MaleFemaleWidget({super.key, required this.genderNotifier});

  @override
  State<MaleFemaleWidget> createState() => _MaleFemaleWidgetState();
}

class _MaleFemaleWidgetState extends State<MaleFemaleWidget> {
  bool _male_selected = false;
  bool _femal_selected = false;
  _toggleGenderSelection(String gender) {
    setState(() {
      if (gender.toLowerCase() == 'male') {
        _male_selected = true;
        _femal_selected = false;
      } else {
        _male_selected = false;
        _femal_selected = true;
      }
      widget.genderNotifier.value = gender;
    });
  }

  String getSelectedGender() {
    if (!_femal_selected && !_male_selected) return 'none';
    if (!_femal_selected) return 'female';
    return 'male';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                _toggleGenderSelection('male');
              },
              child: GenderContainer(
                text: "Male",
                icon: Icons.male,
                color: _male_selected
                    ? AppColors.activeCard
                    : AppColors.inactiveCard,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                _toggleGenderSelection('female');
              },
              child: GenderContainer(
                text: "Female",
                icon: Icons.female,
                color: _femal_selected
                    ? AppColors.activeCard
                    : AppColors.inactiveCard,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenderContainer extends StatelessWidget {
  const GenderContainer({
    required this.text,
    required this.icon,
    required this.color,
    super.key,
  });
  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 130),
          Text(text, style: AppTextStyles.propertyTextStyle),
        ],
      ),
    );
  }
}
