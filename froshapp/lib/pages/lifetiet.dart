import 'package:flutter/material.dart';

void main() {
  runApp(const LifeThaparPage());
}

class LifeThaparPage extends StatelessWidget {
  const LifeThaparPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CosCard(), // Start with the CosCard widget
      ),
    );
  }
}

class CosCard extends StatelessWidget {
  const CosCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 1500),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return SportsCard();
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
              offset: const Offset(-15, 30),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 235,
                  height: 115,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 210),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'LIFE',
                            style: TextStyle(fontSize: 33, color: Colors.white),
                          ),
                          Text(
                            'AT',
                            style: TextStyle(fontSize: 33, color: Colors.white),
                          ),
                          Text(
                            'THAPAR',
                            style: TextStyle(fontSize: 33, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Transform.translate(
                      offset: const Offset(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Row(
                          children: [
                            Container(
                              width: 5,
                              height: 76,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CULTURE',
                                  style: TextStyle(
                                      fontSize: 21, color: Colors.white),
                                ),
                                Text(
                                  'OAT AND',
                                  style: TextStyle(
                                      fontSize: 21, color: Colors.white),
                                ),
                                Text(
                                  'SHOPPING COMPLEX',
                                  style: TextStyle(
                                      fontSize: 21, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, top: 20, right: 20),
                      child: const Text(
                        'COS is the predominant shopping attraction of the campus, filled with eateries of student-friendly prices. In addition to this, there also exists day-to-day needs such as drycleaning, electronics and stationery shops. The Open-Air-Theatre and activity rooms add a space of cultural practice and purpose. Overall, the services and experiences at COS make it an engaging place of rendezvous for the students.',
                        style: TextStyle(fontSize: 17.5, color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 90,
            left: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 1500),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return SportsCard();
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
                width: 330,
                height: 330,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SportsCard extends StatelessWidget {
  const SportsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 1500),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return LibraryCard();
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
              offset: const Offset(-15, 30),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 230,
                  height: 110,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LIFE',
                            style: TextStyle(fontSize: 33, color: Colors.white),
                          ),
                          Text(
                            'AT',
                            style: TextStyle(fontSize: 33, color: Colors.white),
                          ),
                          Text(
                            'THAPAR',
                            style: TextStyle(fontSize: 33, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Transform.translate(
                      offset: const Offset(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Row(
                          children: [
                            Container(
                              width: 5,
                              height: 60,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'SPORTS',
                                  style: TextStyle(
                                      fontSize: 26, color: Colors.white),
                                ),
                                Text(
                                  'COMPLEX',
                                  style: TextStyle(
                                      fontSize: 26, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 40, top: 20, right: 20),
                      child: Text(
                        'Physical recreation has always been integral to Thapar Institute, with tournaments in various sports like cricket, football, and basketball. Major events include URJA, Thaparlympics, and Annual Athletic Meet. The institute boasts top facilities, such as an international standard athletic track, synthetic tennis courts, synthetic basketball court, and swimming pool. New students receive institute-branded sportswear, and a dedicated sports section with seven full-time coaches supports activities.',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 85,
            left: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 1500),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return LibraryCard();
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
                width: 330,
                height: 330,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LibraryCard extends StatelessWidget {
  const LibraryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 1500),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return CosCard();
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
                offset: const Offset(-15, 30),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 230,
                    height: 110,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LIFE',
                              style: TextStyle(fontSize: 33, color: Colors.white),
                            ),
                            Text(
                              'AT',
                              style: TextStyle(fontSize: 33, color: Colors.white),
                            ),
                            Text(
                              'THAPAR',
                              style: TextStyle(fontSize: 33, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Transform.translate(
                        offset: const Offset(0, 10),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Row(
                            children: [
                              Container(
                                width: 5,
                                height: 90,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'NAVA NALANDA',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                  Text(
                                    'CENTRAL',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                  Text(
                                    'LIBRARY',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                        child: Text(
                          'Nava Nalanda Central Library, the pride of Thapar Institute, is a five storied building featuring marble and red stone architecture with a relaxing garden area. It offers over 800 seats, cutting-edge technology, group discussion rooms, and an 80-seat seminar hall. The library supports digital collections, housing over 200,000 e-books, and provides excellent study environments and facilities.',
                          style: TextStyle(fontSize: 17.5, color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 90,
              left: 150,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 1500),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return CosCard();
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
                  width: 330,
                  height: 330,
                ),
              ),
            ),
          ],
        ));
  }
}
