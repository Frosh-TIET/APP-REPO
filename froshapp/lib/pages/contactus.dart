import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bgr.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter, // move downwards by 0.05
              child: Container(
                height: screenHeight * 0.165,
                width: screenWidth * 0.79,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.3, -0.6), // left aligned
              child: GestureDetector(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(
                      'https://www.linkedin.com/company/frosh-tiet/?originalSubdomain=in'))) {
                    throw 'Could not launch https://www.linkedin.com/';
                  }
                },
                child: Transform.scale(
                  scale: 0.2, // increase the scale by 20%
                  child: Image.asset('assets/images/linkedin.png'),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.5, 0.17), // left aligned
              child: GestureDetector(
                onTap: () async {
                  if (!await launchUrl(
                      Uri.parse('https://www.facebook.com/froshtiet/'))) {
                    throw 'Could not launch https://www.facebook.com/froshtiet/';
                  }
                },
                child: Transform.scale(
                  scale: 1.2, // increase the scale by 20%
                  child: Image.asset('assets/images/meta.png'),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.5, 0.64), // left aligned
              child: GestureDetector(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(
                      'https://www.instagram.com/froshtiet/?hl=en/'))) {
                    throw 'Could not launch https://www.instagram.com/';
                  }
                },
                child: Transform.scale(
                  scale: 1.2, // increase the scale by 10%
                  child: Image.asset('assets/images/instagram.png'),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.5, -0.27), // right aligned

              child: GestureDetector(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(
                      'https://www.youtube.com/@FroshTIET/videos/'))) {
                    throw 'Could not launch https://www.instagram.com/';
                  }
                },
                child: Transform.scale(
                  scale: 1.2, // increase the scale by 20%
                  child: Image.asset('assets/images/youtube.png'),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.5, 0.16), // right aligned

              child: GestureDetector(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(
                      'https://mail.google.com/mail/u/0/?pli=1#inbox?compose=CllgCJfqbpnBzPxWsnLDmpHgQCZKbcHntVSWchDzZwjXvXhDHXhMjzCTkQgmZNXQNLHzJxTXhXV'))) {
                    throw 'Could not launch https://mail.google.com.';
                  }
                },
                child: Transform.scale(
                  scale: 1.2, // increase the scale by 10%
                  child: Image.asset('assets/images/Gmail.png'),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.5, 0.64), // right aligned
              child: GestureDetector(
                onTap: () async {
                  if (!await launchUrl(
                      Uri.parse('https://www.froshtiet.com/'))) {
                    throw 'Could not launch https://www.google.com/';
                  }
                },
                child: Transform.scale(
                  scale: 1.2, // increase the scale by 10%
                  child: Image.asset('assets/images/web.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
