import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/widgets.dart';
import 'package:froshapp/leaderboard/leaderboard.dart';
import 'package:froshapp/leaderboard/leaderboard_item.dart';
import 'dart:ui';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final List<String> imagePaths = [
    'assets/images/event.png',
    'assets/images/event.png',
    'assets/images/event.png',
    'assets/images/event.png',
  ];

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
    LeaderboardItem(name: 'Hood 2', score: 0.4),
    LeaderboardItem(name: 'Hood 3', score: 0.7),
    LeaderboardItem(name: 'Hood 4', score: 0.5),
  ];

  List<String> texts = [
    'EVENT 1',
    'EVENT 2',
    'EVENT 3',
    'EVENT 4',
  ];

  List<String> dateOfEvent = [
    '1/8/24',
    '1/8/24',
    '1/8/24',
    '1/8/24',
    '1/8/24',
    '1/8/24',
    '1/8/24',
    '1/8/24',
    '1/8/24',
    '1/8/24'
  ];

  List<String> time = [
    '10:00 AM',
    '10:00 AM',
    '10:00 AM',
    '10:00 AM',
    '10:00 AM',
    '10:00 AM',
    '10:00 AM',
    '10:00 AM',
    '10:00 AM',
    '10:00 AM',
  ];

  List<String> location = [
    "Fete Area",
    "Fete Area",
    "Fete Area",
    "Fete Area",
    "Fete Area",
    "Fete Area",
    "Fete Area",
    "Fete Area",
    "Fete Area",
    "Fete Area",
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bgr.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Container(
                          height: screenHeight * 0.165,
                          width: screenWidth * 0.79,
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
                      flex: 2,
                      child: Swiper(
                        itemCount: imagePaths.length,
                        allowImplicitScrolling: true,
                        layout: SwiperLayout.DEFAULT,
                        autoplayDisableOnInteraction: true,
                        curve: Curves.decelerate,
                        viewportFraction: 0.8,
                        scale: 0.9,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: <Widget>[
                              Center(
                                child: Image.asset(
                                  imagePaths[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Center(
                                child: Container(
                                  //width: 90,
                                  //height: 90,
                                  //color: Colors.white,
                                  child: Text("Your Text here No ${index}",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: screenWidth * 0.95,
                        height: screenHeight * 0.14,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: screenWidth * 0.0059,
                            color: const Color.fromRGBO(180, 196, 0, 1),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: screenWidth * 0.04,
                            top: screenHeight * 0.0065,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "LEADERBOARD",
                                style: TextStyle(
                                  fontFamily: 'HomeFont',
                                  fontSize: 20,
                                  color: Color.fromRGBO(180, 196, 0, 1),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.001),
                              Expanded(
                                child: Leaderboard(items: leaderboardItems),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.126),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: screenHeight * 0.01,
            left: MediaQuery.of(context).size.width / 2 - 55,
            child: Container(
              height: screenHeight * 0.18,
              width: MediaQuery.of(context).size.width * 0.26,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  image: AssetImage("assets/images/Vector.png"),
                ),
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
