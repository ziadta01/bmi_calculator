import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BMIResult extends StatelessWidget {
  final double? result;

  const BMIResult({Key? key, required this.result}) : super(key: key);

  Color resultColor() {
    if (result! <= 18.5) {
      return Colors.blue;
    } else if (result! > 18.5 && result! <= 24.9) {
      return Colors.green;
    } else if (result! > 25 && result! <= 29.9) {
      return Colors.yellow;
    } else if (result! > 30 && result! <= 34.9) {
      return Colors.brown;
    } else if (result! > 35 && result! <= 39.9) {
      return Colors.red;
    } else {
      return Colors.purple;
    }
  }

  String resultState() {
    if (result! <= 18.5) {
      return 'Underweight';
    } else if (result! > 18.5 && result! <= 24.9) {
      return 'Normal';
    } else if (result! > 25 && result! <= 29.9) {
      return 'Overweight';
    } else if (result! > 30 && result! <= 34.9) {
      return 'Obese';
    } else if (result! > 35 && result! <= 39.9) {
      return 'Severely Obese';
    } else {
      return 'Morbidly Obese';
    }
  }

  String resultComment() {
    if (result! <= 18.5) {
      return 'You are underweight.';
    } else if (result! > 18.5 && result! <= 24.9) {
      return 'You are at a healthy weight for your height.';
    } else if (result! > 25 && result! <= 29.9) {
      return 'You are slightly overweight.';
    } else if (result! > 30 && result! <= 34.9) {
      return 'You are heavily overweight. Your health may be at risk if you do not lose weight. You are recommended to talk to your doctor or a dietitian for advice.';
    } else if (result! > 35 && result! <= 39.9) {
      return 'You are heavily overweight. Your health may be at risk if you do not lose weight. You are recommended to talk to your doctor or a dietitian for advice.';
    } else {
      return 'You are heavily overweight. Your health may be at risk if you do not lose weight. You are recommended to talk to your doctor or a dietitian for advice.';
    }
  }

  String resultRange() {
    if (result! <= 18.5) {
      return '< 18.5 kg/m^2';
    } else if (result! > 18.5 && result! <= 24.9) {
      return '18.5 - 24.9 kg/m^2';
    } else if (result! > 25 && result! <= 29.9) {
      return '25 - 29.9 kg/m^2';
    } else if (result! > 30 && result! <= 34.9) {
      return '30 - 34.9 kg/m^2';
    } else if (result! > 35 && result! <= 39.9) {
      return '35 - 39.9 kg/m^2';
    } else {
      return '> 40  kg/m^2';
    }
  }

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
            "RE - Calculate Your BMI".toUpperCase(),
            style: const TextStyle(
              letterSpacing: 1.5,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Result',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: selectedColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                color: genderWidgetColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      resultState().toUpperCase(),
                      style: TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 20.0,
                          color: resultColor(),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "${result!.round()}",
                      style: TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 100.0,
                          color: selectedColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "${resultState()} BMI range:",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: unselectedColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      resultRange(),
                      style: TextStyle(
                          fontSize: 20.0,
                          color: selectedColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 60,),
                    Text(
                      resultComment(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: selectedColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
