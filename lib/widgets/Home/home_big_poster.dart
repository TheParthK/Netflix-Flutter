import 'package:flutter/material.dart';

class HomeBigPoster extends StatelessWidget {
  final bool isPlaying;
  const HomeBigPoster({super.key, required this.isPlaying});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedOpacity(
      duration: const Duration(seconds: 1),
      opacity: isPlaying ? 0 : 1,
      child: Container(
        width: size.width,
        height: 1.5 * size.width,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://i.pinimg.com/564x/a5/ff/b0/a5ffb09e427e17512e774ac428749b83.jpg'),
            fit: BoxFit.cover,
          )
        ),
      ),
    );
  }
}