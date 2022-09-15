// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class ScorePage extends StatelessWidget {
  final double bmiScore;
  final int age;

  String? bmiStatus;
  String? bmiInterpretation;
  Color? bmiStatusColor;

  ScorePage({
    required this.bmiScore,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Score"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your score',
                style: TextStyle(fontSize: 30, color: Colors.deepOrange),
              ),
              SizedBox(
                height: 10,
              ),
              PrettyGauge(
                minValue: 0,
                maxValue: 40,
                gaugeSize: 300,
                segments: [
                  GaugeSegment('UnderWeight', 18.5, Colors.blue),
                  GaugeSegment('Normal', 6.4, Colors.green),
                  GaugeSegment('OverWeight', 5, Colors.pink),
                  GaugeSegment('Obese', 10.1, Colors.purple),
                ],
                valueWidget: Text(
                  bmiScore.toStringAsFixed(1),
                  style: TextStyle(fontSize: 40),
                ),
                currentValue: bmiScore.toDouble(),
                needleColor: Colors.deepOrange,
              ),
              Text(
                bmiStatus!,
                style: TextStyle(fontSize: 20, color: bmiStatusColor),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                bmiInterpretation!,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Re Calculate')),
                  // SizedBox(
                  //   width: 20,
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Share.share(
                  //         "Your BMI is ${bmiScore.toStringAsFixed(1)} at age $age");
                  //   },
                  //   child: const Text("Share"),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor = Colors.pink;
    } else if (bmiScore >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise & reduce the weight";
      bmiStatusColor = Colors.purple;
    } else if (bmiScore >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy, You are fit";
      bmiStatusColor = Colors.green;
    } else if (bmiScore < 18.5) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Try to increase the weight";
      bmiStatusColor = Colors.red;
    }
  }
}
