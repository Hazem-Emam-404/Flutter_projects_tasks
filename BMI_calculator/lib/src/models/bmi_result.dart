import 'package:flutter/material.dart';
class BmiResult {
  final double score;
  final String category;
  final String interpretation;
  final Color color;

  BmiResult({
    required this.score,
    required this.category,
    required this.interpretation,
    required this.color,
  });
}
