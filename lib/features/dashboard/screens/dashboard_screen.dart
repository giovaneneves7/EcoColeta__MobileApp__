import 'package:ecocoleta/features/home/screens/home_screen.dart';
import 'package:ecocoleta/features/map/screens/map_screen.dart';
import 'package:ecocoleta/features/settings/screens/settings_screen.dart';
import 'package:flutter/widgets.dart';

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
    
    return Placeholder();
    
  }


}