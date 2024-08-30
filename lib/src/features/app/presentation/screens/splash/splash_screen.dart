import 'dart:async';
import 'dart:ui';

import 'package:chewie/chewie.dart';
import 'package:comic_book_app/src/config/settings/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  static const name = 'splash-screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    initializePlayer();
    startTimer();
    super.initState();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.asset(
      AppAssets.splashVideo,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      autoInitialize: true,
      looping: true,
      showControls: false,
      subtitleBuilder: (context, dynamic subtitle) => Container(
        child: subtitle is InlineSpan
            ? RichText(
                text: subtitle,
              )
            : Text(
                subtitle.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
      ),
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.red),
          ),
        );
      },
    );
    setState(() {});
  }

  startTimer() {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    context.go('/');
    _chewieController!.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(
                      AppAssets.splashVideoImage), //productImage
                  fit: BoxFit.fill,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints.expand(),
              child: _chewieController != null
                  ? Chewie(
                      controller: _chewieController!,
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ));
  }
}
