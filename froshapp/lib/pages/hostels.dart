// hostel_page.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:froshapp/hostelpages/hostel_detail_page.dart';
import 'package:froshapp/hostelpages/hostel_model.dart';

class HostelPage extends StatefulWidget {
  HostelPage({Key? key}) : super(key: key);

  final List<Hostel> boysHostels = [
    Hostel(
        name: 'Hostel B',
        imageUrl: 'assets/images/hostelB.jpg',
        detail: 'Hostel B ki information'),
    Hostel(
        name: 'Hostel D',
        imageUrl: 'assets/images/hostelD.jpg',
        detail: 'Hostel D ki information'),
    Hostel(
        name: 'Hostel E',
        imageUrl: 'assets/images/hostelE.jpg',
        detail: 'Hostel E ki information'),
    Hostel(
        name: 'Hostel L',
        imageUrl: 'assets/images/hostelL.jpeg',
        detail: 'Hostel L ki information'),
  ];

  final List<Hostel> girlsHostels = [
    Hostel(
        name: 'Hostel B',
        imageUrl: 'assets/images/hostelB.jpg',
        detail: 'hello'),
    Hostel(
        name: 'Hostel D', imageUrl: 'assets/images/hostelD.jpg', detail: 'hi'),
    Hostel(
        name: 'Hostel E',
        imageUrl: 'assets/images/hostelE.jpg',
        detail: 'hola'),
    Hostel(
        name: 'Hostel L',
        imageUrl: 'assets/images/hostelL.jpeg',
        detail: 'namaste'),
  ];

  @override
  State<HostelPage> createState() => _HostelPageState();
}

class _HostelPageState extends State<HostelPage> {
  final CarouselController _carouselController1 = CarouselController();
  final CarouselController _carouselController2 = CarouselController();

  void _navigateToHostelDetail(List<Hostel> hostels, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HostelDetailPage(hostels: hostels, currentIndex: index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bgr.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: double.infinity,
              width: double.infinity,
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  SizedBox(height: screenHeight * 0.04),
                  Text(
                    'HOSTELS',
                    style: TextStyle(
                      fontSize: screenHeight * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    'Boys hostel',
                    style: TextStyle(
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenHeight * 0.01),
                    child: Divider(
                      color: Colors.white,
                      thickness: 1.5,
                      indent: screenHeight * 0.085,
                      endIndent: screenHeight * 0.085,
                    ),
                  ),
                  // Carousel for boys hostel
                  CarouselSlider(
                    carouselController: _carouselController1,
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      reverse: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      height: screenHeight * 0.16,
                      viewportFraction:
                          0.33, // Adjust viewportFraction as needed
                      onPageChanged: (index, reason) {},
                    ),
                    items: widget.boysHostels
                        .asMap()
                        .entries
                        .map((entry) => GestureDetector(
                              onTap: () => _navigateToHostelDetail(
                                  widget.boysHostels, entry.key),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.asset(
                                  entry.value.imageUrl,
                                  width: screenHeight * 0.125,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Text(
                    'Girls hostel',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenHeight * 0.01),
                    child: Divider(
                      color: Colors.white,
                      thickness: 1.5,
                      indent: screenHeight * 0.085,
                      endIndent: screenHeight * 0.085,
                    ),
                  ),
                  // Carousel for girls hostel
                  CarouselSlider(
                    carouselController: _carouselController2,
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      height: screenHeight * 0.16,
                      viewportFraction:
                          0.33, // Adjust viewportFraction as needed
                      onPageChanged: (index, reason) {},
                    ),
                    items: widget.girlsHostels
                        .asMap()
                        .entries
                        .map((entry) => GestureDetector(
                              onTap: () => _navigateToHostelDetail(
                                  widget.girlsHostels, entry.key),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.asset(
                                  entry.value.imageUrl,
                                  width: screenHeight * 0.125,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
