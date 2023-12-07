import 'package:flutter/cupertino.dart';
import 'package:netflix/widgets/Home/play_trailer_button.dart';
import '../Common/square_button.dart';

class BigPosterOptionsBar extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback playPause;
  const BigPosterOptionsBar({super.key, required this.isPlaying, required this.playPause});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const CommonSquareButton(icon: CupertinoIcons.question),
          PlayTrailerButton(isPlaying: isPlaying, playPause: playPause),
          const CommonSquareButton(icon: CupertinoIcons.add),
        ],
      ),
    );
  }
}