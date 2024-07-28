import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: Scaffold(body: Core())));
}

class TeamMember {
  final String name;
  final String role;
  final String imageName;

  TeamMember({required this.name, required this.role, required this.imageName});
}

class Core extends StatelessWidget {
  final List<TeamMember> teamMembers = [
    TeamMember(name: 'Abhay Bagla', role: 'COE', imageName: 'our team/core/0.webp'),
    TeamMember(name: 'Anuj Pathak', role: 'COE', imageName: 'our team/core/01.webp'),
    TeamMember(name: 'Anushka Tiwari', role: 'ENC', imageName: 'our team/core/02.webp'),
    TeamMember(name: 'Bhavneet Kaur', role: 'COPC', imageName: 'our team/core/03.webp'),
    TeamMember(name: 'Diya Wadhawan', role: 'TSLAS', imageName: 'our team/core/04.webp'),
    TeamMember(name: 'Hritish Mahajan', role: 'CSBS', imageName: 'our team/core/05.webp'),
    TeamMember(name: 'Jai Raj Singh\n Ahluwalia', role: 'CIE', imageName: 'our team/core/06.webp'),
    TeamMember(name: 'Kriti Goyal', role: 'BIOTECH', imageName: 'our team/core/07.webp'),
    TeamMember(name: 'Kshitiz Aroraa', role: 'ENC', imageName: 'our team/core/08.webp'),
    TeamMember(name: 'Navansh K.\n Goswami', role: 'ENC', imageName: 'our team/core/09.webp'),
    TeamMember(name: 'Nipun Jain', role: 'COE', imageName: 'our team/core/10.webp'),
    TeamMember(name: 'Ojas Kumar\n Singh', role: 'COE', imageName: 'our team/core/11.webp'),
    TeamMember(name: 'Pranay Mathur', role: 'COE', imageName: 'our team/core/12.webp'),
    TeamMember(name: 'Shivam Kumar', role: 'ECE', imageName: 'our team/core/13.webp'),
    TeamMember(name: 'Shreya Gakhar', role: 'CSBS', imageName: 'our team/core/14.webp'),
    TeamMember(name: 'Soham Bhardwaj', role: 'BIOTECH', imageName: 'our team/core/15.webp'),
    TeamMember(name: 'Yashik Garg', role: 'COPC', imageName: 'our team/core/16.webp'),
    TeamMember(name: 'Yashika', role: 'TSLAS', imageName: 'our team/core/17.webp'),
  ];

  final List<String> shiftRightNames = [
    'Abhay Bagla', 'Diya Wadhawan', 'Hritish Mahajan', 'Kriti Goyal',
    'Navansh K. Goswami', 'Ojas Kumar Singh', 'Shivam Kumar',
    'Soham Bhardwaj', 'Yashika',
  ];

  Core({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: teamMembers.length,
            itemBuilder: (context, index) {
              TeamMember member = teamMembers[index];
              bool imageOnLeft = index % 2 == 0;
              bool shiftRight = shiftRightNames.contains(member.name);
              return TeamMemberRow(member: member, imageOnLeft: imageOnLeft, shiftRight: shiftRight);
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
  final TeamMember member;
  final bool imageOnLeft;
  final bool shiftRight;

  const TeamMemberRow({
    Key? key,
    required this.member,
    required this.imageOnLeft,
    required this.shiftRight,
  }) : super(key: key);

  Future<String> _getImageUrl(String imageName) async {
    final ref = FirebaseStorage.instance.ref().child('images/$imageName');
    return await ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.012),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (imageOnLeft) _buildImage(context),
          _buildInfo(context),
          if (!imageOnLeft) _buildImage(context),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      width: imageOnLeft ? MediaQuery.of(context).size.height * 0.18 : MediaQuery.of(context).size.width * 0.397,
      height: imageOnLeft ? MediaQuery.of(context).size.width * 0.65 : MediaQuery.of(context).size.height * 0.3,
      margin: EdgeInsets.only(
        left: imageOnLeft ? MediaQuery.of(context).size.width * 0.048 : 0,
        right: !imageOnLeft ? MediaQuery.of(context).size.width * 0.05 : 0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(imageOnLeft ? 41.0 : MediaQuery.of(context).size.width * 0.08),
        child: FutureBuilder<String>(
          future: _getImageUrl(member.imageName),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(color: Colors.transparent,);
            } else if (snapshot.hasError) {
              return const Icon(Icons.error);
            } else if (snapshot.hasData) {
              return CachedNetworkImage(
                imageUrl: snapshot.data!,
                fit: BoxFit.cover,
                placeholder: (context, url) => const CircularProgressIndicator(color: Colors.transparent,),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            member.name,
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
            member.role,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: MediaQuery.of(context).size.width * 0.05,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}