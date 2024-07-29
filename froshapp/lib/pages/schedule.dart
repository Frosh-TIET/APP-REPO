import 'package:flutter/material.dart';
import 'package:froshapp/leaderboard/leaderboard.dart';
import 'package:froshapp/leaderboard/leaderboard_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:ui';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

  final List<String> imagePaths1 = [
    'assets/images/b1.webp',
    'assets/images/b2.webp',
    'assets/images/b3.webp',
    'assets/images/b4.webp',
    'assets/images/b1.webp',
    'assets/images/b2.webp',
    'assets/images/b4.webp',
    'assets/images/b1.webp',
    'assets/images/b2.webp',
    'assets/images/b4.webp',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bgr.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),





          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.white.withOpacity(0.23),
            ),
          ),
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              bool isEven = index % 2 == 1;
              return Align(
                alignment:
                isEven ? Alignment.centerLeft : Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                  ),
                  child: Container(
                    width: screenWidth * 0.43,
                    height: screenHeight * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: Colors.black.withOpacity(0),
                      image: DecorationImage(
                        image: AssetImage(imagePaths1[index]),
                        fit: BoxFit.contain,
                      ),

                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}