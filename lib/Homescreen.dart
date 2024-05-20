import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Fav_page.dart';
import 'package:flutter_application_1/Rest_page.dart';
import 'package:flutter_application_1/Settings_page.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomesState();
}

class _HomesState extends State<Homescreen> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        // backgroundColor: Colors.grey,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            TasteRestaurantsPage(),
            TasteFavoritesPage(),
            TasteSettingsPage()
          ],
        ),
        bottomNavigationBar: WaterDropNavBar(
          bottomPadding: 25,
          backgroundColor: navigationBarColor,
          waterDropColor: Colors.pink,
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          selectedIndex: selectedIndex,
          barItems: <BarItem>[
            BarItem(filledIcon: Icons.home, outlinedIcon: Icons.home_outlined),
            BarItem(
              filledIcon: Icons.favorite,
              outlinedIcon: Icons.favorite_border,
            ),
            BarItem(
              filledIcon: Icons.settings,
              outlinedIcon: Icons.settings_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
