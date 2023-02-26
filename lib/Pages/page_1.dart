// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class MyPost1 extends StatefulWidget {
const  MyPost1({Key? key}) : super(key: key);

@override 
State<MyPost1> createState() => _MyPostState();
}

class _MyPostState extends State<MyPost1> {

// Create datetime variable
DateTime _dateTime = DateTime.now();

// Show date picker method
void _showDatePicker() {
  showDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(2000),
  lastDate: DateTime(2025),
  ).then((value) {
    setState(() {
      _dateTime = value!;
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Display chosen date
            Text(_dateTime.toString(), style: TextStyle(fontSize: 20)),

            // Button
            MaterialButton(
              onPressed: _showDatePicker,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Choose Date', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  )
                  ),
                ),
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
