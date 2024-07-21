import 'package:flutter/material.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:froshapp/leaderboard/leaderboard.dart';
import 'package:froshapp/leaderboard/leaderboard_item.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isMenuOpen = false;
  bool _isGestureDetectorActive = false;
  int _current = 0;
  final bool _isPressed = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _isGestureDetectorActive = _isMenuOpen;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final List<String> _eventNames = [
      'ORIENTATION',
      'WHODUNIT',
      'WITTY\nVENDATTA',
      'ELYSIRA',
      'E-SPORTS\nMANIA',
      'BEG BORROW\nSTEAL'
    ];
    final List<String> imagePaths = [
      'assets/images/event.png',
      'assets/images/event.png',
      'assets/images/event.png',
      'assets/images/event.png',
      'assets/images/event.png',
      'assets/images/event.png',
    ];
    final List<String> _eventDates = [
      '5 AUGUST 2024',
      '8 AUGUST 2024',
      '10 AUGUST 2024',
      '12 AUGUST 2024',
      '14 AUGUST 2024',
      '16 AUGUST 2024',
    ];
    List<String> time = [
      '10:00 AM',
      '10:00 AM',
      '10:00 AM',
      '10:00 AM',
      '10:00 AM',
      '10:00 AM',
    ];

    List<String> _location = [
      'TAN AUDI',
      'SB/OP LAWNS',
      'MAIN AUDI',
      'MAIN AUDI',
      'FETE AREA',
      'OAT'
    ];
    // final List<String> _bookingLinks = [
    //   'https://www.froshtiet.com/',
    //   'https://www.froshtiet.com/',
    //   'https://www.froshtiet.com/',
    //   'https://www.froshtiet.com/',
    //   'https://www.froshtiet.com/',
    //   'https://www.froshtiet.com/',
    // ];

    final List<LeaderboardItem> leaderboardItems = [
      LeaderboardItem(name: 'Hood 1 ', score: 0.3),
      LeaderboardItem(name: 'Hood 2 ', score: 0.7),
      LeaderboardItem(name: 'Hood 3 ', score: 0.5),
      LeaderboardItem(name: 'Hood 4 ', score: 0.9),
    ];

    return Scaffold(
      body: Stack(
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
                Expanded(
                  flex: 3,
                  child: CarouselSlider.builder(
                    itemCount: _eventNames.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIdx) {
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
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.easeInOut,
                                    padding: EdgeInsets.only(
                                        left: isCenter
                                            ? screenWidth * 0.063
                                            : screenHeight * 0.045,
                                        top: isCenter
                                            ? screenHeight * 0.04
                                            : screenHeight * 0.036),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        _eventNames[index],
                                        style: TextStyle(
                                            fontSize: isCenter
                                                ? screenHeight * 0.025
                                                : screenHeight * 0.019,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            shadows: <Shadow>[
                                              const Shadow(
                                                  offset: Offset(2, 4.0),
                                                  blurRadius: 5.0,
                                                  color: Color.fromRGBO(
                                                      29, 29, 29, 0.3))
                                            ],
                                            fontFamily: 'MainFont'),
                                      ),
                                    ),
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 1500),
                                  curve: Curves.bounceOut,
                                  padding: EdgeInsets.only(
                                      left: isCenter
                                          ? screenWidth * 0.07
                                          : screenHeight * 0.056,
                                      top: isCenter
                                          ? screenHeight * 0.03
                                          : screenHeight * 0.0),
                                  child: Column(
                                    children: [
                                      Align(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_month_rounded,
                                              size: isCenter ? 24 : 24,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                _eventDates[index],
                                                style: TextStyle(
                                                    fontSize:
                                                        isCenter ? 18 : 14,
                                                    fontFamily: 'SubFont',
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.alarm_on_rounded,
                                            size: isCenter ? 24 : 20,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              time[index],
                                              style: TextStyle(
                                                  fontSize: isCenter ? 18 : 14,
                                                  fontFamily: 'SubFont',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_rounded,
                                            size: isCenter ? 24 : 20,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              _location[index],
                                              style: TextStyle(
                                                  fontSize: isCenter ? 18 : 14,
                                                  fontFamily: 'SubFont',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.easeInOut,
                                  padding: EdgeInsets.symmetric(
                                    vertical: isCenter ? 10 : 5,
                                    horizontal: isCenter ? 30 : 15,
                                  ),
                                  height: 45,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: _isPressed
                                        ? Colors.black
                                        : const Color.fromRGBO(
                                            213, 224, 202, 1),
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
                                        fontSize: isCenter ? 20 : 14,
                                        fontWeight: FontWeight.w700,
                                        color: _isPressed
                                            ? Colors.white
                                            : Colors.black,
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
                      height: 320,
                      viewportFraction: 0.6,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 1200),
                      autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
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
                SizedBox(height: screenHeight * 0.006),
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
                        top: screenHeight * 0.0029,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "LEADERBOARD",
                            style: TextStyle(
                              fontFamily: 'MainFont',
                              fontSize: screenHeight * 0.025,
                              color: const Color.fromRGBO(180, 196, 0, 1),
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
          if (_isGestureDetectorActive)
            GestureDetector(
              onTap: _toggleMenu,
              child: Container(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          if (_isGestureDetectorActive)
            AbsorbPointer(
              absorbing: _isMenuOpen,
              child: GestureDetector(
                onTap: _toggleMenu,
                child: Container(
                  color: Colors.transparent,
                  height: double.infinity,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.02),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: screenHeight * 0.18,
                width: screenWidth * 0.26,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage("assets/images/Vector.png"),
                  ),
                ),
              ),
            ),
          ),
          CircularMenu(
            toggleButtonSize:
                _isMenuOpen ? screenHeight * 0.16 : screenHeight * 0.1,
            toggleButtonColor: Colors.transparent,
            toggleButtonIconColor: Colors.transparent,
            radius: screenWidth * 0.35,
            toggleButtonOnPressed: _toggleMenu,
            items: [
              CircularMenuItem(
                badgeLabel: 'Society',
                icon: Icons.person,
                color: const Color.fromRGBO(180, 196, 0, 1),
                onTap: () {
                  Navigator.pushNamed(context, '/society');
                },
              ),
              CircularMenuItem(
                icon: Icons.search,
                color: const Color.fromRGBO(180, 196, 0, 1),
                onTap: () {
                  Navigator.pushNamed(context, '/aboutus');
                },
              ),
              CircularMenuItem(
                icon: Icons.circle,
                color: const Color.fromRGBO(180, 196, 0, 1),
                onTap: () {
                  Navigator.pushNamed(context, '/hostels');
                },
              ),
              CircularMenuItem(
                icon: Icons.square,
                color: const Color.fromRGBO(180, 196, 0, 1),
                onTap: () {
                  Navigator.pushNamed(context, '/lifetiet');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
