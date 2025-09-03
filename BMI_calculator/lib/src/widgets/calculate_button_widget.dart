import 'package:flutter/material.dart';
class CalculateButtonWidget extends StatelessWidget {
  final String text;
  const CalculateButtonWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      alignment: Alignment.center,
      color: Color(0xFFE83D67),
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 32,  fontWeight: FontWeight.w700),),
    );
  }
}
