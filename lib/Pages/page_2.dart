// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyPost2 extends StatefulWidget {
  const MyPost2({Key? key}) : super(key: key);

@override 
_MyPost2State createState() => _MyPost2State();
}

class _MyPost2State extends State<MyPost2> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[300], 
      backgroundColor: Color.fromARGB(255, 129, 116, 149), 
      body: Center(
      child: OverflowBox(
      minHeight: 310, 
      maxHeight: 310,
        child: Lottie.network('https://assets10.lottiefiles.com/private_files/lf30_y9czxcb9.json'), 
         ),
       ), 
    );
  }
}
