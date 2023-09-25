import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key, required this.currentPage, required this.pageController});

  int currentPage;
  PageController pageController;


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentPage,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 35.0,), label: "",),
        BottomNavigationBarItem(
          icon: Icon(Icons.pin_drop, size: 35.0,), label: "",),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, size: 35.0,), label: "",),
      ],
      onTap: (page) {
        pageController.animateToPage(page,
          duration: const Duration(milliseconds: 400), curve: Curves.ease,);
      },
    );
  }
}
