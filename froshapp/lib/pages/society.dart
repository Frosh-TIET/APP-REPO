import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:froshapp/tech_nontech/nontech_pg.dart';
import 'society_state.dart';

class SocietyPage extends StatelessWidget {
  const SocietyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SocietyState(),
      child: const _SocietyPageContent(),
    );
  }
}

class _SocietyPageContent extends StatelessWidget {
  const _SocietyPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bgr.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              _buildLogo(context, screenHeight),
              SizedBox(height: screenHeight * 0.035),
              _buildToggleButtons(context, screenHeight, screenWidth),
              _buildContent(),
            ],
          ),
          _buildBackButton(context, screenHeight),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context, double screenHeight) {
    return Center(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/logo.png",
            height: screenHeight * 0.165,
            width: screenHeight * 0.36,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButtons(BuildContext context, double screenHeight, double screenWidth) {
    return Consumer<SocietyState>(
      builder: (context, state, _) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildToggleButton(context, 'T E C H', state.isTechSelected, () => state.toggleView(true), screenHeight, screenWidth),
          _buildToggleButton(context, 'N O N  T E C H', !state.isTechSelected, () => state.toggleView(false), screenHeight, screenWidth),
        ],
      ),
    );
  }

  Widget _buildToggleButton(BuildContext context, String text, bool isSelected, VoidCallback onTap, double screenHeight, double screenWidth) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: screenHeight * 0.043,
        width: screenWidth * 0.34,
        decoration: BoxDecoration(
          color: isSelected ? const Color.fromRGBO(29, 78, 137, 1) : const Color(0xff5b615f),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.042,
              fontFamily: 'Font',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: Consumer<SocietyState>(
        builder: (context, state, _) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: state.isTechSelected ?  Tech() :  NonTech(),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context, double screenHeight) {
    return Positioned(
      top: screenHeight * 0.087,
      left: screenHeight * 0.012,
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}