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
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.064, color: Colors.white),
                          ),
                          Text(
                            'AT',
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.064, color: Colors.white),
                          ),
                          Text(
                            'THAPAR',
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.064, color: Colors.white),
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
                            width: MediaQuery.of(context).size.width*0.007,
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
                                    fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                              ),
                              Text(
                                'OAT AND',
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                              ),
                              Text(
                                'SHOPPING COMPLEX',
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
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
                        'The COS Complex at TIET offers a range of convenient stores and eateries for students. VI Mini Store sells electronic devices, accessories, and sports gear. Shadowz Salon and Spa provides beauty services, while Fashion Point offers skincare essentials. The Stationery Store supplies college essentials, and the Dessert Club offers sweet treats. Kabir Multi-Store stocks everyday essentials, and Pizza Nation serves unique pizzas. Honey Coffee Cafe is a vegetarian snack spot, Iqbal Juice Centre offers fresh juices, and RS Laundry handles garment care. Sips & Bites and Wrapchik offer hearty meals and snacks, while Bombay Munchery serves Indian classics. It is one stop shop for all your needs.',
                        style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.015, color: Colors.white),
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
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.064, color: Colors.white),
                          ),
                          Text(
                            'AT',
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.064, color: Colors.white),
                          ),
                          Text(
                            'THAPAR',
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.064, color: Colors.white),
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
                            width: MediaQuery.of(context).size.width*0.007,
                            height: MediaQuery.of(context).size.height*0.067,
                            color: Colors.white,
                          ),
                          SizedBox(width: MediaQuery.of(context).size.height*0.01),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SPORTS',
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                              ),
                              Text(
                                'COMPLEX',
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
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
                        'Sports Complex TIET has many comprehensive sports facilities, from courts for basketball, volleyball, badminton, and tennis to a swimming pool, a cricket ground, and so on. The sports department organises various tournaments, such as URJA, Thaparlympics, SPADES, IGNITE, and the Annual Athletic Meet. Tracksuits with T-shirts are given to freshers for easy identification, providing an impetus to fitness and enthusiasm. Eight full-time coaches and a Deputy Director of Sports ensure coaching and organisation of a high order.',
                        style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.0165, color: Colors.white),
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
                      return const ParkCard();
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
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.064, color: Colors.white),
                            ),
                            Text(
                              'AT',
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.064, color: Colors.white),
                            ),
                            Text(
                              'THAPAR',
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.064, color: Colors.white),
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
                              width: MediaQuery.of(context).size.width*0.007,
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
                                      fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                ),
                                Text(
                                  'CENTRAL',
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                ),
                                Text(
                                  'LIBRARY',
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
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
                          'The Nava Nalanda Library at Thapar Institute is a state-of-the-art facility offering a vast collection of academic resources, including books, journals, and digital materials. It provides a serene environment for study and research, equipped with spacious reading areas, group discussion rooms, and access to online resources. The library\'s user-friendly services and knowledgeable staff support the academic endeavours of students and faculty, fostering a culture of learning and intellectual growth on campus.',
                          style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.0168, color: Colors.white),
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
                        return const ParkCard();
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

class ParkCard extends StatelessWidget {
  const ParkCard({super.key});

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
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.064, color: Colors.white),
                            ),
                            Text(
                              'AT',
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.064, color: Colors.white),
                            ),
                            Text(
                              'THAPAR',
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.064, color: Colors.white),
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
                              width: MediaQuery.of(context).size.width*0.007,
                              height: MediaQuery.of(context).size.height*0.075,
                              color: Colors.white,
                            ),
                            SizedBox(width: MediaQuery.of(context).size.height*0.01),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CENTRAL',
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                ),
                                Text(
                                  'PARK',
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width*0.1,
                            top: MediaQuery.of(context).size.height*0.052,
                            right: MediaQuery.of(context).size.width*0.08),
                        child: Text(
                          'The Central Park serves as an oasis of tranquility amidst the academic bustle. It’s lush-green abode helps students to relax and unwind. The sparkling fountains add up to the soothing ambience. The fresh air and open space fosters a sense of community and well-being among the students.',
                          style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.017, color: Colors.white),
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
              left: MediaQuery.of(context).size.width*0.18,
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
                  'assets/images/park.png',
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
