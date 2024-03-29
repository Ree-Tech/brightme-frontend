import 'package:bright_me/bloc/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bright_me/bloc/user/user_bloc.dart';
import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/pages/activity/activity_page.dart';
import 'package:bright_me/pages/detection/detection_popup.dart';
import 'package:bright_me/pages/homepage/home_page.dart';
import 'package:bright_me/pages/profile/profile_page.dart';
import 'package:bright_me/pages/shop/shop_page.dart';
import 'package:bright_me/widget/loading_wigdet.dart';

class AppPages extends StatefulWidget {
  final int? index;
  const AppPages({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  State<AppPages> createState() => _AppPagesState();
}

class _AppPagesState extends State<AppPages> {
  late int _currentIndex;
  @override
  void initState() {
    int page = widget.index ?? 0;
    _currentIndex = page;
    context.read<ProductBloc>().add(FetchListAllProduct());
    super.initState();
  }

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
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is FetchUserLoading) {
            return const LoadingWidget();
          }
          return _pages[_currentIndex];
        },
      ),
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
        child: Image.asset("assets/images/icon_face.png"),
      ),
    );
  }
}
