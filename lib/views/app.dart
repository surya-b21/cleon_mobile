// ignore_for_file: prefer_const_constructors

import 'package:cleon_mobile/views/bottomnavbar.dart';
import 'package:cleon_mobile/views/home.dart';
import 'package:cleon_mobile/views/others.dart';
import 'package:cleon_mobile/views/shop/shop.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 1;

  void onClicked(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _page = [
    Home(),
    Shop(),
    Others(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectedIndex],
      bottomNavigationBar:
          BottomNavBar(onClicked: onClicked, selectedIndex: _selectedIndex),
    );
  }
}
