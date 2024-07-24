import 'package:flutter/material.dart';
import 'package:froshapp/tech_nontech/tech_pg.dart';
import 'package:froshapp/tech_nontech/nontech_pg.dart';

class SocietyPage extends StatefulWidget {
  const SocietyPage({super.key});

  @override
  State<SocietyPage> createState() => _SocietyPageState();
}

class _SocietyPageState extends State<SocietyPage> {
  bool isTechSelected = true;

  void _toggleView(bool isTech) {
    setState(() {
      isTechSelected = isTech;
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
              'assets/images/bgr.png',
              fit: BoxFit.cover,
            ),
          ),
          // Foreground content
          Column(
            children: [
              Center(
                child: SafeArea(
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
              SizedBox(
                height: screenHeight * 0.035,
              ),
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => _toggleView(true),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.043,
                      width: MediaQuery.of(context).size.height * 0.19,
                      decoration: BoxDecoration(
                        color: isTechSelected
                            ? const Color(0xff006c48)
                            : const Color(0xff5b615f),
                        border: Border.all(
                            color: isTechSelected
                                ? Color(0xff006c48)
                                : Color(0xff5b615f),
                            width: MediaQuery.of(context).size.height * 0.001),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.009),
                        child: Text(
                          'T E C H',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                              MediaQuery.of(context).size.width * 0.042,
                              fontFamily: 'Audiowide'),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _toggleView(false),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.0430,
                      width: MediaQuery.of(context).size.height * 0.19,
                      decoration: BoxDecoration(
                        color: isTechSelected
                            ? const Color(0xff5b615f)
                            : const Color(0xff006c48),
                        border: Border.all(
                            color: isTechSelected
                                ? Color(0xff5b615f)
                                : Color(0xff006c48),
                            width: MediaQuery.of(context).size.height * 0.001),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.009),
                        child: Text(
                          'N O N  T E C H',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                              MediaQuery.of(context).size.width * 0.042,
                              fontFamily: 'Audiowide'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Dynamic content
              Expanded(
                child: isTechSelected ? const Tech() : const NonTech(),
              ),
            ],
          ),
          Positioned(
            top: screenHeight * 0.09,
            left: screenWidth * 0.03,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
