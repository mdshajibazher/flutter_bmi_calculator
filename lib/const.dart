import 'package:flutter/material.dart';

const backgroundColor = Colors.lightBlue;
const textLabelStyle = TextStyle(
  color: Colors.white70,
  fontSize: 22,
);
const textValueStyle = TextStyle(
  color: Colors.white,
  fontSize: 40,
);

const resultTextStyle = TextStyle(
    letterSpacing: 1.2,
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.white
);

abstract final class BMI{
  static const String underWeightSevere = 'Underweight (Severe thinness)';
  static const String underWeightModerate = 'Underweight (Moderate thinness)';
  static const String underWeightMild = 'Underweight (Mild thinness)';
  static const String NormalRange = 'Normal range	';
  static const String OverweightPreObese = 'Overweight (Pre-obese)';
  static const String ObeseClass1 = 'Obese (Class I)';
  static const String ObeseClass2 = 'Obese (Class II)	';
  static const String ObeseClass3 = 'Obese (Class III)';
}

enum BmiUnit{
  m,ft,kg,lb,
}