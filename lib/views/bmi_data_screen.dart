import 'package:bmi_nugro/constants/constant.dart';
import 'package:bmi_nugro/helpers/bmi_calculator.dart';
import 'package:bmi_nugro/views/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 60;
  int age = 20;
  String gender = "male";

  // double calculateBmi() {
  //   double heighInMeter = height / 100;
  //   final h = (heighInMeter * heighInMeter);
  //   final bmi = weight / h;
  //   return bmi;
  // }

  List<Widget> generateList(start, end) {
    List<Widget> weights = [];
    for (var i = start; i < end; i++) {
      weights.add(
        Text(
          "$i",
          style: labelTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      );
    }
    return weights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        leading: const Icon(Icons.home_outlined),
        elevation: 0,
        title: const Text("BMI CALCULATOR"),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          final bmiCalculator = BmiCalculator(height: height, weight: weight);
          bmiCalculator.calculateBmi();

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) {
                return BmiResultScreen(
                  bmi: bmiCalculator.bmi!,
                  age: age,
                  gender: gender,
                  height: height,
                  weight: weight,
                );
              }),
            ),
          );
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
                  Icons.calculate_outlined,
                  color: Colors.white,
                  size: 25,
                ),
                Text(
                  " Calculate BMI",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            )),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(height: 210),
                // Part Expand Male
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "male";
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor: (gender == "male")
                          ? const Color(0xff517DF6)
                          : Colors.white,
                      child: Stack(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: GenderIconText(
                                icon: Icons.male,
                                title: 'Male',
                                image: 'assets/Male.png',
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: (gender == "male")
                                  ? const Color(0xff517DF6)
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Part Expand Female
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "female";
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor: (gender == "female")
                          ? const Color(0xff517DF6)
                          : Colors.white,
                      child: Stack(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: GenderIconText(
                                icon: Icons.female,
                                title: 'Female',
                                image: 'assets/Female.png',
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: (gender == "female")
                                  ? const Color(0xff517DF6)
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                Text(
                  "HEIGHT",
                  style: labelTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: BmiCard(
                        child: Slider(
                          value: height.toDouble(),
                          min: 80,
                          max: 200,
                          thumbColor: Colors.red,
                          activeColor: const Color(0xff517DF6),
                          inactiveColor: Colors.grey,
                          onChanged: (value) {
                            height = value.toInt();
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    BmiCard(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 15.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "$height",
                              style: labelTextStyle,
                            ),
                            Text(
                              " cm",
                              style: labelTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "WEIGHT",
                        style: labelTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BmiCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: CupertinoPicker(
                                scrollController: FixedExtentScrollController(
                                    initialItem: 40),
                                itemExtent: 25,
                                magnification: 2,
                                useMagnifier: true,
                                onSelectedItemChanged: (val) {
                                  // print(val);
                                  weight = val + 20;
                                  // print(weight);
                                },
                                children: generateList(20, 220),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "AGE",
                        style: labelTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BmiCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: CupertinoPicker(
                                scrollController:
                                    FixedExtentScrollController(initialItem: 5),
                                itemExtent: 25,
                                magnification: 2,
                                useMagnifier: true,
                                onSelectedItemChanged: (val) {
                                  // print(val);
                                  age = val + 15;
                                  // print(age);
                                },
                                children: generateList(15, 90),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = Colors.white,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(-2, 2),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.2),
          )
        ],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor!),
      ),
      margin: const EdgeInsets.all(15),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.image,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String image;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Icon(
        //   icon,
        //   size: 80,
        //   color: primaryColor,
        // )
        Image.asset(
          image,
          height: 100,
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
