import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'hostel_model.dart';
import 'dart:ui';
class HostelDetailPage extends StatefulWidget {
  final List<Hostel> hostels;
  final int initialIndex;

  HostelDetailPage({required this.hostels, required this.initialIndex});

  @override
  _HostelDetailPageState createState() => _HostelDetailPageState();
}

class _HostelDetailPageState extends State<HostelDetailPage> {
  double _textOpacity = 1.0;
  late int currentIndex;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  late SharedPreferences _prefs;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(
      initialPage: 10000 + currentIndex,
      viewportFraction: 1.0,
    );
    _initSharedPreferences();
    _preloadImages();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void _preloadImages() {
    for (int i = 0; i < 3 && i < widget.hostels.length; i++) {
      _getImageUrl(widget.hostels[i].imageUrl);
    }
  }

  Future<String> _getImageUrl(String imageURL) async {
    String? cachedUrl =   _prefs.getString(imageURL);
    if (cachedUrl != null) {
      return cachedUrl;
    }

    try {
      final ref = _storage.ref().child(imageURL);
      final url = await ref.getDownloadURL();
      await _prefs.setString(imageURL, url);
      return url;
    } catch (e) {
      print('Error fetching image URL: $e');
      return '';
    }
  }

  int _getWrappedIndex(int index) {
    return index % widget.hostels.length;
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            Navigator.pop(context);
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bgr.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.087,
              left: screenHeight * 0.012,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Column(
              children: [
                SafeArea(
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(screenHeight * 0.042),
                    child: Text(
                      "HOSTELS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.046,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: null, // Set to null for infinite scrolling
                    onPageChanged: (index) {
                      setState(() {
                        _textOpacity = 0.0;
                        currentIndex = _getWrappedIndex(index);
                      });
                      Future.delayed(Duration(milliseconds: 100), () {
                        setState(() {
                          _textOpacity = 1.0;
                        });
                      });
                    },
                    itemBuilder: (context, index) {
                      final wrappedIndex = _getWrappedIndex(index);
                      final hostel = widget.hostels[wrappedIndex];
                      return FutureBuilder<String>(
                        future: _getImageUrl(hostel.imageUrl),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: CircularProgressIndicator(
                              color: Colors.transparent,
                            ));
                          }
                          if (snapshot.hasError || !snapshot.hasData) {
                            return Center(child: Icon(Icons.error));
                          }
                          return AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: 1.0,
                            child: Container(
                              height: screenHeight * 0.8,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(60.0),
                                  topRight: Radius.circular(60.0),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(60.0),
                                      topRight: Radius.circular(60.0),
                                    ),
                                    // child: ImageFiltered(
                                    //   imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                      child: CachedNetworkImage(
                                        imageUrl: snapshot.data!,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                        placeholder: (context, url) => Container(color: Colors.black),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                      ),
                                    ),
                                  // ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.053),
                                      child: AnimatedOpacity(
                                        opacity: _textOpacity,
                                        duration: Duration(milliseconds: 300),
                                        child: Text(
                                          hostel.name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: screenHeight * 0.061,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                offset: Offset(3.0, 3.0),
                                                blurRadius: 5.0,
                                                color: Colors.black54,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: screenHeight * 0.063),
                                      child: Container(
                                        height: screenHeight * 0.5,
                                        width: screenHeight * 0.41,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.48),
                                          borderRadius:
                                              BorderRadius.circular(60),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                screenHeight * 0.0217),
                                            child: AnimatedOpacity(
                                              opacity: _textOpacity,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: Text(
                                                hostel.detail,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      screenHeight * 0.02  ,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}