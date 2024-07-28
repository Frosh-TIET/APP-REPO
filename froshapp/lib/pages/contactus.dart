import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildBackground(),
          _buildLogo(screenHeight),
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

  Widget _buildLogo(double screenHeight) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.05),
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
    );
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
      {'url': 'https://github.com/Frosh-TIET', 'asset': 'assets/images/iconGit.webp', 'scale': 0.0006},
      {'url': 'https://www.facebook.com/froshtiet/', 'asset': 'assets/images/iconFb.webp', 'scale': 0.0006},
      {'url': 'https://www.instagram.com/froshtiet/', 'asset': 'assets/images/iconIg.webp', 'scale': 0.0006},
      {'url': 'https://www.youtube.com/froshtiet/', 'asset': 'assets/images/iconYt.webp', 'scale': 0.0006},
      {'url': 'mailto:frosh@thapar.edu', 'asset': 'assets/images/iconMail.webp', 'scale': 0.0006},
      {'url': 'https://www.froshtiet.com/', 'asset': 'assets/images/iconWeb.webp', 'scale': 0.0006},
    ];

    return socialItems.map((item) => _buildSocialItem(item, screenHeight)).toList();
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
