import 'package:bmi_nugro/constants/constant.dart';
import 'package:flutter/material.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi) {
    //this.bmi = bmi;
  }

  double calculateBmi() {
    double heightInMeter = (height! / 100);

    final h = (heightInMeter * heightInMeter);
    bmi = weight! / h;
    return bmi!;
  }

  String determineBmiCategory() {
    String category = "";
    if (bmi! < 16.0) {
      category = underweightSevere;
      colorNew = const Color(0xffFFD700);
      primaryIcon = const Icon(
        Icons.warning_amber_sharp,
        color: Color(0xffFFD700),
        size: 50,
      );
    } else if (bmi! < 17) {
      category = underweightModerate;
      colorNew = const Color(0xffFFD700);
      primaryIcon = const Icon(
        Icons.warning_amber_outlined,
        color: Color(0xffFFD700),
        size: 50,
      );
    } else if (bmi! < 18.5) {
      category = underweightMild;
      colorNew = const Color(0xffFFD700);
      primaryIcon = const Icon(
        Icons.warning_amber_rounded,
        color: Color(0xffFFD700),
        size: 50,
      );
    } else if (bmi! < 25) {
      category = normal;
      colorNew = const Color(0xff1C9963);
      primaryIcon = const Icon(
        Icons.gpp_good,
        color: Color(0xff1C9963),
        size: 50,
      );
    } else if (bmi! < 30) {
      category = overweight;
      colorNew = const Color(0xffF4A460);
      primaryIcon = const Icon(
        Icons.warning,
        color: Color(0xffF4A460),
        size: 50,
      );
    } else if (bmi! < 35) {
      category = obeseI;
      colorNew = const Color(0xffFF0000);
      primaryIcon = const Icon(
        Icons.dangerous_outlined,
        color: Color(0xffFF0000),
        size: 50,
      );
    } else if (bmi! < 40) {
      category = obeseII;
      colorNew = const Color(0xffFF0000);
      primaryIcon = const Icon(
        Icons.dangerous_rounded,
        color: Color(0xffFF0000),
        size: 50,
      );
    } else if (bmi! >= 40) {
      category = obeseIII;
      colorNew = const Color(0xffFF0000);
      primaryIcon = const Icon(
        Icons.dangerous,
        color: Color(0xffFF0000),
        size: 50,
      );
    }

    bmiCategory = category;
    return bmiCategory!;
  }

  String getHealRiskDescription() {
    String desc = "";
    switch (bmiCategory!) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutritional deficiency and osteoporosis.";
        colorNew = const Color(0xffFFD700);
        break;
      case normal:
        desc = "Low risk (healthy range).";
        colorNew = const Color(0xff1C9963);
        break;
      case overweight:
        desc =
            "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes millitus.";
        colorNew = const Color(0xffF4A460);
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes millitus.";
        colorNew = const Color(0xffFF0000);
        break;
      default:
    }

    bmiDescription = desc;
    return bmiDescription!;
  }
}
