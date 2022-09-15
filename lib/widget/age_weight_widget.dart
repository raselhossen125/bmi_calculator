// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_field

import 'package:flutter/material.dart';

class AgeWidget extends StatefulWidget {
  final Function(int) onChange;
  final String title;
  final int initialValue;
  final int min;
  final int max;

  AgeWidget({
    required this.onChange,
    required this.title,
    required this.initialValue,
    required this.min,
    required this.max,
  });

  @override
  State<AgeWidget> createState() => _AgeWidgetState();
}

class _AgeWidgetState extends State<AgeWidget> {
  int counter = 0;

  @override
  void initState() {
    counter = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.title,
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (counter > widget.min) {
                            counter--;
                          }
                        });
                        widget.onChange(counter);
                      },
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.deepOrange,
                        child: Icon(Icons.remove),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      counter.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (counter < widget.max) {
                            counter++;
                          }
                        });
                        widget.onChange(counter);
                      },
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.deepOrange,
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
