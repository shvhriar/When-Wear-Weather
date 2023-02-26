// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:loginui_1/closet_homepage.dart';
import 'Pages/page_1.dart';
import 'Pages/page_2.dart';

// ignore: use_key_in_widget_constructors
class MainPage extends StatelessWidget {

final _controller = PageController(initialPage: 0);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        children: [
        MyPost1(),
        MyPost2(),
        ClosetHomepage()
      ],
    ),
   );
  }
}
