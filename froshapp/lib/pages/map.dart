import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class CampusMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff8db3d7),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: screenHeight * 0.07, top: screenHeight * 0.01),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: BoxDecoration(
                    color: Colors.white, // Add a background color here
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: InteractiveViewer(
                    minScale: 0.1,
                    maxScale: 4.0,
                    child: Image.asset(
                      'assets/images/map.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: SizedBox(
                  height: screenHeight * 0.063,
                  width: screenHeight * 0.23,
                  child: Link(
                    target: LinkTarget.blank,
                    uri: Uri.parse('https://www.froshtiet.com/'),
                    builder: (context, followlink) => ElevatedButton(
                      onPressed: followlink,
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.043, vertical: 8),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Get Directions',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenHeight * 0.0205,
                            ),
                          ),
                          SizedBox(width: screenHeight * 0.005),
                          Icon(
                            Icons.directions,
                            color: Color.fromARGB(255, 87, 166, 231),
                            size: screenHeight * 0.028,
                          ),
                        ],
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
  }
}
