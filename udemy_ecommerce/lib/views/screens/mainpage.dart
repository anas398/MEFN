import 'package:flutter/material.dart';
import 'package:udemy_ecommerce/views/screens/nav_bar/fav_screen.dart';
import 'package:udemy_ecommerce/views/screens/nav_bar/homepage.dart';
import 'package:udemy_ecommerce/views/screens/nav_bar/store_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex =0;
  final List<Widget> bodies = [
    HomePage(),
    FavScreen(),
    StoreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    print("SELCET INDEX>>> ${selectedIndex}");
    return  Scaffold(
      body: bodies[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
        ],
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        currentIndex: selectedIndex,
        onTap: (va){

          setState(() {
            selectedIndex = va;
          });
        },

      ),



    );
  }
}
