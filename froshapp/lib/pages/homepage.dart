import 'package:flutter/material.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:froshapp/leaderboard/leaderboard.dart';
import 'package:froshapp/leaderboard/leaderboard_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/link.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  bool _isMenuOpen = false;
  int _current = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..repeat(reverse: true);
    _animation = Tween(begin: -0.3, end: 0.3).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastEaseInToSlowEaseOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final List<String> eventNames = [
      'ORIENTATION\n',
      'WHODUNIT\n',
      'WITTY\nVENDATTA',
      'ELYSERRA\n',
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
    final List<String> eventDates = [
      '5 AUGUST ',
      '8 AUGUST ',
      '10 AUGUST ',
      '12 AUGUST ',
      '14 AUGUST ',
      '16 AUGUST ',
    ];
    List<String> time = [
      '10:00 AM',
      '10:00 AM',
      '10:00 AM',
      '10:00 AM',
      '10:00 AM',
      '10:00 AM',
    ];
    List<String> location = [
      'TAN AUDI',
      'SB/OP LAWNS',
      'MAIN AUDI',
      'MAIN AUDI',
      'FETE AREA',
      'OAT'
    ];

    final List<LeaderboardItem> leaderboardItems = [
      LeaderboardItem(name: 'Hood 1 ', score: 0.3),
      LeaderboardItem(name: 'Hood 2 ', score: 0.5),
      LeaderboardItem(name: 'Hood 3 ', score: 0.8),
      LeaderboardItem(name: 'Hood 4 ', score: 0.2),
    ];

    return SafeArea(
        child: Scaffold(
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
              Column(
                children: [
                  Center(
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
                  Expanded(
                    flex: 3,
                    child: CarouselSlider.builder(
                      itemCount: eventNames.length,
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
                                    //Event text and animation
                                    child: AnimatedPadding(
                                      duration:
                                      const Duration(milliseconds: 800),
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
                                        duration:
                                        const Duration(milliseconds: 800),
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
                                                color: Color.fromRGBO(
                                                    29, 29, 29, 0.3),
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
                                    duration:
                                    const Duration(milliseconds: 1500),
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
                                                padding: const EdgeInsets.only(
                                                    left: 10),
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
                                            AnimatedBuilder(
                                              animation: _animation,
                                              builder: (context, child) {
                                                return Transform.rotate(
                                                  angle: _animation.value,
                                                  child: Icon(
                                                    Icons.alarm_on_rounded,
                                                    size: isCenter
                                                        ? screenHeight * 0.026
                                                        : screenHeight * 0.017,
                                                  ),
                                                );
                                              },
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
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
                                              padding: const EdgeInsets.only(
                                                  left: 10),
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
                                  Link(
                                    target: LinkTarget.blank,
                                    uri:
                                    Uri.parse('https://www.froshtiet.com/'),
                                    builder: (context, followlink) =>
                                        GestureDetector(
                                          onTap: followlink,
                                          child: AnimatedContainer(
                                            duration:
                                            const Duration(milliseconds: 800),
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
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              color: const Color.fromRGBO(
                                                  213, 224, 202, 1),
                                              boxShadow: [
                                                BoxShadow(
                                                  color:
                                                  Colors.black.withOpacity(0.5),
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
                                        ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      options: CarouselOptions(
                        height: screenHeight * 0.32,
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
                    padding:
                    EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Container(
                      width: screenWidth * 0.95,
                      height: screenWidth * 0.28,
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
                                color: const Color.fromRGBO(180, 196, 0, 1),
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
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: screenHeight * 0.12,
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
        ));

  }
}