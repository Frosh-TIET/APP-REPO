import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:widget_zoom/widget_zoom.dart';

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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: WidgetZoom(
                    heroAnimationTag: 'map',
                    zoomWidget: Image.asset(
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
                padding: EdgeInsets.only(
                    bottom: screenHeight * 0.01, right: screenWidth * 0.05),
                child: Container(
                  height: screenHeight * 0.06,
                  width: screenHeight * 0.215,
                  child: Link(
                    target: LinkTarget.blank,
                    uri: Uri.parse('https://www.froshtiet.com/templates/final.html'),
                    builder: (context, followlink) => ElevatedButton(
                      onPressed: followlink,
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Get Directions',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenHeight * 0.019,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.006),
                            child: Icon(
                              Icons.directions,
                              color: Color.fromARGB(255, 87, 166, 231),
                              size: screenHeight * 0.03,
                            ),
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