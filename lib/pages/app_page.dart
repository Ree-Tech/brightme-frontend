import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/pages/activity/activity_page.dart';
import 'package:bright_me/pages/detection/detection_popup.dart';
import 'package:bright_me/pages/homepage/home_page.dart';
import 'package:bright_me/pages/profile/profile_page.dart';
import 'package:bright_me/pages/shop/shop_page.dart';
import 'package:flutter/material.dart';

class AppPages extends StatefulWidget {
  const AppPages({super.key});

  @override
  State<AppPages> createState() => _AppPagesState();
}

class _AppPagesState extends State<AppPages> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    ActivityPage(),
    HomePage(),
    ShopPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(34.0),
          topRight: Radius.circular(34.0),
        ),
        child: Container(
          decoration: BoxDecoration(boxShadow: boxShadow),
          child: BottomNavigationBar(
            elevation: 3,
            backgroundColor: lightWhite,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            selectedItemColor: purpleColor,
            unselectedItemColor: greyColor,
            selectedLabelStyle: reguler(
              sizeFont: 12,
              colorFont: purpleColor,
            ),
            unselectedLabelStyle: reguler(
              sizeFont: 12,
              colorFont: greyColor,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.access_time_outlined,
                ),
                label: "Activity",
              ),
              BottomNavigationBarItem(
                icon: SizedBox
                    .shrink(), // FAB is in the center, so no need for an icon
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                label: "Shop",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () async {
          await dialogPopUP(context);
        },
        child: Image.asset("assets/images/face.jpg"),
      ),
    );
  }
}
