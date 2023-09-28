import 'package:flutter/material.dart';
import '../../widgets/bottom_bar.dart';
import './catador_inicial_page.dart';
import './catador_map_page.dart';
import '../user/user_settings_page.dart';

class CatadorHomePage extends StatefulWidget {
  const CatadorHomePage({super.key});

  @override
  State<CatadorHomePage> createState() => _CatadorHomePageState();
}

class _CatadorHomePageState extends State<CatadorHomePage> {
  // ================================================ //
  //                     | ATTRIBUTES |               //
  // ================================================ //
  int _currentPage = 0;
  late PageController pageController;

  // ================================================ //
  //                     | METHODS |                  //
  // ================================================ //

  /**
   * @author Giovane Neves
   * @since v1.0.0
   *
   * Modifica o valor da página atual.
   *
   * @param page - O número da nova página.
   */
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
            CatadorInicialPage(),
            CatadorMapPage(),
            UserSettingsPage(),
          ],
        ),
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
            setState(() {
              _currentPage = page;
            });
          },
        ),
      ),
    );
  }
}
