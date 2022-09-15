// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_field, prefer_final_fields, sized_box_for_whitespace

import 'dart:math';

import 'package:bmi_calculator/pages/score_page.dart';
import 'package:bmi_calculator/widget/age_weight_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import '../widget/gender_widget.dart';
import '../widget/height_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI Calculator"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 90,
          padding: EdgeInsets.all(8),
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: GenderWidget(
                    onChange: (genderValue) {
                      _gender = genderValue;
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: HeightWidget(
                    onChange: (sliderValue) {
                      _height = sliderValue;
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AgeWidget(
                        onChange: (ageValue) {
                          _age = ageValue;
                        },
                        title: 'Age',
                        initialValue: 30,
                        min: 0,
                        max: 120,
                      ),
                      AgeWidget(
                        onChange: (weightValue) {
                          _weight = weightValue;
                        },
                        title: 'Weight',
                        initialValue: 50,
                        min: 0,
                        max: 200,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 20,
                  ),
                  child: SwipeableButtonView(
                      isFinished: _isFinished,
                      onFinish: () async {
                        await Navigator.push(
                            context,
                            PageTransition(
                                child:
                                    ScorePage(bmiScore: _bmiScore, age: _age),
                                type: PageTransitionType.fade));
                        setState(() {
                          _isFinished = false;
                        });
                      },
                      onWaitingProcess: () {
                        calculateBmi();
                        Future.delayed(Duration(seconds: 1), () {
                          setState(() {
                            _isFinished = true;
                          });
                        });
                      },
                      activeColor: Colors.deepOrange,
                      buttonWidget: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                      ),
                      buttonText: 'CALCULATE'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}
