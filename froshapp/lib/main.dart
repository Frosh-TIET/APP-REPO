import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:froshapp/API/firebase_api.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  Future<bool> checkFirstScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);
    if (!seen) {
      await prefs.setBool('seen', true);
    }
    return seen;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
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
