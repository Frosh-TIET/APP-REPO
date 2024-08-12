import 'package:flutter/material.dart';
import 'package:froshapp/nav/refer_nav.dart';

void main() => runApp(const LifeThaparPage());

class LifeThaparPage extends StatelessWidget {
  const LifeThaparPage({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CosCard(),
      );
}

class InfoCard extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final int currentPage;
  final Widget nextPage;
  final Widget previousPage;

  const InfoCard({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.currentPage,
    required this.nextPage,
    required this.previousPage,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            // Swiping in right direction
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 400),
                pageBuilder: (_, animation, __) => FadeTransition(
                  opacity: animation,
                  child: previousPage,
                ),
              ),
            );
          } else if (details.delta.dx < 0) {
            // Swiping in left direction
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 400),
                pageBuilder: (_, animation, __) => FadeTransition(
                  opacity: animation,
                  child: nextPage,
                ),
              ),
            );
          }
        },
        child: Stack(
          children: [
            Image.asset('assets/images/bgr.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity),
            Positioned(
                top: size.height * 0.02,
                left: size.width * 0.04,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => FirstPage()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: size.width * 0.52,
                    height: size.width * 0.5,
                    fit: BoxFit.contain,
                  ),
                )),
            Positioned(
              top: size.height * 0.245,
              left: size.width * 0.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('LIFE\nAT\nTHAPAR',
                      style: TextStyle(
                          fontSize: size.width * 0.064, color: Colors.white)),
                  SizedBox(height: size.height * 0.05),
                  Row(
                    children: [
                      Container(
                          width: size.width * 0.007,
                          height: size.height * 0.11,
                          color: Colors.white),
                      SizedBox(width: size.height * 0.01),
                      Text(title,
                          style: TextStyle(
                              fontSize: size.width * 0.045,
                              color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: size.height * 0.022),
                  SizedBox(
                    width: size.width * 0.8,
                    child: SingleChildScrollView(
                      child: Text(description,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.016,
                              color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.1,
              left: size.width * 0.38,
              child: Image.asset(image,
                  fit: BoxFit.contain,
                  width: size.width * 0.85,
                  height: size.height * 0.39),
            ),
            Positioned(
              bottom: size.height * 0.05,
              left: 0,
              right: 0,
              child: PageDots(currentPage: currentPage, totalPages: 4),
            ),
          ],
        ),
      ),
    );
  }
}

class CosCard extends StatelessWidget {
  const CosCard({super.key});

  @override
  Widget build(BuildContext context) => const InfoCard(
        title: 'CULTURAL OAT AND\nSHOPPING COMPLEX',
        image: 'assets/images/cos.png',
        description:
            'The COS Complex at TIET offers a range of convenient stores and eateries for students. VI Mini Store sells electronic devices, accessories, and sports gear. Shadowz Salon and Spa provides beauty services, while Fashion Point offers skincare essentials. The Stationery Store supplies college essentials, and the Dessert Club offers sweet treats. Kabir Multi-Store stocks everyday essentials, and Pizza Nation serves unique pizzas. Honey Coffee Cafe is a vegetarian snack spot, Iqbal Juice Centre offers fresh juices, and RS Laundry handles garment care.',
        currentPage: 0,
        nextPage: SportsCard(),
        previousPage: ParkCard(), // The last page in the cycle
      );
}

class SportsCard extends StatelessWidget {
  const SportsCard({super.key});

  @override
  Widget build(BuildContext context) => const InfoCard(
        title: 'SPORTS\nCOMPLEX',
        image: 'assets/images/sports.png',
        description:
            'Sports Complex TIET has many comprehensive sports facilities, from courts for basketball, volleyball, badminton, and tennis to a swimming pool, a cricket ground, and so on. The sports department organises various tournaments, such as URJA, Thaparlympics, SPADES, IGNITE, and the Annual Athletic Meet. Tracksuits with T-shirts are given to freshers for easy identification, providing an impetus to fitness and enthusiasm. Eight full-time coaches and a Deputy Director of Sports ensure coaching and organisation of a high order.',
        currentPage: 1,
        nextPage: LibraryCard(),
        previousPage: CosCard(),
      );
}

class LibraryCard extends StatelessWidget {
  const LibraryCard({super.key});

  @override
  Widget build(BuildContext context) => const InfoCard(
        title: 'NAVA NALANDA\nCENTRAL\nLIBRARY',
        image: 'assets/images/library.png',
        description:
            'The Nava Nalanda Library at Thapar Institute is a state-of-the-art facility offering a vast collection of academic resources, including books, journals, and digital materials. It provides a serene environment for study and research, equipped with spacious reading areas, group discussion rooms, and access to online resources. The library\'s user-friendly services and knowledgeable staff support the academic endeavours of students and faculty, fostering a culture of learning and intellectual growth on campus.',
        currentPage: 2,
        nextPage: ParkCard(),
        previousPage: SportsCard(),
      );
}

class ParkCard extends StatelessWidget {
  const ParkCard({super.key});

  @override
  Widget build(BuildContext context) => InfoCard(
        title: 'CENTRAL\nPARK',
        image: 'assets/images/park.png',
        description:
            'The Central Park serves as an oasis of tranquillity amidst the academic bustle. Its lush-green abode helps students to relax and unwind. The sparkling fountains add up to the soothing ambience, their gentle murmur creating a calming backdrop. The fresh air and open space foster a sense of community and well-being among the students, encouraging spontaneous gatherings and peaceful solitude alike. The seating areas in the lap of nature invite both quiet reflection and lively conversations, making the park a cherished retreat.',
        currentPage: 3,
        nextPage: const CosCard(), // Cycle back to the first card
        previousPage: LibraryCard(),
      );
}

class PageDots extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const PageDots(
      {super.key, required this.currentPage, required this.totalPages});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            totalPages,
            (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == currentPage
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                )),
      );
}
