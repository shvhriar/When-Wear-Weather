// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    Key? key,
    required this.showLoginPage,
    }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

//text controllers
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmpasswordController = TextEditingController();
final _firstNameController = TextEditingController();
final _lastNameController = TextEditingController();
final _ageController = TextEditingController();

@override
void dispose() {
  _emailController.dispose();
  _passwordController.dispose();
  _confirmpasswordController.dispose();
  _firstNameController.dispose();
  _lastNameController.dispose();
  _ageController.dispose();
  super.dispose();
}

Future signUp() async {
  if (passwordConfirmed()) {
    // Create user
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _emailController.text.trim(), 
    password: _passwordController.text.trim(),
    );

    // Add user details
    addUserDetails(
      _firstNameController.text.trim(),
      _lastNameController.text.trim(),
      _emailController.text.trim(),
      int.parse(_ageController.text.trim()),
    );
  }
}

Future addUserDetails(
  String firstName, String lastName, String email, int age) async {
await FirebaseFirestore.instance.collection('Users').add({
    'first name': firstName,
    'last name': lastName,
    'email': email,
    'age': age,
  });
}

bool passwordConfirmed() {
  if (_passwordController.text.trim() == _confirmpasswordController.text.trim()) {
    return true;
  } else {
    return false;
  }
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
            
                SizedBox(height: 45),
                
                  // Welcome to your closet!
                  Text(
            'HELLO THERE!',
            style: GoogleFonts.bebasNeue(
              fontSize: 39,
            ),
                  ),
                  SizedBox(height: 10),
                  Text(
            'Register below with your details!',
            style: TextStyle(
              fontSize: 17,
            ),
                  ),
                  SizedBox(height: 50),
                  
                //First name textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                       ),
                       hintText: 'First Name',
                       fillColor:  Colors.grey[200],
                       filled: true,
                ),
              ),
              ),
              SizedBox(height: 10),

               //Last name textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                       ),
                       hintText: 'Last Name',
                       fillColor:  Colors.grey[200],
                       filled: true,
                ),
              ),
              ),
              SizedBox(height: 10),

               //Age textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _ageController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                       ),
                       hintText: 'Age',
                       fillColor:  Colors.grey[200],
                       filled: true,
                ),
              ),
              ),
              
              SizedBox(height: 10),

                  //Email textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
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
                  contentPadding: EdgeInsets.all(10),
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

          //Confirm password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _confirmpasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                       ),
                       hintText: 'Confirm Password',
                       fillColor:  Colors.grey[200],
                       filled: true,
                ),
              ),
              ),
              
              SizedBox(height: 10),
          
                  // sign in button
                  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: signUp,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
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
                  SizedBox(height: 12),

                  //I am a member! Login now
                  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   Row(
                children: <Widget>[
                    Text(
                      'I am a member!', 
                      style: TextStyle(
                      fontSize:15
                       ),
                      ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        ' Login now', 
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
                   ],
              ),
            ),
          ),
      )
     );
  }
}
