import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String CategoryName;
  final String iconPath;
  final bool buttonOn;
  void Function(bool)? onChanged;

  Category({
    super.key,
    required this.CategoryName,
    required this.iconPath,
    required this.buttonOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: buttonOn ? Colors.grey[900] : Color.fromARGB(255, 203, 189, 218),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // icon
              Image.asset(
                iconPath,
                height: 65,
                color: buttonOn ? Colors.white : Colors.black,
              ),

              // clothing category name + switch
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        CategoryName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                         color: buttonOn ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      value: buttonOn,
                     onChanged: onChanged,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}