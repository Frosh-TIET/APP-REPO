import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:froshapp/hostelpages/hostel_detail_page.dart';
import 'package:froshapp/hostelpages/hostel_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:froshapp/nav/refer_nav.dart';

class HostelPage extends StatefulWidget {
  HostelPage({Key? key}) : super(key: key);
  final List<Hostel> boysHostels = [
    Hostel(
      name: 'Amritam Hall',
      imageUrl: 'images/hostel/boys/hostelB.webp',
      detail:
          'The hostel provides a magnificent living environment for the students with comfortable rooms and furniture, which includes study tables and almirahs. To ensure that students get a studious environment dedicated study rooms are provided. This hostel provides a variety of amenities, including 24/7 Wi-Fi, housekeeping services, a modern gym, and a well-maintained mess. Security is maintained with the help of CCTV cameras and a security guard available round the day, while an executive committee looks after the daily hostel matters.',
    ),
    Hostel(
      name: 'Prithvi Hall',
      imageUrl: 'images/hostel/boys/hostelC.webp',
      detail:
          'The Prithvi Hall has air-conditioned two-seater and three-seater rooms with necessary furniture. The hall has high standards of cleanliness, RO-processed water, and hot water availability. The gym, indoor games like chess and carrom, reading room, and laundry services are some of the great additions to this wonderful hostel. With an integrated security system and CCTVs security is given utmost importance. The atmosphere here at Prithvi Hall is full of life and vibrancy and provides an excellent environment to carry out both academic and extra-curricular activities.',
    ),
    Hostel(
      name: 'Neeram Hall',
      imageUrl: 'images/hostel/boys/hostelD.webp',
      detail:
          'Accommodation in Neeram Hall is on a double-seater basis with shared washrooms, and the rooms are furnished with all amenities. This hostel provides several facilities, including round-the-clock Wi-Fi, four elevators, power backup, housekeeping services, a futuristic gym, and a well-maintained mess run by a Sodexo. Water coolers, RO systems, and a dedicated laundry system assure convenience. Security is a top priority, supported by an integrated system and CCTV surveillance.',
    ),
    Hostel(
      name: 'Vyan Hall',
      imageUrl: 'images/hostel/boys/hostelH.webp',
      detail:
          'Vyan Hall will offer the students a well-equipped living environment inclusive of all facilities in the hostels, with gyms, TV rooms, indoor games, reading rooms, RO-integrated water coolers for clean drinking water, and 24/7 Wi-Fi. Regular maintenance and the mess facility ensure a hygienic and nutritious living experience and foster a helpful and friendly atmosphere among residents.',
    ),
    Hostel(
      name: 'Tejas Hall',
      imageUrl: 'images/hostel/boys/hostelJ.webp',
      detail:
          'Tejas Hall has single-seated rooms furnished with modern furniture and integrated with all basic facilities. There is a well-equipped gym, air-conditioned reading room, and open-air theatre in the hostel. Water coolers with RO systems and four elevators have been provided to ensure convenience. With an integrated security system and CCTVs security is given utmost importance. Regular cleaning, CCTV cameras, and fire alarms maintain hygiene and security. Fully air-conditioned guest rooms facilitate comfort to the visitors and add to better living.',
    ),
    Hostel(
      name: 'Ambaram Hall',
      imageUrl: 'images/hostel/boys/hostelK.webp',
      detail:
          'Comfortable accommodation with two floors and separate water purifier arrangements are available. High-speed internet, a gym facility, and a neat and clean well-maintained mess with good-quality food are commendable add-ons to this marvel. Regular cleaning services ensure a hygienic and delightful living atmosphere, for much-needed leisure games like table tennis and a dedicated badminton court are included. Security is a top priority, supported by an integrated system and CCTV surveillance.',
    ),
    Hostel(
      name: 'Viyat Hall',
      imageUrl: 'images/hostel/boys/hostelL.webp',
      detail:
          'This hall has a modern, air-conditioned double occupancy residential life with attractive views. There are facilities for a night canteen, dining hall, reading room, and a well-equipped gym within the hostel. Other services include laundry and high-speed Wi-Fi access. With an integrated security system and CCTVs security is given utmost importance. The environment shall support and be comfortable by considering the students needs in nutrition and recreation from within the hall.',
    ),
    Hostel(
      name: 'Anantam Hall',
      imageUrl: 'images/hostel/boys/hostelM.webp',
      detail:
          'This is a multi-storey boys hostel with single and double-seater air-conditioned rooms, having all the basic amenities attached. The hostel provides facilities for water coolers and RO systems on every floor, along with sofa sets. The hostel encompasses housekeeping, laundry, 24/7 Wi-Fi, and a well-equipped gym. Security is a top priority, supported by an integrated system and CCTV surveillance. Guest rooms are provided with strict security measures and comfortable, safe living terms, along with a mess facility that serves healthy, nutritionally balanced food.',
    ),
    Hostel(
      name: 'Vyom Hall',
      imageUrl: 'images/hostel/boys/hostelO.webp',
      detail:
          'Vyom Hall has double-seater rooms with shared washrooms, fully furnished with all the essential facilities. This hostel provides round-the-clock availability of Wi-Fi, four lifts, and power backup. Other facilities include a modern gym, night canteen, and well-maintained mess. With an advanced security system and CCTV coverage, utmost importance is placed on safety. Water coolers, RO systems, and laundry services are available in the hostel for convenience to ensure a comfortable and healthy living environment.',
    ),
    Hostel(
      name: 'Hostel FRF/G',
      imageUrl: 'images/hostel/boys/hostelzFRF_G.webp',
      detail:
          'The hostel offers 3-seater non-AC rooms with attached washrooms, equipped with modern facilities. It offers the latest facilities including high-speed Wi-Fi, a Sodexo-run mess, laundry facilities, and proximity to the 400 Mtr track, which provides convenience for recreation. Hostel FRF/G offers an environment full of comfort and engagement, serving students amidst their academic journey.',
    ),
  ];
  final List<Hostel> girlsHostels = [
    Hostel(
      name: 'Vasudha Hall\nBLK-G',
      imageUrl: 'images/hostel/girls/im0.webp',
      detail:
          'There are different types of rooms available in Vasudha Hall, which are well-furnished with all the necessary facilities. Gyms are well-equipped in the hostel, along with housekeeping, laundry, and Wi-Fi facilities. Water coolers fitted with RO systems and a mess service monitored by a student committee provide all necessary conveniences. Security guards are available 24 hours a day to guard the safety aspects.',
    ),
    Hostel(
      name: 'Vasudha Hall\nBLK-E',
      imageUrl: 'images/hostel/girls/im01.webp',
      detail:
          'Block-E offers a variety of well-furnished room types, each equipped with essential facilities. The hostel features well-equipped gyms, housekeeping, laundry, and Wi-Fi services. Water coolers with RO systems and a mess service overseen by a student committee ensure all necessary conveniences. The shared hangout area with Block G adds vibrancy to the living space, enhancing the residents overall experience. Security guards are on duty around the clock to ensure safety.',
    ),
    Hostel(
      name: 'Ira Hall',
      imageUrl: 'images/hostel/girls/im02.webp',
      detail:
          'Ira Hall provides accommodation to undergraduate female students. The hall boasts of an energetic social atmosphere and has a dedicated mess, a night mess, a well-equipped gymnasium, an air-conditioned reading-cum-library room, and guest rooms. It is also integrated with high-speed Wi-Fi, laundry services, and lifts in the hall for ease. With an integrated security system and CCTVs security is given utmost importance. Amidst such facilities, Ira Hall focuses on holistic development and student experience.',
    ),
    Hostel(
      name: 'Ananta Hall',
      imageUrl: 'images/hostel/girls/im03.webp',
      detail:
          'This architectural marvel serves as the girls hostel and has single and double-seater air-conditioned rooms with all essential amenities. Other facilities that prove to be very functional include water coolers, RO systems, housekeeping services, laundry facilities, and 24-hour Wi-Fi connectivity. Many other facilities enhance comfort, such as a well-equipped gym, air-conditioned reading rooms, and guest rooms. Security is very strict, and there is a mess facility that ensures healthy and nutritious food. With an advanced security system and CCTV coverage, utmost importance is placed on safety.',
    ),
    Hostel(
      name: 'Vahni Hall',
      imageUrl: 'images/hostel/girls/im04.webp',
      detail:
          'This is a girls hostel that provides double-seater, air-conditioned rooms with all the required facilities. The hostel has various amenities like a television room, gymnasium, air-conditioned study area, canteen during nights, and laundry services. With an integrated security system and CCTVs security is given utmost importance. Besides high-speed Wi-Fi, four elevators, and dedicated housekeeping staff ensure ease of life along with cleanliness. The mess is looked after by a company of international repute providing nutritious meals to ensure a comfortable living ambiance.',
    ),
    Hostel(
      name: 'Agira Hall',
      imageUrl: 'images/hostel/girls/im05.webp',
      detail:
          'Agira Hall is the newest entry to the hostels at Thapar Institute. It has comfortable accommodations with requisite furnishing. Internet connectivity through Wi-Fi, shared bathrooms with hot water, RO water dispenser, Television room, Gymnasium, Air-conditioned Study room, Night canteen, and Laundry facility are some of the amenities. Safety is ensured through CCTV cameras and security guards available 24/7. The mess offers a nutritious menu approved by students and hence offers a very conducive atmosphere of living.',
    ),
  ];

