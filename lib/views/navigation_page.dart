//Coluna tem uma lista itens...

import 'package:flutter/material.dart';
import 'package:grocery_app/services/app_constants.dart';
import 'package:grocery_app/views/category_screen.dart';
import 'package:grocery_app/views/homepage.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentPageIndex = 0;

  late List<Widget>
      screens; //a palavra late, informa que faz a instancia qdo precisa

  @override
  void initState() {
    // TODO: implement initState
    screens = [
      const HomePage(),
      const CategoryScreen(),
      Container(
        color: Colors.blueGrey,
      ),
      Container(
        color: Colors.deepPurple,
      ),
      Container(),
    ];
    super.initState();
  }

  //Adicionar as outras navigation e add os icones (imagens)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentPageIndex],
      bottomNavigationBar: NavigationBar(
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
          ]),
    );
  }
}
