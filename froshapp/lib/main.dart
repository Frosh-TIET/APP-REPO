// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:froshapp/pages/homepage.dart';
import 'package:froshapp/pages/map.dart';
import 'package:froshapp/nav/refer_nav.dart';
import 'package:froshapp/pages/schedule.dart';
import 'package:froshapp/pages/contactus.dart';
import 'package:froshapp/pages/society.dart';
import 'package:froshapp/pages/aboutus.dart';
import 'package:froshapp/pages/hostels.dart';
import 'package:froshapp/pages/lifetiet.dart';
import 'package:froshapp/froshpages/core.dart';
import 'package:froshapp/froshpages/faculty.dart';
import 'package:froshapp/froshpages/mentors.dart';
import 'package:froshapp/froshpages/osc.dart';
import 'package:froshapp/hostelpages/hostelB.dart';
import 'package:froshapp/hostelpages/hostelD.dart';
import 'package:froshapp/hostelpages/hostelE.dart';
import 'package:froshapp/hostelpages/hostelL.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/homepage': (context) => Homepage(),
        '/map': (context) => CampusMap(),
        '/schedule': (context) => Schedule(),
        '/contactus': (context) => ContactUs(),
        '/society': (context) => SocietyPage(),
        '/aboutus': (context) => AboutUsPage(),
        '/hostels': (context) => HostelPage(),
        '/lifetiet': (context) => LifeThaparPage(),
        '/faculty': (context) => Faculty(),
        '/core': (context) => Core(),
        '/osc': (context) => Osc(),
        '/mentors': (context) => Mentors(),
        '/hostelB': (context) => HostelBPage(),
        '/hostelD': (context) => HostelDPage(),
        '/hostelE': (context) => HostelEPage(),
        '/hostelL': (context) => HostelLPage(),
      },
    );
  }
}

class OfflinePage extends StatelessWidget {
  const OfflinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/FROSHlogo.png', // Replace with your app logo asset path
              width: MediaQuery.of(context).size.height * 0.22,
              height: MediaQuery.of(context).size.width * 0.22,
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.22),
            Icon(
              Icons.wifi_off,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.12,
            ),
          ],
        ),
      ),
    );
  }
}