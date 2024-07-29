import 'package:flutter/material.dart';
import 'package:froshapp/nav/refer_nav.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _videoFinished = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/splash_video.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(false);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);

    _initializeVideoPlayerFuture.then((_) {
      setState(() {});
      _controller.play();
    });

    _controller.addListener(() {
      if (_controller.value.position >= _controller.value.duration) {
        _startFadeOut();
      }
    });
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
          // FirstPage is always present underneath
          Positioned.fill(
            child: FirstPage(),
          ),
          // Video overlay with fade-out effect
          if (!_videoFinished)
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Opacity(
                  opacity: _animation.value,
                  child: child,
                );
              },
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      color: Colors.black,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _controller.value.size.width,
                          height: _controller.value.size.height,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    );
                  } else {
                    return Container(color: Colors.black);
                  }
                },
              ),
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