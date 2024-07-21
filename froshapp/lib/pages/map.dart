import 'package:flutter/material.dart';

class CampusMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff8db3d7),
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 60.0, top: 10), // Padding between image and button
                child: InteractiveViewer(
                  minScale: 0.1,
                  maxScale: 4.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.75,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius:
                              15, // Increase blurRadius for softer shadow
                          offset: const Offset(0, 0), // Centered shadow
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/map.png'), // Replace with your image asset
                        fit: BoxFit.cover, // Cover the entire container
                      ),
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
                  height: 50,
                  width: 183.5,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your navigation logic here
                      print("Get Directions button pressed");
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 5, // Adjust elevation for shadow
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Rounded button corners
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 8),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'Get Directions',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 8), // Add space between text and icon
                        Icon(
                          Icons.directions,
                          color: Color.fromARGB(255, 87, 166, 231),
                        ),
                      ],
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
