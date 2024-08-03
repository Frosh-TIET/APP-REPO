import 'package:flutter/material.dart';
import 'dart:ui';

class SocietyGridItem extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback onTap;

  const SocietyGridItem({
    Key? key,
    required this.image,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(19),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  image,
                  height: MediaQuery.of(context).size.width * 0.23,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.03),
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Main',
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedSocietyDialog extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final int currentIndex;

  const AnimatedSocietyDialog({
    Key? key,
    required this.items,
    required this.currentIndex,
  }) : super(key: key);

  @override
  _AnimatedSocietyDialogState createState() => _AnimatedSocietyDialogState();
}

class _AnimatedSocietyDialogState extends State<AnimatedSocietyDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  void _navigateTo(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Stack(
          children: [
            AlertDialog(
              backgroundColor: Colors.transparent,
              content: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: MediaQuery.of(context).size.height * 0.4,
                  height: MediaQuery.of(context).size.width * 1.1,
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(38),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        widget.items[_currentIndex]['image'],
                        height: MediaQuery.of(context).size.width * 0.3,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                      Text(
                        widget.items[_currentIndex]['name'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Main'
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            widget.items[_currentIndex]['text'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width * 0.04,
                              fontFamily: 'desc'
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildNavigationButton(
              alignment: Alignment.centerLeft,
              icon: Icons.arrow_back_ios,
              onPressed: () {
                _navigateTo(_currentIndex > 0 ? _currentIndex - 1 : widget.items.length - 1);
              },
            ),
            _buildNavigationButton(
              alignment: Alignment.centerRight,
              icon: Icons.arrow_forward_ios,
              onPressed: () {
                _navigateTo(_currentIndex < widget.items.length - 1 ? _currentIndex + 1 : 0);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton({
    required Alignment alignment,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Align(
      alignment: alignment,
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        iconSize: MediaQuery.of(context).size.width * 0.11,
        onPressed: onPressed,
      ),
    );
  }
}