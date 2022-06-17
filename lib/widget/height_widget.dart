// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_final_fields, unused_field

import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  final Function(int) onChange;

  HeightWidget({
    required this.onChange,
  });

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  int _height = 150;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text(
              'Height',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$_height',
                  style: TextStyle(fontSize: 35),
                ),
                SizedBox(width:5),
                Text(
                  'cm',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
            Slider(
              min: 0,
              max: 240,
              // thumbColor: Colors.yellow,
              value: _height.toDouble(), 
              onChanged: (sliderValue) {
                setState(() {
                  _height = sliderValue.toInt();
                });
                widget.onChange(_height);
              },
            ),
          ],
        ),
      ),
    );
  }
}
