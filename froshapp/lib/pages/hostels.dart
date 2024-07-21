import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HostelPage extends StatefulWidget {
  HostelPage({Key? key}) : super(key: key);

  final List<String> _images1 = [
    'assets/images/hostelB.jpg',
    'assets/images/hostelD.jpg',
    'assets/images/hostelE.jpg',
    'assets/images/hostelL.jpeg',
  ];
  final List<String> _images2 = [
    'assets/images/hostelB.jpg',
    'assets/images/hostelD.jpg',
    'assets/images/hostelE.jpg',
    'assets/images/hostelL.jpeg',
  ];

  @override
  State<HostelPage> createState() => _HostelPageState();
}

class _HostelPageState extends State<HostelPage> {
  final CarouselController _carouselController1 = CarouselController();
  final CarouselController _carouselController2 = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  void _navigateToPage(int index) {
    Navigator.pushNamed(context, getRoute(index));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
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
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                SizedBox(
                  height: 50,
                ),
                const Text(
                  'HOSTELS',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Boys hostel',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 1.5,
                  indent: 80,
                  endIndent: 80,
                ),
                // Carousel for boys hostel
                CarouselSlider(
                  carouselController: _carouselController1,
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    reverse: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    height: 146,
                    viewportFraction: 114 / MediaQuery.of(context).size.width,
                    onPageChanged: (index, reason) {},
                  ),
                  items: widget._images2
                      .asMap()
                      .entries
                      .map((entry) => GestureDetector(
                            onTap: () => _navigateToPage(entry.key),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(entry.value,
                                  width: 90, fit: BoxFit.cover),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Girls hostel',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 1.5,
                  indent: 80,
                  endIndent: 80,
                ),
                // Carousel for girls hostel
                CarouselSlider(
                  carouselController: _carouselController2,
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    height: 146,
                    viewportFraction: 114 / MediaQuery.of(context).size.width,
                    onPageChanged: (index, reason) {},
                  ),
                  items: widget._images1
                      .asMap()
                      .entries
                      .map((entry) => GestureDetector(
                            onTap: () => _navigateToPage(entry.key),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(entry.value,
                                  width: 90, fit: BoxFit.cover),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  String getRoute(int index) {
    switch (index) {
      case 0:
        return '/hostelB';
      case 1:
        return '/hostelD';
      case 2:
        return '/hostelE';
      case 3:
        return '/hostelL';
      default:
        return '/';
    }
  }
}
