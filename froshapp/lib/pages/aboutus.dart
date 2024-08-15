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
    double screenWidth = MediaQuery.of(context).size.width;

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
                      height: screenHeight * 0.15,
                      width: screenWidth * 0.6,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Buttons
              SizedBox(height: screenHeight * 0.03),
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
            top: screenHeight * 0.05,
            left: screenWidth * 0.03,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, 
                color: Colors.white, 
                size: screenWidth * 0.06),
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
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * (title == 'OSC' ? 0.153 : title == 'CORE' ? 0.2 : 0.22);

    return GestureDetector(
      onTap: () => _togglePage(title),
      child: Container(
        width: buttonWidth,
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
          horizontal: MediaQuery.of(context).size.width * 0.02,
        ),
        decoration: BoxDecoration(
          color: selectedPage == title
              ? const Color.fromRGBO(29, 78, 137, 1)
              : const Color(0xff5b615f),
          border: Border.all(
            color: selectedPage == title
                ? Color.fromRGBO(29, 78, 137, 1)
                : Color(0xff5b615f),
            width: MediaQuery.of(context).size.width * 0.005,
          ),
          borderRadius: BorderRadius.circular(screenWidth * 0.015),
        ),
        child: Text(
          title.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.028,
            fontFamily: 'Audiowide',
          ),
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