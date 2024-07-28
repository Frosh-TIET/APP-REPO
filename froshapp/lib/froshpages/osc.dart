import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: Scaffold(body: Osc())));
}

class Osc extends StatefulWidget {
  Osc({Key? key}) : super(key: key);

  @override
  _OscState createState() => _OscState();
}

class _OscState extends State<Osc> {
  final List<Map<String, String>> teamMembers = [
    {
      'name': 'Ananya Varshneya',
      'role': 'ELE',
      'image': 'our team/osc/image1.webp'
    },
    {
      'name': 'Swastik Raghav',
      'role': 'COE',
      'image': 'our team/osc/image2.webp'
    },
  ];

  Future<String> _getImageUrl(String imageName) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedUrl = prefs.getString(imageName);

    if (cachedUrl != null) {
      return cachedUrl;
    }

    try {
      final ref = FirebaseStorage.instance.ref().child('images/$imageName');
      final url = await ref.getDownloadURL();

      // Cache the URL
      await prefs.setString(imageName, url);

      return url;
    } catch (e) {
      print('Error fetching image URL: $e');
      return '';
    }
  }

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
              return TeamMemberRow(member, imageOnLeft, _getImageUrl);
            },
          ),
        ),
      ],
    );
  }
}

class TeamMemberRow extends StatelessWidget {
  final Map<String, String> member;
  final bool imageOnLeft;
  final Future<String> Function(String) getImageUrl;

  const TeamMemberRow(this.member, this.imageOnLeft, this.getImageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.03),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: imageOnLeft
            ? [
          _buildImage(context),
          _buildInfo(context),
          SizedBox(width: MediaQuery.of(context).size.height * 0.02),
        ]
            : [
          SizedBox(width: MediaQuery.of(context).size.height * 0.01),
          _buildInfo(context),
          _buildImage(context),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height * 0.18,
      height: MediaQuery.of(context).size.width * 0.65,
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.048),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(41.0),
        child: FutureBuilder<String>(
          future: getImageUrl(member['image']!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(color: Colors.transparent,);
            } else if (snapshot.hasError) {
              return Icon(Icons.error);
            } else if (snapshot.hasData) {
              return CachedNetworkImage(
                imageUrl: snapshot.data!,
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(color: Colors.transparent,),
                errorWidget: (context, url, error) => Icon(Icons.error),
              );
            } else {
              return Container();
            }
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
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.0048,
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.005),
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
    );
  }
}