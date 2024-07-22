import 'package:flutter/material.dart';

void main() {
  runApp(const LifeThaparPage());
}

class LifeThaparPage extends StatelessWidget {
  const LifeThaparPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CosCard(), // Start with the CosCard widget
      ),
    );
  }
}

class CosCard extends StatelessWidget {
  const CosCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 400),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const SportsCard();
                  },
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            child: Image.asset(
              'assets/images/bgr.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Transform.translate(
              offset: Offset(
                MediaQuery.of(context).size.width * 0.04,
                MediaQuery.of(context).size.height * 0.02,
              ),
              child: Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.52,
                height: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.245,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LIFE',
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.084, color: Colors.white),
                          ),
                          Text(
                            'AT',
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.084, color: Colors.white),
                          ),
                          Text(
                            'THAPAR',
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.084, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.125),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.013,
                            height: MediaQuery.of(context).size.height*0.11,
                            color: Colors.white,
                          ),
                          SizedBox(width: MediaQuery.of(context).size.height*0.01),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'CULTURAL',
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width*0.065, color: Colors.white),
                              ),
                              Text(
                                'OAT AND',
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width*0.065, color: Colors.white),
                              ),
                              Text(
                                'SHOPPING COMPLEX',
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width*0.065, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width*0.1,
                          top: MediaQuery.of(context).size.height*0.022,
                          right: MediaQuery.of(context).size.width*0.07),
                      child: Text(
                        'COS is the predominant shopping attraction of the campus, filled with eateries of student-friendly prices. In addition to this, there also exists day-to-day needs such as drycleaning, electronics and stationery shops. The Open-Air-Theatre and activity rooms add a space of cultural practice and purpose. Overall, the services and experiences at COS make it an engaging place of rendezvous for the students.',
                        style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.1,
            left: MediaQuery.of(context).size.width*0.38,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 400),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const SportsCard();
                    },
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Image.asset(
                'assets/images/cos.png',
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width*0.85,
                height: MediaQuery.of(context).size.height*0.39,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SportsCard extends StatelessWidget {
  const SportsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 400),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const LibraryCard();
                  },
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            child: Image.asset(
              'assets/images/bgr.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Transform.translate(
              offset: Offset(
                MediaQuery.of(context).size.width * 0.04,
                MediaQuery.of(context).size.height * 0.02,
              ),
              child: Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.52,
                height: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.245,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LIFE',
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.084, color: Colors.white),
                          ),
                          Text(
                            'AT',
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.084, color: Colors.white),
                          ),
                          Text(
                            'THAPAR',
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.084, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.125),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.013,
                            height: MediaQuery.of(context).size.height*0.075,
                            color: Colors.white,
                          ),
                          SizedBox(width: MediaQuery.of(context).size.height*0.01),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SPORTS',
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width*0.065, color: Colors.white),
                              ),
                              Text(
                                'COMPLEX',
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width*0.065, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width*0.1,
                          top: MediaQuery.of(context).size.height*0.062,
                          right: MediaQuery.of(context).size.width*0.07),
                      child: Text(
                        'Physical recreation is integral to Thapar Institute, featuring tournaments in cricket, football, and basketball. Major events include URJA, Thaparlympics, and the Annual Athletic Meet. The institute has top facilities like an international athletic track, synthetic tennis and basketball courts, and a swimming pool. New students get branded sportswear, supported by seven full-time coaches.',
                        style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.1,
            left: MediaQuery.of(context).size.width*0.38,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 400),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const LibraryCard();
                    },
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Image.asset(
                'assets/images/sports.png',
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width*0.85,
                height: MediaQuery.of(context).size.height*0.39,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LibraryCard extends StatelessWidget {
  const LibraryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 400),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const CosCard();
                    },
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Image.asset(
                'assets/images/bgr.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Transform.translate(
                offset: Offset(
                  MediaQuery.of(context).size.width * 0.04,
                  MediaQuery.of(context).size.height * 0.02,
                ),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery.of(context).size.width * 0.52,
                  height: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.245,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,
                        ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LIFE',
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.084, color: Colors.white),
                            ),
                            Text(
                              'AT',
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.084, color: Colors.white),
                            ),
                            Text(
                              'THAPAR',
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.084, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.05,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.125),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.013,
                              height: MediaQuery.of(context).size.height*0.11,
                              color: Colors.white,
                            ),
                            SizedBox(width: MediaQuery.of(context).size.height*0.01),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'NAVA NALANDA',
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*0.065, color: Colors.white),
                                ),
                                Text(
                                  'CENTRAL',
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*0.065, color: Colors.white),
                                ),
                                Text(
                                  'LIBRARY',
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*0.065, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width*0.1,
                            top: MediaQuery.of(context).size.height*0.022,
                            right: MediaQuery.of(context).size.width*0.08),
                        child: Text(
                          'Nava Nalanda Central Library, the pride of Thapar Institute, is a five storied building featuring marble and red stone architecture with a relaxing garden area. It offers over 800 seats, cutting-edge technology, group discussion rooms, and an 80-seat seminar hall. The library supports digital collections, housing over 200,000 e-books, and provides excellent study environments and facilities.',
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*0.1,
              left: MediaQuery.of(context).size.width*0.38,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 400),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const CosCard();
                      },
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Image.asset(
                  'assets/images/library.png',
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width*0.85,
                  height: MediaQuery.of(context).size.height*0.39,
                ),
              ),
            ),
          ],
        ));
  }
}
