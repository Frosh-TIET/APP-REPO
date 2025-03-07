import 'package:flutter/material.dart';
import 'package:froshapp/froshpages/core.dart';
import 'package:froshapp/froshpages/faculty.dart';
import 'package:froshapp/froshpages/mentors.dart';
import 'package:froshapp/froshpages/osc.dart';
import 'package:froshapp/nav/refer_nav.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUsPage> {
  String selectedPage = 'FACULTY';

  void _togglePage(String page) {
    setState(() {
      selectedPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bgr.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Foreground content
          Column(
            children: [
              // Logo
              Center(
                child: SafeArea(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => FirstPage()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Container(
                      height: screenHeight * 0.165,
                      width: screenHeight * 0.36,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Buttons
              SizedBox(height: screenHeight * 0.043),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton('FACULTY'),
                  _buildButton('OSC'),
                  _buildButton('CORE'),
                  _buildButton('MENTORS'),
                ],
              ),
              // Dynamic content
              Expanded(
                child: _getSelectedPage(),
              ),
            ],
          ),
          // Back button
          Positioned(
            top: screenHeight * 0.087,
            left: screenHeight * 0.012,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String title) {
    return GestureDetector(
      onTap: () => _togglePage(title),
      child: Container(
        width: title == 'OSC'
            ? 60
            : title == 'CORE'
                ? 80
                : 90,
        decoration: BoxDecoration(
          color: selectedPage == title
              ? const Color.fromRGBO(29, 78, 137, 1)
              : const Color(0xff5b615f),
          border: Border.all(
              color: selectedPage == title
                  ? Color.fromRGBO(29, 78, 137, 1)
                  : Color(0xff5b615f),
              width: MediaQuery.of(context).size.width * 0.017),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Text(
          title.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.03,
              fontFamily: 'Audiowide'),
        ),
      ),
    );
  }

  Widget _getSelectedPage() {
    switch (selectedPage) {
      case 'FACULTY':
        return Faculty();
      case 'OSC':
        return Osc();
      case 'CORE':
        return Core();
      case 'MENTORS':
        return const Mentors();
      default:
        return Faculty();
    }
  }
}
