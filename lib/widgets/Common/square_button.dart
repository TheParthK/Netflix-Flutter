import 'package:flutter/material.dart';

class CommonSquareButton extends StatelessWidget {
  final IconData icon;
  const CommonSquareButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        border: Border.all(color: Colors.white, width: 1)
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}