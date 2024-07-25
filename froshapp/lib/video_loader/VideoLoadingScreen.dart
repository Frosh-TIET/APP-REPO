import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoLoadingScreen extends StatefulWidget {
  final String videoAsset;

  const VideoLoadingScreen({Key? key, required this.videoAsset})
      : super(key: key);

  @override
  _VideoLoadingScreenState createState() => _VideoLoadingScreenState();
}

class _VideoLoadingScreenState extends State<VideoLoadingScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAsset)
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Container();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class VideoPageRoute extends PageRouteBuilder {
  final Widget page;
  final String videoAsset;
  final Duration forwardDuration;
  final double? width;
  final double? height;
  final BoxFit fit;

  VideoPageRoute({
    required this.page,
    required this.videoAsset,
    this.forwardDuration = const Duration(seconds: 3),
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: forwardDuration,
          reverseTransitionDuration: Duration.zero,
          opaque: false,
          barrierDismissible: false,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return VideoTransition(
              child: child,
              videoAsset: videoAsset,
              duration: forwardDuration,
              width: width,
              height: height,
              fit: fit,
              animation: animation,
            );
          },
        );
}

class VideoTransition extends StatefulWidget {
  final Widget child;
  final String videoAsset;
  final Duration duration;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Animation<double> animation;

  const VideoTransition({
    Key? key,
    required this.child,
    required this.videoAsset,
    required this.duration,
    required this.animation,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  _VideoTransitionState createState() => _VideoTransitionState();
}

class _VideoTransitionState extends State<VideoTransition>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late AnimationController _fadeController;
  bool _isVideoFinished = false;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _controller = VideoPlayerController.asset(widget.videoAsset)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        Future.delayed(widget.duration - Duration(milliseconds: 500), () {
          _fadeController.forward();
          Future.delayed(Duration(milliseconds: 500), () {
            setState(() {
              _isVideoFinished = true;
            });
          });
        });
      });

    widget.animation.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _isVideoFinished = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The next page, initially invisible
        Opacity(
          opacity: _fadeController.value,
          child: widget.child,
        ),
        // The video layer
        if (!_isVideoFinished)
          Container(
            color: Colors.black,
            child: _controller.value.isInitialized
                ? Center(
                    child: SizedBox(
                      width: widget.width,
                      height: widget.height,
                      child: FittedBox(
                        fit: widget.fit,
                        child: SizedBox(
                          width: _controller.value.size.width,
                          height: _controller.value.size.height,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _fadeController.dispose();
    super.dispose();
  }
}
