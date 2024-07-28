// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:froshapp/pages/homepage.dart';
import 'package:froshapp/pages/map.dart';
import 'package:froshapp/pages/schedule.dart';
import 'package:froshapp/pages/contactus.dart';
import 'package:froshapp/nav/bottomnavbar.dart';
// import 'dart:ui';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    Homepage(),
    Schedule(),
    CampusMap(),
    ContactUs()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_selectedIndex],
          // if (_isHomeBlurred)
          //   BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          //     child: Container(
          //       color: Colors.black.withOpacity(0),
          //     ),
          //   ),
        ],
      ),
      bottomNavigationBar: NavBar(
        onTabChange: (index) => _navigateBottomBar(index),
      ),
    );
  }
}
