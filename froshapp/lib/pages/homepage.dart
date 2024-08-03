import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:froshapp/leaderboard/leaderboard.dart';
import 'package:froshapp/leaderboard/leaderboard_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:froshapp/pages/aboutus.dart';
import 'package:froshapp/pages/hostels.dart';
import 'package:froshapp/pages/lifetiet.dart';
import 'package:froshapp/pages/society.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:froshapp/video_loader/VideoLoadingScreen.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

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
  late Future<String> _imageUrlFuture;

  final List<String> imagePaths = [
    'assets/images/event.png',
    'assets/images/event.png',
    'assets/images/event.png',
    'assets/images/event.png',
    'assets/images/event.png',
    'assets/images/event.png',
  ];

  List<String> eventNames = [];
  List<String> eventDates = [];
  List<String> time = [];
  List<String> location = [];
  List<String> buttonTexts = [];
  List<String> buttonLinks = [];
  bool isLoading = true;

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
    _imageUrlFuture = getImageUrl();
    fetchEventData();
  }

  Future<void> fetchEventData() async {
    try {
      // First, try to load data from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final cachedData = prefs.getString('eventData');

      if (cachedData != null) {
        // If cached data exists, use it
        final decodedData = json.decode(cachedData);
        setState(() {
          eventNames = List<String>.from(decodedData['eventNames']);
          eventDates = List<String>.from(decodedData['eventDates']);
          time = List<String>.from(decodedData['time']);
          location = List<String>.from(decodedData['location']);
          buttonTexts = List<String>.from(decodedData['buttonTexts']);
          buttonLinks = List<String>.from(decodedData['buttonLinks']);
          isLoading = false;
        });
      }

      // Fetch fresh data from Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('events')
          .orderBy('date')
          .get();

      List<String> newEventNames = [];
      List<String> newEventDates = [];
      List<String> newTime = [];
      List<String> newLocation = [];
      List<String> newButtonTexts = [];
      List<String> newButtonLinks = [];

      for (var doc in querySnapshot.docs) {
        String name = (doc['name'] as String).replaceAll('\\n', '\n');
        newEventNames.add(name);
        newEventDates.add(doc['date'] as String);
        newTime.add(doc['time'] as String);
        newLocation.add(doc['location'] as String);
        newButtonTexts.add(doc['buttonText'] as String);
        newButtonLinks.add(doc['buttonLink'] as String);
      }

      // Update the state with fresh data
      setState(() {
        eventNames = newEventNames;
        eventDates = newEventDates;
        time = newTime;
        location = newLocation;
        buttonTexts = newButtonTexts;
        buttonLinks = newButtonLinks;
        isLoading = false;
      });

      // Cache the fresh data
      await cacheEventData();
    } catch (e) {
      print('Error fetching event data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> cacheEventData() async {
    final prefs = await SharedPreferences.getInstance();
    final eventData = {
      'eventNames': eventNames,
      'eventDates': eventDates,
      'time': time,
      'location': location,
      'buttonTexts': buttonTexts,
      'buttonLinks': buttonLinks,
    };
    await prefs.setString('eventData', json.encode(eventData));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

    Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  Future<String> getImageUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedUrl = prefs.getString('logoUrl');

    if (cachedUrl != null) {
      return cachedUrl;
    }

    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      String imageUrl =
          await storage.ref('images/logo/logo.png').getDownloadURL();

      // Cache the URL
      await prefs.setString('logoUrl', imageUrl);

      return imageUrl;
    } catch (e) {
      print('Error fetching logo URL: $e');
      return ''; // Return an empty string or a default URL in case of error
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final List<LeaderboardItem> leaderboardItems = [
      LeaderboardItem(name: 'Oathkeepers    ', score: 0.4),
      LeaderboardItem(name: 'Stormbreakers  ', score: 0.5),
      LeaderboardItem(name: 'Tridents        ', score: 0.8),
      LeaderboardItem(name: 'Deathstars     ', score: 0.3),
    ];

    return Scaffold(
      drawer: Container(
        width: screenWidth * 0.53,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Drawer(
            backgroundColor: Colors.black.withOpacity(0),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                SizedBox(height: screenHeight * 0.08),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.017, left: screenWidth * 0.001),
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
                      )
                          .animate()
                          .fadeIn() // uses Animate.defaultDuration
                          .scale() // inherits duration from fadeIn
                          .moveX(delay: 100.ms, duration: 200.ms)
                      // runs after the above w/new duration
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
                      'Our Team',
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
        ).animate().fadeIn().moveX(delay: 20.ms, duration: 500.ms),
      ),
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
                  child: FutureBuilder<String>(
                    future: _imageUrlFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: screenHeight * 0.165,
                          width: screenHeight * 0.36,
                          color: Colors.transparent,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.transparent,
                            ),
                          ),
                        );
                      } else if (snapshot.hasError ||
                          !snapshot.hasData ||
                          snapshot.data!.isEmpty) {
                        return Container(
                          height: screenHeight * 0.165,
                          width: screenHeight * 0.36,
                          color: Colors.transparent,
                          child: Center(
                            child: Text('No image available'),
                          ),
                        );
                      } else {
                        return Container(
                          height: screenHeight * 0.165,
                          width: screenHeight * 0.36,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: CachedNetworkImage(
                            imageUrl: snapshot.data!,
                            fit: BoxFit.contain,
                            placeholder: (context, url) => Container(
                              color: Colors.transparent,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : CarouselSlider.builder(
                        itemCount: eventNames.length,
                        itemBuilder:
                            (BuildContext context, int index, int realIdx) {
                          bool isCenter = index == _current;
                          return LayoutBuilder(
                            builder: (context, constraints) {
                              return Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        imagePaths[index % imagePaths.length]),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      AnimatedPadding(
                                        duration:
                                            const Duration(milliseconds: 700),
                                        curve: Curves.easeInOut,
                                        padding: EdgeInsets.only(
                                          top: isCenter
                                              ? screenHeight * 0.038
                                              : screenHeight * 0.028,
                                        ),
                                        child: AnimatedAlign(
                                          duration:
                                              const Duration(milliseconds: 800),
                                          alignment: isCenter
                                              ? Alignment.topLeft
                                              : Alignment.center,
                                          child: AnimatedDefaultTextStyle(
                                            duration: const Duration(
                                                milliseconds: 800),
                                            style: TextStyle(
                                              fontSize: isCenter
                                                  ? screenHeight * 0.029
                                                  : screenHeight * 0.019,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w900,
                                              fontFamily: 'Main',
                                  
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset: Offset(1, 1),
                                                  blurRadius: 1.5,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                  
                                            child: Center(
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                eventNames[index],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: isCenter
                                              ? screenHeight * 0.001
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text(
                                                      eventDates[index],
                                                      style: TextStyle(
                                                        fontSize: isCenter
                                                            ? screenHeight *
                                                                0.0185
                                                            : screenHeight *
                                                                0.014,
                                                        fontFamily: 'Sub',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                                height: screenHeight * 0.007),
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
                                                            : screenHeight *
                                                                0.017,
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
                                                          ? screenHeight * 0.0185
                                                          : screenHeight * 0.014,
                                                      fontFamily: 'Sub',
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                height: screenHeight * 0.007),
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
                                                          ? screenHeight * 0.0185
                                                          : screenHeight * 0.014,
                                                      fontFamily: 'Sub',
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
                                      GestureDetector(
                                        onTap: () async {
                                          try {
                                            await _launchURL(buttonLinks[index]);
                                          } catch (e) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      'Could not launch URL: $e')),
                                            );
                                          }
                                        },
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
                                            color: Colors.black,
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
                                              buttonTexts[index],
                                              style: TextStyle(
                                                fontFamily: 'Sub',
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
                                    ],
                                  ),
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
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.23,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: screenWidth * 0.007,
                    color: Colors.black.withOpacity(0),
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
                      SizedBox(height: screenHeight * 0.014),
                      Text(
                        "LEADERBOARD",
                        style: TextStyle(
                          fontFamily: 'Main',
                          fontSize: screenHeight * 0.019,
                          color: Color(0xfff9f5ec).withOpacity(0.9),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.025),
                      Leaderboard(items: leaderboardItems),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
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
