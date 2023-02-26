// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key,required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

//text controllers
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

Future signIn() async {
  // loading circle
  showDialog(
    context: context,
    builder: (context) {
      return Center(child: CircularProgressIndicator());
    },
  );

  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailController.text.trim(), 
    password: _passwordController.text.trim(),
    );

    //Pop the loading circle
    Navigator.of(context).pop();
}

@override
  void dispose() {
  _emailController.dispose();
  _passwordController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          
                // ignore: sized_box_for_whitespace
                Container(
                  height: 145,
                  child: Image.asset(
                    'lib/Icons/clothing.png'
                    ),
                  ),
            
                SizedBox(height: 45),
                
                  // Welcome to your closet!
                  Text(
            'Welcome to your closet!',
            style: GoogleFonts.bebasNeue(
              fontSize: 39,
            ),
                  ),
                  SizedBox(height: 10),
                  Text(
            'You\'ve been missed',
            style: TextStyle(
              fontSize: 17,
            ),
                  ),
                  SizedBox(height: 50),
                  
            //Not a member? Register Now
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   Row(
                children: <Widget>[
                    Text(
                      'Not a member?', 
                      style: TextStyle(
                      fontSize:15
                       ),
                      ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                        ' Register Now', 
                        style: TextStyle(
                          fontSize:15, 
                          color: Colors.deepPurple, 
                          fontWeight: FontWeight.bold
                           ),
                          ),
                    ),
                  ],
                ),
              ],
                ),
            ),
          
  //Email textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _emailController,
                decoration:  InputDecoration(
                  contentPadding: EdgeInsets.all(13),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                       ),
                       hintText: 'Email',
                       fillColor:  Colors.grey[200],
                       filled: true,
                ),
              ),
              ),
              
              SizedBox(height: 10),
              
            //Password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(13),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                       ),
                       hintText: 'Password',
                       fillColor:  Colors.grey[200],
                       filled: true,
                ),
              ),
              ),
          SizedBox(height: 10),

          // Forgot Password?
                  Padding(
            padding: const EdgeInsets.all(7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
               ),
              ],
            ),
                  ),
          
                  // sign in button
                  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: signIn,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
                   ),
                  SizedBox(height: 25),
          
                  // Sign in button Apple
                 Row(
                   children: <Widget>[
            Expanded(
             child: Padding(
               padding: const EdgeInsets.only(left: 15, right:7),
               child: SignInButton(
                Buttons.AppleDark, 
                text: 'SIGN IN',
                onPressed: (){
          
                }
                ),
             ),
            ),
               // Sign in button Facebook
             Expanded(
             child: Padding(
               padding: const EdgeInsets.all(7),
               child: SignInButton(
                Buttons.FacebookNew, 
                text: 'SIGN IN',
                onPressed: (){
          
                }
                ),
             ),
             ),
               // Sign in button Google
             Expanded(
             child: Padding(
               padding: const EdgeInsets.only(left: 7, right:15),
               child: SignInButton(
                Buttons.Google, 
                text: 'SIGN IN',
                onPressed: (){
          
                }
                ),
             ),
             ),
                   ],
                 ),
                  ],
                 ),
          ),
      ),
     ),
    );
  }
}