// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final selectedIndex;
  final ValueChanged<int> onClicked;
  const BottomNavBar({Key? key, this.selectedIndex, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onClicked,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Color(0xff867EBA),
      unselectedItemColor: Colors.white54,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Color(0xff2A2F4A)),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Beli Paket",
            backgroundColor: Color(0xff2A2F4A)),
        BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Lainnya",
            backgroundColor: Color(0xff2A2F4A))
      ],
    );
  }
}
