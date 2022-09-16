import 'package:bmi_nugro/constants/constant.dart';
import 'package:bmi_nugro/helpers/bmi_calculator.dart';
import 'package:bmi_nugro/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen(
      {Key? key,
      required this.bmi,
      required this.age,
      required this.gender,
      required this.height,
      required this.weight})
      : super(key: key);
  final double bmi;
  final int age;
  final String gender;
  final int height;
  final int weight;

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    //final bmiCategory =
    bmiCalculator.determineBmiCategory();
    //final bmiDesc =
    bmiCalculator.getHealRiskDescription();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.monitor_outlined),
            Text("  BMI RESULT"),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        gender == "male"
                            ? "assets/Male.png"
                            : "assets/Female.png",
                        // "asset",
                        height: 85,
                      ),
                      // Text(gender == "" ? "Not Selected" : "Gender = $gender"),
                      const SizedBox(width: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your age is $age Year",
                            style: infoTextStyle,
                          ),
                          Text(
                            "Your height is $height Cm",
                            style: infoTextStyle,
                          ),
                          Text(
                            "Your weight is $weight Kg",
                            style: infoTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    "Your Result",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: BmiCard(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          // ?? ""=>merupakan fungsi IF (jika bmiCalculator.bmiCategory == null maka tercetak kosong. Jika tidak maka mengembalikan nilai bmiCalculator.bmiCategory)
                          bmiCalculator.bmiCategory ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colorNew,
                          ),
                        ),
                        const SizedBox(height: 15),
                        primaryIcon,
                      ],
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      bmiCalculator.bmiDescription ?? "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: colorNew,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 60,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff517DF6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  Text(
                    " Recalculate BMI",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
