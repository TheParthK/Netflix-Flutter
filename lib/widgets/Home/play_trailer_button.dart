import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayTrailerButton extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback playPause;
  const PlayTrailerButton({super.key, required this.isPlaying, required this.playPause});
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: InkWell(
          onTap: playPause,
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          splashColor: Colors.black.withAlpha(50),
          child: Ink(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(3))
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isPlaying ? 
                    CupertinoIcons.clear_thick : 
                    CupertinoIcons.play_arrow_solid,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    isPlaying ? 'Stop' : 
                    'Play Trailer',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}