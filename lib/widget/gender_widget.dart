// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {
  final Function(int) onChange;
  
  GenderWidget({
    required this.onChange,
  });

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {

  int _gender = 0;
  final ChoiceChip3DStyle selectedStyle = ChoiceChip3DStyle(
              topColor: Colors.grey[200]!,
              backColor: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            );

  final ChoiceChip3DStyle unSelectedStyle = ChoiceChip3DStyle(
              topColor: Colors.white,
              backColor: Colors.grey[300]!,
              borderRadius: BorderRadius.circular(20),
            );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style: _gender == 1 ? selectedStyle : unSelectedStyle,
            selected: _gender == 1,
            onSelected: () {
              setState(() {
                _gender = 1;
              });
              widget.onChange(_gender);
            }, 
            onUnSelected: () {}, 
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Image.asset('images/man.png', width: 50,height: 50, fit: BoxFit.cover,),
                  SizedBox(height: 5,),
                  Text('Male'),
                ],
              ),
            ),
          ),
          SizedBox(width: 20,),
          ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style: _gender == 2 ? selectedStyle : unSelectedStyle,
            selected: _gender == 2,
            onSelected: () {
              setState(() {
                _gender = 2;
              });
              widget.onChange(_gender);
            }, 
            onUnSelected: () {}, 
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Image.asset('images/woman.png', width: 50,height: 50, fit: BoxFit.cover,),
                  SizedBox(height: 5,),
                  Text('Female'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}