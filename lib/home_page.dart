// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'Add_clothes.dart';
import 'Pages/plan_fit.dart';
import 'settings.dart';
import 'wardrobe.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  final user = FirebaseAuth.instance.currentUser!;

  int _selectedindex = 0;
 
  final List<Widget> _children = 
  [
    PlanFit(),
    Wardrobe(),
    AddClothes(),
    Settings(),
  ];

@override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Center(child: _children.elementAt(_selectedindex),),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.deepPurple.shade800,
            gap: 5,
            haptic: true,
            iconSize: 22,
            rippleColor: Colors.black,
            tabShadow: [BoxShadow(color: Colors.deepPurple.withOpacity(0.3), blurRadius: 23)],
            padding: EdgeInsets.all(17),
            tabs: const [
              GButton(icon: Icons.edit_calendar_rounded,
              text: 'Plan your fit'),
              GButton(icon: Icons.checkroom_outlined,
              text: 'Closet'),
              GButton(icon: Icons.add_a_photo_rounded,
              text: 'Add clothes'),
              GButton(icon: Icons.settings,
              text: 'Settings'),
            ],
            selectedIndex: _selectedindex,
            onTabChange: (index) {
              setState(() {
                _selectedindex = index;
              });
            },
          ),
        ),
      ),
    );
  } 
}