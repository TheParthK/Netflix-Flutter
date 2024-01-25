import 'package:flutter/material.dart';

class BottomNavBarButton extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool selected;
  final VoidCallback function;
  const BottomNavBarButton({super.key, required this.selected, required this.name, required this.icon, required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white.withAlpha(selected?255:100),),
          Text(name, style: TextStyle(fontSize: 12, color: Colors.white.withAlpha(selected?220:80)),)
        ],
      ),
    );
  }
}