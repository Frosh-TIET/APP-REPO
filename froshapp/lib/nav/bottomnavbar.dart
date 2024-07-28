import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const NavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenHeight * 0.008,
          vertical: screenHeight * 0.014,
        ),
        child: SafeArea(
          child: Row(
            children: [
              Flexible(
                child: GNav(
                  textStyle: TextStyle(
                      fontSize: screenHeight * 0.015,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                  iconSize: screenHeight * 0.03,
                  tabBorderRadius: screenHeight * 0.1,
                  backgroundColor: Colors.transparent,
                  color: Colors.white,
                  haptic: true,
                  activeColor: Colors.white,
                  duration: const Duration(milliseconds: 450),
                  tabBackgroundColor: const Color.fromRGBO(126, 181, 208, 0.7),
                  gap: screenWidth * 0.01,
                  padding: const EdgeInsets.all(15),
                  onTabChange: (value) => onTabChange!(value),
                  tabs: [
                    const GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    const GButton(
                      icon: Icons.calendar_month,
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
