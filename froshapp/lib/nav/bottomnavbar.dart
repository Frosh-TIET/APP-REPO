import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const NavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02,
            vertical: screenHeight * 0.02,
          ),
          child: Row(
            children: [
              Flexible(
                child: GNav(
                  textStyle: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                  iconSize: screenWidth * 0.06,
                  tabBorderRadius: screenWidth * 0.1,
                  backgroundColor: Colors.black,
                  color: Colors.white,
                  haptic: true,
                  activeColor: Colors.white,
                  duration: const Duration(milliseconds: 450),
                  tabBackgroundColor: const Color.fromRGBO(180, 196, 0, 0.7),
                  gap: screenWidth * 0.01,
                  padding: const EdgeInsets.all(15),
                  onTabChange: (value) => onTabChange!(value),
                  tabs: [
                    const GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    const GButton(
                      icon: Icons.person_2_rounded,
                      text: 'Schedule',
                    ),
                    const GButton(
                      icon: Icons.map_rounded,
                      text: 'Campus Map',
                    ),
                    const GButton(
                      icon: Icons.link_rounded,
                      text: 'Contact Us',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
