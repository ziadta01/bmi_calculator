import 'dart:math';
import 'package:bmi_calculator/bmi_result.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BMIMainScreen extends StatefulWidget {
  const BMIMainScreen({Key? key}) : super(key: key);

  @override
  State<BMIMainScreen> createState() => _BMIMainScreenState();
}

class _BMIMainScreenState extends State<BMIMainScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: backgroundColor,
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: backgroundColor,
        title: Text('BMI Calculator'.toUpperCase()),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60.0,
        color: bottomColor,
        child: TextButton(
          child: Text(
            "Calculate Your BMI".toUpperCase(),
            style: const TextStyle(
              letterSpacing: 1.5,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            setState(() {
              double result = weight / pow(height / 100, 2);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return BMIResult(
                      result: result,
                    );

                  },
                ),
              );
            });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: genderWidgetColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male,
                          size: 80.0,
                          color: isMale ? selectedColor : unselectedColor,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(
                            color: isMale ? selectedColor : unselectedColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: genderWidgetColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female,
                          size: 80.0,
                          color: !isMale ? selectedColor : unselectedColor,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                            color: !isMale ? selectedColor : unselectedColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: widgetsColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: widgetsTextColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${height.floor()}',
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: selectedColor,
                        ),
                      ),
                      Text(
                        'CM',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: widgetsTextColor,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    min: 100.0,
                    max: 300.0,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                    activeColor: bottomColor,
                    inactiveColor: unselectedColor,
                    value: height,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: widgetsColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: unselectedColor,
                        ),
                      ),
                      Text(
                        "$age",
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: selectedColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: 'ap',
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            mini: true,
                            backgroundColor: floatingActionButtonColor,
                            elevation: 20.0,
                            child: const Icon(Icons.add),
                          ),
                          FloatingActionButton(
                            heroTag: 'am',
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            mini: true,
                            backgroundColor: floatingActionButtonColor,
                            elevation: 20.0,
                            child: const Icon(Icons.remove),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: widgetsColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: unselectedColor,
                        ),
                      ),
                      Text(
                        "$weight",
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: selectedColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: 'wp',
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            mini: true,
                            backgroundColor: floatingActionButtonColor,
                            elevation: 20.0,
                            child: const Icon(Icons.add),
                          ),
                          FloatingActionButton(
                            heroTag: 'wm',
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            mini: true,
                            backgroundColor: floatingActionButtonColor,
                            elevation: 20.0,
                            child: const Icon(Icons.remove),
                          ),
                        ],
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
