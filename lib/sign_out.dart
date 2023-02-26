import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignOutt extends StatefulWidget {
  const SignOutt({Key? key}) : super(key: key);

@override
  State<SignOutt> createState() => _SignOuttState();
}

class _SignOuttState extends State<SignOutt> {
  final user = FirebaseAuth.instance.currentUser!;

   @override
      Widget build(BuildContext context) {
        return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signed in as: ' + user.email!),
            MaterialButton(onPressed: (){
              FirebaseAuth.instance.signOut();
            },
            color: Colors.deepPurple[200],
            child: Text(' Sign Out '),
            )
          ],
        ),
      ), 
      backgroundColor: Color.fromARGB(255, 240, 239, 239)
      ); 
    }
  }