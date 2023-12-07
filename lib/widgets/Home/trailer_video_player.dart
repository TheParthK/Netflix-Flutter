import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TrailerVideoPlayer extends StatelessWidget {
  final bool isPlaying;
  final VideoPlayerController videoPlayerController;
  const TrailerVideoPlayer({super.key, required this.isPlaying, required this.videoPlayerController});
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      opacity: isPlaying ? 1 : 0,
      child: AspectRatio(
      aspectRatio: videoPlayerController.value.aspectRatio,
      child: VideoPlayer(videoPlayerController)
      ),
    );
  }
}