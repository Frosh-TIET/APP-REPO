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
  int _current = 0;

  final List<String> imagePaths1 = [
    'assets/images/grp1.png',
    'assets/images/grp3.png',
    'assets/images/grp2.png',
    'assets/images/grp3.png',
    'assets/images/grp2.png',
    'assets/images/grp3.png',
    'assets/images/grp1.png',
    'assets/images/grp2.png',
    'assets/images/grp2.png',
    'assets/images/grp3.png',
  ];

  final List<LeaderboardItem> leaderboardItems = [
    LeaderboardItem(name: 'Hood 1', score: 0.3),
    LeaderboardItem(name: 'Hood 2', score: 0.5),
    LeaderboardItem(name: 'Hood 3', score: 0.7),
    LeaderboardItem(name: 'Hood 4', score: 0.5),
  ];
  final List<String> eventNames = [
    'ORIENTATION',
    'WHODUNIT',
    'BEG BORROW\nSTEAL'
  ];
  final List<String> imagePaths = [
    'assets/images/event.png',
    'assets/images/event.png',
    'assets/images/event.png',
  ];
  final List<String> eventDates = [
    '5 AUGUST 2024',
    '8 AUGUST 2024',
    '16 AUGUST 2024',
  ];
  List<String> time = [
    '10:00 AM',
    '10:00 AM',
    '10:00 AM',
  ];

  final List<String> location = ['TAN AUDI', 'SB/OP LAWNS', 'OAT'];

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
          Column(
            children: [
              Center(
                child: SafeArea(
                  child: Container(
                    height: screenHeight * 0.165,
                    width: screenHeight * 0.36,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: CarouselSlider.builder(
                  itemCount: eventNames.length,
                  itemBuilder: (BuildContext context, int index, int realIdx) {
                    bool isCenter = index == _current;
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imagePaths[index]),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(
                            children: [
                              Center(
                                //Event text and animation
                                child: AnimatedPadding(
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.easeInOut,
                                  padding: EdgeInsets.only(
                                    left: isCenter
                                        ? screenHeight * 0.028
                                        : screenHeight * 0.045,
                                    top: isCenter
                                        ? screenHeight * 0.04
                                        : screenHeight * 0.036,
                                  ),
                                  child: AnimatedAlign(
                                    duration: const Duration(milliseconds: 800),
                                    alignment: isCenter
                                        ? Alignment.topLeft
                                        : Alignment.center,
                                    child: AnimatedDefaultTextStyle(
                                      duration:
                                          const Duration(milliseconds: 800),
                                      style: TextStyle(
                                        fontSize: isCenter
                                            ? screenHeight * 0.025
                                            : screenHeight * 0.019,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        shadows: const <Shadow>[
                                          Shadow(
                                            offset: Offset(2, 4.0),
                                            blurRadius: 5.0,
                                            color:
                                                Color.fromRGBO(29, 29, 29, 0.3),
                                          ),
                                        ],
                                        fontFamily: 'MainFont',
                                      ),
                                      child: Text(
                                        eventNames[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: isCenter
                                      ? screenHeight * 0.002
                                      : screenHeight * 0.01),
                              //icons
                              AnimatedPadding(
                                duration: const Duration(milliseconds: 1500),
                                curve: Curves.linearToEaseOut,
                                padding: EdgeInsets.only(
                                  left: isCenter
                                      ? screenWidth * 0.07
                                      : screenHeight * 0.056,
                                  top: isCenter
                                      ? screenHeight * 0.03
                                      : screenHeight * 0.0,
                                ),
                                child: Column(
                                  children: [
                                    Align(
                                      //DATES
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_month_rounded,
                                            size: isCenter
                                                ? screenHeight * 0.026
                                                : screenHeight * 0.017,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              eventDates[index],
                                              style: TextStyle(
                                                fontSize: isCenter
                                                    ? screenHeight * 0.021
                                                    : screenHeight * 0.014,
                                                fontFamily: 'SubFont',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.007),
                                    Row(
                                      //TIMES
                                      children: [
                                        Icon(
                                          Icons.alarm_on_rounded,
                                          size: isCenter
                                              ? screenHeight * 0.026
                                              : screenHeight * 0.017,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            time[index],
                                            style: TextStyle(
                                              fontSize: isCenter
                                                  ? screenHeight * 0.021
                                                  : screenHeight * 0.014,
                                              fontFamily: 'SubFont',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: screenHeight * 0.007),
                                    //location
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_rounded,
                                          size: isCenter
                                              ? screenHeight * 0.026
                                              : screenHeight * 0.017,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            location[index],
                                            style: TextStyle(
                                              fontSize: isCenter
                                                  ? screenHeight * 0.021
                                                  : screenHeight * 0.014,
                                              fontFamily: 'SubFont',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.015),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.easeInOut,
                                padding: EdgeInsets.symmetric(
                                  vertical: isCenter
                                      ? screenHeight * 0.009
                                      : screenHeight * 0.005,
                                  horizontal: isCenter
                                      ? screenHeight * 0.0008
                                      : screenHeight * 0.0005,
                                ),
                                height: screenHeight * 0.05,
                                width: screenHeight * 0.22,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromRGBO(213, 224, 202, 1),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'BOOK NOW',
                                    style: TextStyle(
                                      fontFamily: 'ButtonFont',
                                      fontSize: isCenter
                                          ? screenHeight * 0.022
                                          : screenHeight * 0.02,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  options: CarouselOptions(
                    height: screenHeight * 0.3,
                    viewportFraction: 0.58,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlayInterval: const Duration(seconds: 10),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 1800),
                    autoPlayCurve: Curves.linearToEaseOut,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.145,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: screenWidth * 0.0059,
                      color: const Color.fromRGBO(126, 181, 208, 1),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.025,
                      top: screenHeight * 0.0030,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "LEADERBOARD",
                          style: TextStyle(
                            fontFamily: 'MainFont',
                            fontSize: screenHeight * 0.019,
                            color: const Color.fromRGBO(126, 181, 208, 1),
                          ),
                        ),
                        Leaderboard(items: leaderboardItems),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.16),
            ],
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
                      color: Colors.black,
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
