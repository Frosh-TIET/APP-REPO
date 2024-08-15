import 'package:flutter/material.dart';
import 'package:froshapp/nav/refer_nav.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _videoFinished = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
    _setupAnimation();
  }

  void _initializeVideo() async {
    _controller = VideoPlayerController.asset('assets/videos/splash_video.mp4');
    await _controller.initialize();
    setState(() {});
    _controller.play();
    _controller.addListener(_checkVideoCompletion);
  }

  void _setupAnimation() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);
  }

  void _checkVideoCompletion() {
    if (_controller.value.position >= _controller.value.duration - Duration(milliseconds: 500)) {
      if (!_animationController.isAnimating) {
        _startFadeOut();
      }
    }
  }

  void _startFadeOut() {
    _animationController.forward().then((_) {
      setState(() {
        _videoFinished = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: FirstPage(),
          ),
          if (!_videoFinished)
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Opacity(
                  opacity: _animation.value,
                  child: child,
                );
              },
              child: _controller.value.isInitialized
                  ? ColoredBox(
                      color: Colors.black,
                      child: Center(
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    )
                  : Container(color: Colors.black),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }
}