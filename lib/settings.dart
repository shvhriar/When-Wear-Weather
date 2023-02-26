import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState(); 
}

final user = FirebaseAuth.instance.currentUser!;

class _SettingsState extends State<Settings> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'S E T T I N G S',
         //user.email!,
         style: TextStyle(fontSize:16),
            ),
            actions: [
              GestureDetector(
              onTap: (){
                FirebaseAuth.instance.signOut();
              },
              child: Icon(Icons.logout),
              ),
            ],
      ),
      body: Center(
        child: Text('This is the Settings page'),
      )
    );
  }
}
