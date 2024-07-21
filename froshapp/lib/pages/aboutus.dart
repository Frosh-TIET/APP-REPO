import 'package:flutter/material.dart';
import 'package:froshapp/froshpages/core.dart';
import 'package:froshapp/froshpages/faculty.dart';
import 'package:froshapp/froshpages/mentors.dart';
import 'package:froshapp/froshpages/osc.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

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
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Foreground content
          Column(
            children: [
              // Logo
              Padding(
                padding: const EdgeInsets.all(40),
                child: Image.asset('assets/images/FROSHlogo.png'),
              ),
              // Buttons
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
              ? const Color(0xff006c48)
              : const Color(0xff5b615f),
          border: Border.all(
              color: selectedPage == title
                  ?  Color(0xff006c48)
                  :  Color(0xff5b615f),
              width: MediaQuery.of(context).size.width * 0.017),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Text(
          title.toUpperCase(),
          textAlign: TextAlign.center,
          style:  TextStyle(
              color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.03, fontFamily: 'Audiowide'),
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
        return Faculty(); // Default to Faculty
    }
  }
}
