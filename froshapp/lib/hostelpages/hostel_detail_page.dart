import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'hostel_model.dart';

class HostelDetailPage extends StatefulWidget {
  final List<Hostel> hostels;
  final int initialIndex;

  HostelDetailPage({required this.hostels, required this.initialIndex});

  @override
  _HostelDetailPageState createState() => _HostelDetailPageState();
}

class _HostelDetailPageState extends State<HostelDetailPage> {
  late CarouselController _carouselController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Back Button Positioned in Top Left
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
          // Content
          Column(
            children: [
              // Title
              SafeArea(
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(screenHeight * 0.011),
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
              // Hostel Details Carousel
              Expanded(
                child: CarouselSlider.builder(
                  itemCount: widget.hostels.length,
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    height: screenHeight * 0.8,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: true,
                    initialPage: currentIndex,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final hostel = widget.hostels[index];
                    return Container(
                      height: screenHeight * 0.8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(60.0),
                          topRight: Radius.circular(60.0),
                        ),
                        image: DecorationImage(
                          image: AssetImage(hostel.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          // Hostel Name
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: screenHeight * 0.053),
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
                          // Hostel Detail
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: screenHeight * 0.063),
                              child: Container(
                                height: screenHeight * 0.5,
                                width: screenHeight * 0.41,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(screenHeight * 0.0217),
                                    child: Text(
                                      hostel.detail,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenHeight * 0.017,
                                      ),
                                      textAlign: TextAlign.center,
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}