  @override
  State<HostelPage> createState() => _HostelPageState();
}

class _HostelPageState extends State<HostelPage>
    with SingleTickerProviderStateMixin {
  final CarouselController _carouselController1 = CarouselController();
  final CarouselController _carouselController2 = CarouselController();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  late AnimationController _controller;
  late Future<String> _imageUrlFuture;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..repeat(reverse: true);
    _imageUrlFuture = getImageUrl();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<String> getImageUrl() async {
    try {
      return await _storage.ref('images/logo/logo.png').getDownloadURL();
    } catch (e) {
      print('Error fetching logo URL: $e');
      return '';
    }
  }

  Future<String> _getImageUrl(String imageURL) async {
    try {
      final ref = _storage.ref().child(imageURL);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print('Error fetching image URL: $e');
      return '';
    }
  }

  void _navigateToHostelDetail(List<Hostel> hostels, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HostelDetailPage(hostels: hostels, initialIndex: index),
      ),
    );
  }

  Widget _buildHostelImage(Hostel hostel) {
    return FutureBuilder<String>(
      future: _getImageUrl(hostel.imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Colors.transparent);
        }
        if (snapshot.hasError || !snapshot.hasData) {
          return Icon(Icons.error);
        }
        return Column(
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: CachedNetworkImage(
                  imageUrl: snapshot.data!,
                  width: MediaQuery.of(context).size.height * 0.125,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      CircularProgressIndicator(color: Colors.transparent),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height*0.01,
                left: MediaQuery.of(context).size.height*0.008,
                child: Text(
                  hostel.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height*0.016,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
            ]),
            // SizedBox(height: 8),
            // Text(
            //   hostel.name,
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 12,
            //     fontWeight: FontWeight.bold,
            //   ),
            //   textAlign: TextAlign.center,
            //   maxLines: 2,
            //   overflow: TextOverflow.ellipsis,
            // ),
          ],
        );
      },
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
                image: AssetImage('assets/images/bgr.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            children: [
              Center(
                child: SafeArea(
                  child: FutureBuilder<String>(
                    future: _imageUrlFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(
                            color: Colors.transparent);
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Text('No image available');
                      } else {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => FirstPage()),
                                  (Route<dynamic> route) => false,
                            );
                          },
                          child: Container(
                            height: screenHeight * 0.165,
                            width: screenHeight * 0.36,
                            child: CachedNetworkImage(
                              imageUrl: snapshot.data!,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => CircularProgressIndicator(
                                color: Colors.transparent,
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          ),
                        );

                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
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
              CarouselSlider(
                carouselController: _carouselController1,
                options: CarouselOptions(
                  enableInfiniteScroll: true,
                  reverse: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  height: screenHeight *
                      0.2, // Increased height to accommodate name
                  viewportFraction: 0.33,
                  onPageChanged: (index, reason) {},
                ),
                items: widget.boysHostels
                    .asMap()
                    .entries
                    .map((entry) => GestureDetector(
                          onTap: () => _navigateToHostelDetail(
                              widget.boysHostels, entry.key),
                          child: _buildHostelImage(entry.value),
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
              CarouselSlider(
                carouselController: _carouselController2,
                options: CarouselOptions(
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  height: screenHeight *
                      0.2, // Increased height to accommodate name
                  viewportFraction: 0.33,
                  onPageChanged: (index, reason) {},
                ),
                items: widget.girlsHostels
                    .asMap()
                    .entries
                    .map((entry) => GestureDetector(
                          onTap: () => _navigateToHostelDetail(
                              widget.girlsHostels, entry.key),
                          child: _buildHostelImage(entry.value),
                        ))
                    .toList(),
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
