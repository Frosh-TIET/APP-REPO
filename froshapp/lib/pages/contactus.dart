import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bgr.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.165,
                  width: MediaQuery.of(context).size.height * 0.36,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.25, 20, 20),
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    if (!await launchUrl(
                        Uri.parse('https://github.com/Frosh-TIET'))) {
                      throw 'Could not launch https://www.github.com/';
                    }
                  },
                  child: Transform.scale(
                    scale: 0.77,
                    child: Image.asset('assets/images/githubicon2.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (!await launchUrl(
                        Uri.parse('https://www.facebook.com/froshtiet/'))) {
                      throw 'Could not launch https://www.facebook.com/';
                    }
                  },
                  child: Transform.scale(
                    scale: 1.2,
                    child: Image.asset('assets/images/meta.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (!await launchUrl(
                        Uri.parse('https://www.instagram.com/froshtiet/'))) {
                      throw 'Could not launch https://www.instagram.com/';
                    }
                  },
                  child: Transform.scale(
                    scale: 1.2,
                    child: Image.asset('assets/images/instagram.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.035),
                  child: GestureDetector(
                    onTap: () async {
                      if (!await launchUrl(
                          Uri.parse('https://www.youtube.com/froshtiet/'))) {
                        throw 'Could not launch https://www.youtube.com/';
                      }
                    },
                    child: Transform.scale(
                      scale: 1.2,
                      child: Image.asset('assets/images/youtube.png'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (!await launchUrl(Uri.parse('mailto:frosh@thapar.edu'))) {
                      throw 'Could not launch https://www.gmail.com/';
                    }
                  },
                  child: Transform.scale(
                    scale: 1.2,
                    child: Image.asset('assets/images/Gmail.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (!await launchUrl(
                        Uri.parse('https://www.froshtiet.com/'))) {
                      throw 'Could not launch https://www.froshtiet.com/';
                    }
                  },
                  child: Transform.scale(
                    scale: 1.2,
                    child: Image.asset('assets/images/web.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
