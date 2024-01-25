import 'package:flutter/material.dart';

import 'bottom_navbar_button.dart';

class BottomBar extends StatelessWidget {
  final VoidCallback homeFunction;
  final VoidCallback searchFunction;
  final int currentPage;
  const BottomBar({super.key, required this.homeFunction, required this.searchFunction, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter, end: Alignment.bottomCenter,
                stops: [0, 0.3],
                colors: [Colors.transparent,Colors.black]
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomNavBarButton(name: 'Home', icon: Icons.home, selected: currentPage == 0 ? true : false, function: homeFunction),
                BottomNavBarButton(name: 'Search', icon: Icons.search, selected: currentPage == 1 ? true : false, function: searchFunction,),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: devicePadding.bottom,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}