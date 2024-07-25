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
                            ? Color.fromRGBO(29, 78, 137, 1)
                            : const Color(0xff5b615f),
                        border: Border.all(
                            color: isTechSelected
                                ? Color.fromRGBO(29, 78, 137, 1)
                                : Color(0xff5b615f),
                            width: MediaQuery.of(context).size.height * 0.001),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.01),
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
                            : Color.fromRGBO(29, 78, 137, 1),
                        border: Border.all(
                            color: isTechSelected
                                ? Color(0xff5b615f)
                                : Color.fromRGBO(29, 78, 137, 1),
                            width: MediaQuery.of(context).size.height * 0.001),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.01),
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
}
