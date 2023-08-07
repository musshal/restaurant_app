import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/ui/restaurant_favorite_page.dart';
import 'package:restaurant_app/ui/restaurant_list_page.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

import '../data/api/api_service.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: secondaryColor,
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: (selected) {
          setState(() {
            _bottomNavIndex = selected;
          });
        },
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          activeColor: secondaryColor, items: _bottomNavBarItems),
      tabBuilder: (_, index) {
        switch (index) {
          case 1:
            return const RestaurantFavoritePage();
          default:
            return const RestaurantListPage();
        }
      },
    );
  }

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.news : Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.favorite),
      label: "Favorite",
    ),
  ];

  final List<Widget> _listWidget = [
    ChangeNotifierProvider(
      create: (_) => RestaurantProvider(apiService: ApiService()),
      child: const RestaurantListPage(),
    ),
    const RestaurantFavoritePage(),
  ];
}
