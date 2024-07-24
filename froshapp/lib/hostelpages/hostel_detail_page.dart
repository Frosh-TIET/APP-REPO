import 'package:flutter/material.dart';
import 'hostel_model.dart';

class HostelDetailPage extends StatelessWidget {
  final List<Hostel> hostels;
  final int currentIndex;

  HostelDetailPage({required this.hostels, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(screenHeight * 0.045),
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
              Expanded(
                child: PageView.builder(
                  controller: PageController(initialPage: currentIndex),
                  itemCount: hostels.length,
                  itemBuilder: (context, index) {
                    final hostel = hostels[index];
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
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.053),
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
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(bottom: screenHeight * 0.063),
                              child: Container(
                                height: screenHeight * 0.5,
                                width: screenHeight * 0.41,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(screenHeight * 0.0217),
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
        ),
      ),
    );
  }
}
