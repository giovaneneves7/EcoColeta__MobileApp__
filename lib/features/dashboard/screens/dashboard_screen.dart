import 'package:ecocoleta/features/home/screens/home_screen.dart';
import 'package:ecocoleta/features/map/screens/map_screen.dart';
import 'package:ecocoleta/features/settings/screens/settings_screen.dart';
import 'package:ecocoleta/features/splash/controllers/splash_controller.dart';
import 'package:ecocoleta/features/dashboard/widgets/bottom_nav_item_widget.dart';
import 'package:ecocoleta/util/images.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget{
  
  final int pageIndex;
  final bool fromSplash;

  const DashboardScreen({super.key, required this.pageIndex, this.fromSplash = false});
  
  @override
  State<StatefulWidget> createState() => DashboardScreenState();

}

class DashboardScreenState extends State<DashboardScreen>{
  
  PageController? _pageController;
  int _pageIndex = 0;
  late List<Widget> screens;
  late bool isLogin;
  bool isActive = false;
  bool _canExit = GetPlataform.isWeb ? true : false;

  void _setPage(int pageIndex){

    setState(() {

      _pageController!.jumpToPage(pageIndex);
      _pageIndex = pageIndex;

    });

  }

  @override
  void initState(){

    super.initState();

    _pageIndex = widget.pageIndex;
    _pageController = PageController(initialPage: widget.pageIndex);

    const _screens = [
      const HomeScreen(),
      const MapScreen(),
      const SettingsScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    
    final Size size = MediaQuery.of(context).size;
    bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return GetBuilder<SplashController>(builder: (splashController) {

      return PopScope(

        canPop: Navigator.canPop(context),
        onPopInvoked: (value) async {
          if(_pageIndex != 0){
            _setPage(0);
          } else {
            
            //'if' para verificar se está carregando
            if(_canExit){

              if (GetPlatform.isAndroid) {
                    SystemNavigator.pop();
              } else if (GetPlatform.isIOS) {
                    exit(0);
              }
            } else {

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('back_press_again_to_exit'.tr, style: const TextStyle(color: Colors.white)),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 2),
                  margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              ));
              
              _canExit = true;
              
              Timer(const Duration(seconds: 2), () {
                _canExit = false;
              });

            }

          }
        },
        child: GetBuilder<AlgumController>(builder: (algumController) {

          return Scaffold(

            key: _scaffoldKey,
            body: ExpandableBottomSheet(

              background: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: _screens.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return _screens[index];
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GetBuilder<SplashController>(builder: (splashController) {

                      _screens = [
                        // mudar ícones para telas se for catador ou usuário normal
                        const HomeScreen(),
                        const MapScreen(),
                        const SettingsScreen()
                      ];

                      return Container(
                        width: size.width, height: GetPlatform.isIOS ? 80 : 65,
                        decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(Dimensions.radiusLarge)),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5)],
                      ),

                      child: Stack(
                        children: [

                          Center(
                            heightFactor: 0.6,
                            Center(
                              child: SizedBox(
                                width: size.width, height: 80,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children : [
                                        BottomNavItemWidget(
                                          title: 'home'.tr, selectedIcon: Images.unselectedHome,
                                          unSelectedIcon: Images.unselectedHome, isSelected: _pageIndex == 0,
                                          onTap: () => _setPage(0),
                                        ),
                                        Container(width: size.width * 0.2),
                                        BottomNavItemWidget(
                                          title: 'map'.tr, selectedIcon: Images.unselectedLocation, 
                                          unSelectedIcon: Images.unselectedLocation,
                                          isSelected: _pageIndex == 1, onTap: () => _setPage(1),
                                        ),
                                        BottomNavItemWidget(
                                          title: 'settings'.tr, selectedIcon: Images.menu, 
                                          unSelectedIcon: Images.unselectedSettings,
                                          isSelected: _pageIndex == 2, onTap: () => _setPage(2),
                                        ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),

                    }),
                  ),
                ],
              ),
            ),
            persistentContentHeight: 100,
            enableToggle: true,
            
          );

        }),

      );

    });
    
  }


}