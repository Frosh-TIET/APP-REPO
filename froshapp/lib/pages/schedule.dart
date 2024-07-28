import 'package:flutter/material.dart';
import 'package:froshapp/leaderboard/leaderboard.dart';
import 'package:froshapp/leaderboard/leaderboard_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:ui';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  int _current = 0;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  late Future<List<String>> _imagePaths1Future;
  late Future<List<String>> _eventImagesFuture;
  late Future<String> _logoUrlFuture;

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
  void initState() {
    super.initState();
    _imagePaths1Future = _loadImages('images/grp', 10);
    _eventImagesFuture = _loadImages('images/event', 3);
    _logoUrlFuture = _getImageUrl('images/logo.png');
  }

  Future<List<String>> _loadImages(String folderPath, int count) async {
    List<String> urls = [];
    for (int i = 1; i <= count; i++) {
      String url = await _getImageUrl('images/schedule/b$i.webp');
      urls.add(url);
    }
    return urls;
  }

  Future<String> _getImageUrl(String path) async {
    try {
      return await _storage.ref(path).getDownloadURL();
    } catch (e) {
      print('Error fetching image URL: $e');
      return '';
    }
  }

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
                  child: FutureBuilder<String>(
                    future: _logoUrlFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(color: Colors.transparent,);
                      }
                      if (snapshot.hasError || !snapshot.hasData) {
                        return Icon(Icons.error);
                      }
                      return SizedBox(
                        height: screenHeight * 0.165,
                        width: screenHeight * 0.36,
                        child: CachedNetworkImage(
                          imageUrl: snapshot.data!,
                          fit: BoxFit.fill,
                          placeholder: (context, url) => CircularProgressIndicator(color: Colors.transparent,),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: FutureBuilder<List<String>>(
                  future: _eventImagesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(color: Colors.transparent,);
                    }
                    if (snapshot.hasError || !snapshot.hasData) {
                      return Icon(Icons.error);
                    }
                    List<String> imagePaths = snapshot.data!;
                    return CarouselSlider.builder(
                      itemCount: eventNames.length,
                      itemBuilder: (BuildContext context, int index, int realIdx) {
                        bool isCenter = index == _current;
                        return LayoutBuilder(
                          builder: (context, constraints) {
                            return Container(
                              decoration: BoxDecoration(color: Colors.transparent,
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(imagePaths[index]),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Column(
                                children: [
                                  // ... (rest of the carousel item content)
                                ],
                              ),
                            );
                          },
                        );
                      },
                      options: CarouselOptions(
                        // ... (carousel options remain the same)
                      ),
                    );
                  },
                ),
              ),
              // ... (leaderboard section remains the same)
              SizedBox(height: screenHeight * 0.16),
            ],
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.white.withOpacity(0.23),
            ),
          ),
          FutureBuilder<List<String>>(
            future: _imagePaths1Future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(color: Colors.transparent,);
              }
              if (snapshot.hasError || !snapshot.hasData) {
                return Icon(Icons.error);
              }
              List<String> imagePaths1 = snapshot.data!;
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  bool isEven = index % 2 == 1;
                  return Align(
                    alignment: isEven ? Alignment.centerLeft : Alignment.centerRight,
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
                            image: CachedNetworkImageProvider(imagePaths1[index]),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}