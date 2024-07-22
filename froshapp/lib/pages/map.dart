
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
                padding: const EdgeInsets.only(bottom: 60.0, top: 10),
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
                    image: const DecorationImage(
                      image: AssetImage('assets/images/map.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InteractiveViewer(
                    minScale: 0.1,
                    maxScale: 4.0,
                    child: Image.asset(
                      'assets/images/map.png',
                      fit: BoxFit.cover,
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
                      print("Get Directions button pressed");
                      // Add your navigation logic here
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
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
                        SizedBox(width: 8),
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
