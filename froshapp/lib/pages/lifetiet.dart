import 'package:flutter/material.dart';
import 'package:froshapp/pages/homepage.dart';

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

  const InfoCard({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.currentPage,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (_, animation, __) => FadeTransition(
              opacity: animation,
              child: nextPage,
            ),
          ),
        ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homepage()),
                  );
                },
                child: Image.asset(
                  'assets/images/logo.png',
                  width: size.width * 0.52,
                  height: size.width * 0.5,
                  fit: BoxFit.contain,
                ),
              ),
            ),
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
                    child: Text(description,
                        style: TextStyle(
                            fontSize: size.height * 0.0165,
                            color: Colors.white)),
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
            'The COS Complex at TIET offers a range of convenient stores and eateries for students. VI Mini Store sells electronic devices, accessories, and sports gear. Shadowz Salon and Spa provides beauty services, while Fashion Point offers skincare essentials. The Stationery Store supplies college essentials, and the Dessert Club offers sweet treats. Kabir Multi-Store stocks everyday essentials, and Pizza Nation serves unique pizzas. Honey Coffee Cafe is a vegetarian snack spot, Iqbal Juice Centre offers fresh juices, and RS Laundry handles garment care. Sips & Bites and Wrapchik offer hearty meals and snacks, while Bombay Munchery serves Indian classics. It is one stop shop for all your needs.',
        currentPage: 0,
        nextPage: SportsCard(),
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
      );
}

class ParkCard extends StatelessWidget {
  const ParkCard({super.key});

  @override
  Widget build(BuildContext context) => InfoCard(
        title: 'CENTRAL\nPARK',
        image: 'assets/images/park.png',
        description:
            'The Central Park serves as an oasis of tranquility amidst the academic bustle. It’s lush-green abode helps students to relax and unwind. The sparkling fountains add up to the soothing ambience. The fresh air and open space fosters a sense of community and well-being among the students.',
        currentPage: 3,
        nextPage: const CosCard(), // Cycle back to the first card
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
