import 'package:flutter/material.dart';
import 'package:froshapp/pages/homepage.dart';
import 'package:froshapp/pages/map.dart';
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
import 'package:froshapp/splash/splash_screen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> imageAssets = [
    'assets/images/bgr.jpg',
    'assets/images/logo.png',
    'assets/images/githubicon2.png',
    'assets/images/meta.png',
    'assets/images/instagram.png',
    'assets/images/youtube.png',
    'assets/images/Gmail.png',
    'assets/images/web.png',
    'assets/images/hostelC.jpg'
    'assets/images/hostelD.jpg'
    'assets/images/hostelE.jpg'
    'assets/images/hostelL.jpeg'
    'assets/images/map.png'
  ];

  @override
  void initState() {
    super.initState();
    _precacheImages();
  }

  Future<void> _precacheImages() async {
    for (final asset in imageAssets) {
      await precacheImage(AssetImage(asset), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp(
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
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
        },
      ),
    );
  }
}