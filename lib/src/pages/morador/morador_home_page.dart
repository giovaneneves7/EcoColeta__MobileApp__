import "package:flutter/material.dart";

import 'morador_map_page.dart';
import 'morador_settings_page.dart';
import 'morador_inicial_page.dart';
import '../../widgets/bottom_bar.dart';

class MoradorHomePage extends StatefulWidget {
  MoradorHomePage({super.key});

  @override
  State<MoradorHomePage> createState() => _MoradorHomePageState();
}

class _MoradorHomePageState extends State<MoradorHomePage> {
  int _currentPage = 0;
  late PageController pageController;

  setCurrentPage(page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: [
            MoradorInicialPage(),
            MoradorMapPage(),
            MoradorSettingsPage(),
          ],
          onPageChanged: setCurrentPage,
        ),

        // === [ Barra de navegação inferior ] === //
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
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
        ),
      ),
    );
  }
}
