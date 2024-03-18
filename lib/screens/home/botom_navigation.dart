import 'package:flutter/material.dart';

class MyBottomNavigation extends StatefulWidget {
  final Function onTap;
  const MyBottomNavigation({super.key, required this.onTap});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int selcetedIndex = 0;

  // onTap(int index) {
  //   setState(() {
  //     selcetedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              activeIcon: Icon(Icons.home_filled, color: Colors.black),
              backgroundColor: Colors.teal.shade200),
          BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: "Orders",
              activeIcon: Icon(Icons.shopping_cart, color: Colors.black),
              backgroundColor: Colors.teal.shade200),
          BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: "Favorite",
              activeIcon: Icon(Icons.favorite, color: Colors.black),
              backgroundColor: Colors.teal.shade200),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person_2),
              label: "Profile",
              activeIcon: Icon(Icons.person_2, color: Colors.black),
              backgroundColor: Colors.teal.shade200)
        ],
        currentIndex: selcetedIndex,
        backgroundColor: Colors.teal,
        elevation: 0,
        onTap: (value) {
          setState(() {
            selcetedIndex = value;
          });
          widget.onTap(value);
        });
  }
}
