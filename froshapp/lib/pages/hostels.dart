import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:froshapp/hostelpages/hostel_detail_page.dart';
import 'package:froshapp/hostelpages/hostel_model.dart';

class HostelPage extends StatefulWidget {
  HostelPage({Key? key}) : super(key: key);

  final List<Hostel> boysHostels = [
    Hostel(
      name: 'Tejas Hall',
      imageUrl: 'assets/images/hostelB.jpg',
      detail:
          'Tejas Hall has single-seated rooms furnished with modern furniture and integrated with all basic facilities. There is a well-equipped gym, air-conditioned reading room, and open-air theatre in the hostel. Water coolers with RO systems and four elevators have been provided to ensure convenience. With an integrated security system and CCTVs security is given utmost importance. Regular cleaning, CCTV cameras, and fire alarms maintain hygiene and security. Fully air-conditioned guest rooms facilitate comfort to the visitors and add to better living.',
    ),
    Hostel(
      name: 'Vyan Hall',
      imageUrl: 'assets/images/hostelD.jpg',
      detail:
          'Vyan Hall will offer the students a well-equipped living environment inclusive of all facilities in the hostels, with gyms, TV rooms, indoor games, reading rooms, RO-integrated water coolers for clean drinking water, and 24/7 Wi-Fi. Regular maintenance and the mess facility ensure a hygienic and nutritious living experience and foster a helpful and friendly atmosphere among residents.',
    ),
    Hostel(
      name: 'Hostel FRF/G',
      imageUrl: 'assets/images/hostelE.jpg',
      detail:
          ' The hostel offers 3-seater non-AC rooms with attached washrooms, equipped with modern facilities. It offers the latest facilities including high-speed Wi-Fi, a Sodexo-run mess, laundry facilities, and proximity to the 400 Mtr track, which provides convenience for recreation. Hostel FRF/G offers an environment full of comfort and engagement, serving students amidst their academic journey.',
    ),
  ];

  final List<Hostel> girlsHostels = [
    Hostel(
      name: 'Vasudha Hall',
      imageUrl: 'assets/images/hostelB.jpg',
      detail:
          'Block-G:\n\nThere are different types of rooms available in Vasudha Hall, which are well-furnished with all the necessary facilities. Gyms are well-equipped in the hostel, along with housekeeping, laundry, and Wi-Fi facilities. Water coolers fitted with RO systems and a mess service monitored by a student committee provide all necessary conveniences. Security guards are available 24 hours a day to guard the safety aspects',
    ),
    Hostel(
      name: 'Vasudha Hall',
      imageUrl: 'assets/images/hostelD.jpg',
      detail:
          'Block-E:\n \nBlock-E offers a variety of well-furnished room types, each equipped with essential facilities. The hostel features well-equipped gyms, housekeeping, laundry, and Wi-Fi services. Water coolers with RO systems and a mess service overseen by a student committee ensure all necessary conveniences. The shared hangout area with Block G adds vibrancy to the living space, enhancing the residents\' overall experience. Security guards are on duty around the clock to ensure safety.',
    ),
    Hostel(
      name: 'Ira Hall',
      imageUrl: 'assets/images/hostelE.jpg',
      detail:
          'Ira Hall provides accommodation to undergraduate female students. The hall boasts of an energetic social atmosphere and has a dedicated mess, a night mess, a well-equipped gymnasium, an air-conditioned reading-cum-library room, and guest rooms. It is also integrated with high-speed Wi-Fi, laundry services, and lifts in the hall for ease. With an integrated security system and CCTVs security is given utmost importance. Amidst such facilities, Ira Hall focuses on holistic development and student experience.',
    ),
    Hostel(
      name: 'Hostel PG',
      imageUrl: 'assets/images/hostelL.jpeg',
      detail:
          'Agira Hall is the newest entry to the hostels at Thapar Institute. It has comfortable accommodations with requisite furnishing. Internet connectivity through Wi-Fi, shared bathrooms with hot water, RO water dispenser, Television room, Gymnasium, Air-conditioned Study room, Night canteen, and Laundry facility are some of the amenities. Safety is ensured through CCTV cameras and security guards available 24/7. The mess offers a nutritious menu approved by students and hence offers a very conducive atmosphere of living.',
    ),
  ];

  @override
  State<HostelPage> createState() => _HostelPageState();
}

class _HostelPageState extends State<HostelPage> {
  final CarouselController _carouselController1 = CarouselController();
  final CarouselController _carouselController2 = CarouselController();

  void _navigateToHostelDetail(List<Hostel> hostels, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HostelDetailPage(hostels: hostels, initialIndex: index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bgr.png'),
                fit: BoxFit.cover,
              ),
            ),
            height: double.infinity,
            width: double.infinity,
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            // padding: EdgeInsets.symmetric(vertical: screenHeight * 0.016),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                SizedBox(height: screenHeight * 0.04),
                Text(
                  'Boys hostel',
                  style: TextStyle(
                    fontSize: screenHeight * 0.025,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenHeight * 0.01),
                  child: Divider(
                    color: Colors.white,
                    thickness: 1.5,
                    indent: screenHeight * 0.085,
                    endIndent: screenHeight * 0.085,
                  ),
                ),
                // Carousel for boys hostel
                CarouselSlider(
                  carouselController: _carouselController1,
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    reverse: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    height: screenHeight * 0.16,
                    viewportFraction: 0.33, // Adjust viewportFraction as needed
                    onPageChanged: (index, reason) {},
                  ),
                  items: widget.boysHostels
                      .asMap()
                      .entries
                      .map((entry) => GestureDetector(
                            onTap: () => _navigateToHostelDetail(
                                widget.boysHostels, entry.key),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(
                                entry.value.imageUrl,
                                width: screenHeight * 0.125,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                SizedBox(height: screenHeight * 0.04),
                Text(
                  'Girls hostel',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenHeight * 0.01),
                  child: Divider(
                    color: Colors.white,
                    thickness: 1.5,
                    indent: screenHeight * 0.085,
                    endIndent: screenHeight * 0.085,
                  ),
                ),
                // Carousel for girls hostel
                CarouselSlider(
                  carouselController: _carouselController2,
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    height: screenHeight * 0.16,
                    viewportFraction: 0.33, // Adjust viewportFraction as needed
                    onPageChanged: (index, reason) {},
                  ),
                  items: widget.girlsHostels
                      .asMap()
                      .entries
                      .map((entry) => GestureDetector(
                            onTap: () => _navigateToHostelDetail(
                                widget.girlsHostels, entry.key),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(
                                entry.value.imageUrl,
                                width: screenHeight * 0.125,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
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
