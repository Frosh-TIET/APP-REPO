import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Faculty extends StatefulWidget {
  const Faculty({Key? key}) : super(key: key);

  @override
  _FacultyState createState() => _FacultyState();
}

class _FacultyState extends State<Faculty> {
  final List<Map<String, String>> teamMembers = [
    {'name': 'Dr. MD Singh', 'role': 'President', 'imagePath': 'images/our team/faculty/image1.webp'},
    {'name': 'Dr. Hemdutt Joshi', 'role': 'Vice-President', 'imagePath': 'images/our team/faculty/image2.webp'},
    {'name': 'Dr. Vishal Gupta', 'role': 'Vice-President', 'imagePath': 'images/our team/faculty/image3.webp'},
    {'name': 'Dr. Avinash Chandra', 'role': 'Vice-President', 'imagePath': 'images/our team/faculty/image4.webp'},
    {'name': 'Dr. Devendar Kumar', 'role': 'Vice-President', 'imagePath': 'images/our team/faculty/image5.webp'},
    {'name': 'Dr.Tarunpreet Bhatia', 'role': 'Vice-President', 'imagePath': 'images/our team/faculty/image6.webp'},
  ];

  late List<Future<String>> _imageUrlFutures;

  @override
  void initState() {
    super.initState();
    _imageUrlFutures = teamMembers.map((member) => getImageUrl(member['imagePath']!)).toList();
  }

  Future<String> getImageUrl(String path) async {
    try {
      return await FirebaseStorage.instance.ref(path).getDownloadURL();
    } catch (e) {
      print('Error fetching image URL: $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.width * 0.12),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: MediaQuery.of(context).size.height * 0.036,
              mainAxisSpacing: MediaQuery.of(context).size.width * 0.08,
              childAspectRatio: 0.5,
            ),
            itemCount: teamMembers.length,
            itemBuilder: (context, index) {
              Map<String, String> member = teamMembers[index];
              return FutureBuilder<String>(
                future: _imageUrlFutures[index],
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator(color: Colors.transparent,));
                  } else if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
                    return _buildMemberTile(member, null);
                  } else {
                    return _buildMemberTile(member, snapshot.data);
                  }
                },
              );
            },
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04)
      ],
    );
  }

  Widget _buildMemberTile(Map<String, String> member, String? imageUrl) {
    return GridTile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: imageUrl != null
                ? CachedNetworkImage(
              imageUrl: imageUrl,
              width: MediaQuery.of(context).size.height * 0.9,
              height: MediaQuery.of(context).size.width * 0.65,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(color: Colors.transparent,),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )
                : Container(
              width: MediaQuery.of(context).size.height * 0.9,
              height: MediaQuery.of(context).size.width * 0.65,
              color: Colors.grey,
              child: Icon(Icons.person, size: 50),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.03),
          Text(
            member['name']!,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: MediaQuery.of(context).size.width * 0.035,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            member['role']!,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: MediaQuery.of(context).size.width * 0.03,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}