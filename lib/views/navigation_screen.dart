import 'package:flutter/material.dart';
import 'package:grocery_app/services/app_constants.dart';
import 'package:grocery_app/views/cart_screen.dart';
import 'package:grocery_app/views/category_screen.dart';
import 'package:grocery_app/views/homepage.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentPageIndex = 0;
  late List<Widget> fragments;

  @override
  void initState() {
    fragments = [
      const HomePage(),
      const CategoryScreen(),
      const CartScreen(),
      Container(),
      Container()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fragments[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        elevation: 5,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: Image.asset(
              "assets/icons/home.png",
              color: mainColor,
            ),
            icon: Image.asset(
              "assets/icons/home.png",
            ),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Image.asset(
              "assets/icons/category.png",
              color: mainColor,
            ),
            icon: Image.asset(
              "assets/icons/category.png",
            ),
            label: 'Category',
          ),
          NavigationDestination(
            selectedIcon: Image.asset(
              "assets/icons/cart.png",
              color: mainColor,
            ),
            icon: Image.asset(
              "assets/icons/cart.png",
            ),
            label: 'Cart',
          ),
          NavigationDestination(
            selectedIcon: Image.asset(
              "assets/icons/favorite.png",
              color: mainColor,
            ),
            icon: Image.asset(
              "assets/icons/favorite.png",
            ),
            label: 'Favorite',
          ),
          NavigationDestination(
            selectedIcon: Image.asset(
              "assets/icons/profile.png",
              color: mainColor,
            ),
            icon: Image.asset(
              "assets/icons/profile.png",
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
