import 'package:flutter/material.dart';

import '../screens/basketscreen.dart';
import '../screens/categoryscreen.dart';
import '../screens/favoritescreen.dart';
import '../screens/homescreen.dart';
import '../screens/profilescreen.dart';

class MyBottomNavigationBar extends StatefulWidget{
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBar();
}

class _MyBottomNavigationBar extends State<MyBottomNavigationBar>{
  int currentIndex = 0;
  final screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoriteScreen(),
    const BasketScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Ana Sayfa"
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: "Kategoriler"
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.add_task_sharp),
            label: "Favorilerim"
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: "Sepetim"
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profilim"
            )
        ],
        backgroundColor: const Color.fromARGB(153, 89, 34, 134),
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index ),
        selectedItemColor: const Color.fromARGB(153, 45, 12, 71),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        ),
    );
  }
}