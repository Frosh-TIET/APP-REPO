import 'package:flutter/material.dart';

class Core extends StatelessWidget {
  final List<Map<String, String>> teamMembers = [
    {'name': 'Abhay Bagla', 'role': 'COE', 'image': 'assets/images/abhay.webp'},
    {'name': 'Anuj Pathak', 'role': 'COE', 'image': 'assets/images/anuj.webp'},
    {'name': 'Anushka Tiwari', 'role': 'ENC', 'image': 'assets/images/anushka.webp'},
    {'name': 'Bhavneet Kaur', 'role': 'COPC', 'image': 'assets/images/bhavneet.webp'},
    {'name': 'Diya Wadhawan', 'role': 'TSLAS', 'image': 'assets/images/diya.webp'},
    {'name': 'Hritish Mahajan', 'role': 'CSBS', 'image': 'assets/images/hritish.webp'},
    {'name': 'Jai Raj Singh Ahluwalia', 'role': 'CIE', 'image': 'assets/images/jai.webp'},
    {'name': 'Kriti Goyal', 'role': 'BIOTECH', 'image': 'assets/images/kriti.webp'},
    {'name': 'Kshitiz Aroraa', 'role': 'ENC', 'image': 'assets/images/kshitiz.webp'},
    {'name': 'Navansh Krishna Goswami', 'role': 'ENC', 'image': 'assets/images/navansh.webp'},
    {'name': 'Nipun Jain', 'role': 'COE', 'image': 'assets/images/nipun.webp'},
    {'name': 'Ojas Kumar Singh', 'role': 'COE', 'image': 'assets/images/ojas.webp'},
    {'name': 'Pranay Mathur', 'role': 'COE', 'image': 'assets/images/pranay.webp'},
    {'name': 'Shivam Kumar', 'role': 'ECE', 'image': 'assets/images/shivam.webp'},
    {'name': 'Shreya Gakhar', 'role': 'COBS', 'image': 'assets/images/shreya.webp'},
    {'name': 'Soham Bhardwaj', 'role': 'BIOTECH', 'image': 'assets/images/soham.webp'},
    {'name': 'Yashik Garg', 'role': 'COPC', 'image': 'assets/images/yashik.webp'},
    {'name': 'Yashika', 'role': 'TSLAS', 'image': 'assets/images/yashika.webp'},
  ];

  final List<String> shiftRightNames = [
    'Abhay Bagla', 'Diya Wadhawan', 'Hritish Mahajan', 'Kriti Goyal',
    'Navansh Krishna Goswami', 'Ojas Kumar Singh', 'Shivam Kumar',
    'Soham Bhardwaj', 'Yashika',
  ];

  Core({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: teamMembers.length,
            itemBuilder: (context, index) {
              Map<String, String> member = teamMembers[index];
              bool imageOnLeft = index % 2 == 0;
              bool shiftRight = shiftRightNames.contains(member['name']);
              return TeamMemberRow(member, imageOnLeft, shiftRight);
            },
          ),
        ),
      ],
    );
  }

  Widget buildElevatedButton(BuildContext context, String text, String route) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.12),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04, vertical: MediaQuery.of(context).size.height * 0.01),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}

class TeamMemberRow extends StatelessWidget {
  final Map<String, String> member;
  final bool imageOnLeft;
  final bool shiftRight;

  const TeamMemberRow(this.member, this.imageOnLeft, this.shiftRight, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.012),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: imageOnLeft
            ? [
          Container(
            width: MediaQuery.of(context).size.height * 0.18,
            height: MediaQuery.of(context).size.width * 0.65,
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.048),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(41.0),
              child: Image.asset(
                member['image']!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  member['name']!,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.003,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.004),
                ),
                Text(
                  member['role']!,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        ]
            : [
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  member['name']!,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.003,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.004),
                ),
                Text(
                  member['role']!,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.397, // Adjusted width for image
            height: MediaQuery.of(context).size.height * 0.3,
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.08),
              child: Image.asset(
                member['image']!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
