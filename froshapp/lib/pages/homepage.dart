import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:froshapp/leaderboard/leaderboard.dart';
import 'package:froshapp/leaderboard/leaderboard_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:froshapp/pages/aboutus.dart';
import 'package:froshapp/pages/hostels.dart';
import 'package:froshapp/pages/lifetiet.dart';
import 'package:froshapp/pages/society.dart';
import 'package:url_launcher/link.dart';
import 'package:froshapp/video_loader/VideoLoadingScreen.dart';
import 'dart:ui';
import 'package:flutter/animation.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
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

    return Scaffold(
      drawer: Container(
        width: screenWidth * 0.53,
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5), // Adjust sigmaX and sigmaY for desired blur effect
          child: Drawer(
            backgroundColor: Colors.black.withOpacity(
                0), // Transparent background to see through the blur
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[

                SizedBox(height: screenHeight * 0.08),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight*0.017,left: screenWidth*0.001),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0),
                      borderRadius: BorderRadius.circular(screenHeight * 0.025),
                    ),
                    width: screenWidth * 0.0048,

                    child: ListTile(
                      leading: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: screenHeight * 0.04,
                      ).animate().fadeIn() // uses `Animate.defaultDuration`
                          .scale() // inherits duration from fadeIn
                          .moveX(delay: 100.ms, duration: 200.ms) // runs after the above w/new duration
                      ,

                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.1),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(screenHeight * 0.025),
                  ),
                  width: screenWidth * 0.0048,
                  child: ListTile(
                    leading: const Icon(
                      Icons.groups,
                      color: Colors.white,
                    ),
                    title: Text(
                      'About Us',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.048,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        VideoPageRoute(
                          page: AboutUsPage(),
                          videoAsset: 'assets/videos/load.mp4',
                        ),
                      );
                    },
                  ),
                ).animate().fadeIn().moveX(delay: 20.ms, duration: 400.ms),
                SizedBox(height: screenHeight * 0.04),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(screenHeight * 0.025),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.home_work_rounded,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Hostels',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.048,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        VideoPageRoute(
                          page: HostelPage(),
                          videoAsset: 'assets/videos/load.mp4',
                        ),
                      );
                    },
                  ),
                ).animate().fadeIn().moveX(delay: 20.ms, duration: 400.ms),
                SizedBox(height: screenHeight * 0.04),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(screenHeight * 0.025),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.local_activity,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Societies',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.048,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        VideoPageRoute(
                          page: SocietyPage(),
                          videoAsset: 'assets/videos/load.mp4',
                        ),
                      );
                    },
                  ),
                ).animate().fadeIn().moveX(delay: 20.ms, duration: 400.ms),
                SizedBox(height: screenHeight * 0.04),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(screenHeight * 0.025),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.sports_basketball,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Life at Thapar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.048,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        VideoPageRoute(
                          page: LifeThaparPage(),
                          videoAsset: 'assets/videos/load.mp4',
                        ),
                      );
                    },
                  ),
                ).animate().fadeIn().moveX(delay: 20.ms, duration: 400.ms),
              ],
            ),
          ),
        ),
      ).animate().fadeIn().moveX(delay: 20.ms, duration: 500.ms),
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
              SafeArea(
                child: Center(
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
                              Link(
                                target: LinkTarget.blank,
                                uri: Uri.parse('https://www.froshtiet.com/'),
                                builder: (context, followlink) =>
                                    GestureDetector(
                                      onTap: followlink,
                                      child: AnimatedContainer(
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
                                          color: Colors.black,
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
                                              color: Colors.white,
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
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.13,
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
          Positioned(
            top: screenHeight * 0.1,
            left: screenWidth * 0.02,
            child: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  size: screenWidth * 0.085,
                  color: Colors.white,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}