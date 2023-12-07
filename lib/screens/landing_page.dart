import 'package:flutter/material.dart';
import 'package:netflix/screens/home_page.dart';
import 'package:netflix/screens/search_page.dart';
import '../widgets/Common/bottom_bar.dart';
import '../widgets/Common/topbar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController pageController = PageController();
  int currentPage = 0;
  goToSearch(){
    setState(() {
      currentPage = 1;
    });
    pageController.animateToPage(1, duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }
  goToHome(){
    FocusScope.of(context).unfocus();
    setState(() {
      currentPage = 0;
    });
    pageController.animateToPage(0, duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              const HomePage(),
              SearchPage(backFunction: goToHome,)
            ],
          ),
          const TopBar(),
          BottomBar(homeFunction: goToHome, searchFunction: goToSearch, currentPage: currentPage,)
        ],
      ),
    );
  }
}
