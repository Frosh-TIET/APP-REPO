import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  Future<String>? _logoUrlFuture;

  @override
  void initState() {
    super.initState();
    _logoUrlFuture = _getLogoUrl();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildBackground(),
          _buildLogo(context, screenHeight),
          _buildSocialGrid(screenHeight),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bgr.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context, double screenHeight) {
    return Align(
      alignment: Alignment.topCenter,
      child: SafeArea(
        child: FutureBuilder<String>(
          future: _logoUrlFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(
                color: Colors.transparent,
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return Container(
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
              );
            } else {
              return Container(); 
            }
          },
        ),
      ),
    );
  }

  Future<String> _getLogoUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedUrl = prefs.getString('logo_url');

    if (cachedUrl != null) {
      return cachedUrl;
    }

    try {
      final ref = FirebaseStorage.instance.ref().child('images/logo/logo.png');
      String url = await ref.getDownloadURL();
      await prefs.setString('logo_url', url);
      return url;
    } catch (e) {
      print('Error fetching logo URL: $e');
      return 'assets/images/logo.png'; // Fallback to local asset
    }
  }

  Widget _buildSocialGrid(double screenHeight) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 15.0,
      mainAxisSpacing: screenHeight * 0.01,
      padding: EdgeInsets.fromLTRB(20, screenHeight * 0.23, 20, 10),
      children: _buildSocialItems(screenHeight),
    );
  }

  List<Widget> _buildSocialItems(double screenHeight) {
    final List<Map<String, dynamic>> socialItems = [
      {
        'url': 'https://github.com/Frosh-TIET',
        'asset': 'assets/images/iconGit.webp',
        'scale': 0.0006
      },
      {
        'url': 'https://www.facebook.com/froshtiet/',
        'asset': 'assets/images/iconFb.webp',
        'scale': 0.0006
      },
      {
        'url': 'https://www.instagram.com/froshtiet/',
        'asset': 'assets/images/iconIg.webp',
        'scale': 0.0006
      },
      {
        'url': 'https://www.youtube.com/froshtiet/',
        'asset': 'assets/images/iconYt.webp',
        'scale': 0.0006
      },
      {
        'url': 'mailto:frosh@thapar.edu',
        'asset': 'assets/images/iconMail.webp',
        'scale': 0.0006
      },
      {
        'url': 'https://www.froshtiet.com/',
        'asset': 'assets/images/iconWeb.webp',
        'scale': 0.0006
      },
    ];

    return socialItems
        .map((item) => _buildSocialItem(item, screenHeight))
        .toList();
  }

  Widget _buildSocialItem(Map<String, dynamic> item, double screenHeight) {
    return GestureDetector(
      onTap: () => _launchUrl(item['url']),
      child: Transform.scale(
        scale: screenHeight * item['scale'],
        child: Image.asset(item['asset']),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}
