import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zido_app/utilities/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zido_app/view/screens/home_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => new _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int i = 0;
  var pages = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: pages[i],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/home.svg'),
            title: Text('home'.tr()),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/shopping_cart.svg'),
            title: Text('buy'.tr()),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/sell.svg'),
            title: Text('sell'.tr()),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/profile.svg'),
            title: Text('account'.tr()),
          ),
        ],
        currentIndex: i,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.titleColor,
        unselectedLabelStyle: TextStyle(color: AppColors.titleColor),
        selectedLabelStyle: TextStyle(color: AppColors.primaryColor),
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => i = index),
      ),
    );
  }
}
