// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginui_1/util/category.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Wardrobe extends StatefulWidget {
  const Wardrobe ({super.key});

  @override
  State <Wardrobe> createState() => _WardrobeState();
}

class _WardrobeState extends State<Wardrobe> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;
  final user = FirebaseAuth.instance.currentUser!;

  // list of clothing categories
  List myClothingCat = [
    // [ CategoryName, iconPath , on/off Status ]
    ["Tops", "lib/Icons/shirt.png", true],
    ["Bottoms", "lib/Icons/pants.png", false],
    ["Footwear", "lib/Icons/shoes.png", false],
    ["Accessories", "lib/Icons/accessories.png", false],
  ];

  // button switch
  void SwitchChanged(bool value, int index) {
    setState(() {
      myClothingCat[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu icon
                  Image.asset(
                    'lib/Icons/menu.png',
                    height: 20,
                    color: Colors.grey[800],
                  ),

                  // account icon
                  Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // welcome
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome,",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  ),
                    Text(
                    user.email!,
                    style: GoogleFonts.bebasNeue(fontSize: 40),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                thickness: 3,
                color:  Color.fromARGB(255, 203, 189, 218),
              ),
            ),

            const SizedBox(height: 25),

            // clothing categories grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                "Your Closet",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // grid
            Expanded(
              child: GridView.builder(
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 17),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0 / 1.1,
                ),
                itemBuilder: (context, index) {
                  return Category(
                    CategoryName: myClothingCat[index][0],
                    iconPath: myClothingCat[index][1],
                    buttonOn: myClothingCat[index][2],
                    onChanged: (value) => SwitchChanged(value, index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
