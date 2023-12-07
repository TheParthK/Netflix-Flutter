import 'package:flutter/material.dart';
import 'package:netflix/widgets/Home/trailer_video_player.dart';
import 'package:video_player/video_player.dart';

import 'home_big_poster.dart';

class TrailerAndBigPoster extends StatelessWidget {
  final bool isPlaying;
  final VideoPlayerController videoPlayerController;
  const TrailerAndBigPoster({super.key, required this.isPlaying, required this.videoPlayerController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        HomeBigPoster(isPlaying: isPlaying),
        TrailerVideoPlayer(isPlaying: isPlaying, videoPlayerController: videoPlayerController)
      ],
    );
  }
}