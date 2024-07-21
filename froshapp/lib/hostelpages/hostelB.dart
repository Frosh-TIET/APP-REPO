// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HostelBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bgr.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(35),
                child: Text(
                  "GIRLS HOSTEL",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
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
              Center(
                child: Container(
                  height: 713,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(60.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/hostelB.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                icon: Icon(Icons.arrow_back_ios_new_rounded),
                                color: Colors.black,
                                onPressed: (){
                                  Navigator.pushNamed(context, '/hostelE');
                                }
                            ),
                            const Text(
                              "Bla Bla \nHALL",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                
                                color: Colors.white,
                                fontSize: 55,
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
                            IconButton(
                                icon: Icon(Icons.arrow_forward_ios_rounded),
                                color: Colors.black,
                                onPressed: (){
                                  Navigator.pushNamed(context, '/hostelL');
                                }
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 30,
                        top: 250,
                        child: Container(
                          height: 400,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: const Text(
                                "Total Capacity: 234 \n \n "
                                "Vasudha Hall is one of the girls’ hostels on the Campus, offering a range of facilities to create a comfortable and convenient environment for female students. "
                                "The hostel has 234 seats, with various room configurations available to accommodate different preferences and needs. "
                                "The hostel provides a mess facility, ensuring students have access to quality and hygienically prepared food. "
                                "The mess menu caters to the hosteler's diverse tastes and nutritional requirements.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
