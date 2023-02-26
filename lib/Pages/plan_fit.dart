// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class PlanFit extends StatefulWidget {
const  PlanFit({Key? key}) : super(key: key);

@override 
State<PlanFit> createState() => _PlanFitState();
}

class _PlanFitState extends State<PlanFit> {

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
              color: Color.fromARGB(255, 129, 74, 232),
            ),
          ],
        ),
      ),

      appBar: AppBar (
        title: Text(
          'P L A N   Y O U R   F I T',
         style: TextStyle(fontSize:16)),
      ),
    );
  }
}