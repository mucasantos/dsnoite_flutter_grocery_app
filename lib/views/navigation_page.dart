//Coluna tem uma lista itens...

import 'package:flutter/material.dart';
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

            print(index);
          },
          selectedIndex: currentPageIndex,
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Badge(child: Icon(Icons.notifications_sharp)),
              label: 'Notifications',
            ),
          ]),
    );
  }
}
