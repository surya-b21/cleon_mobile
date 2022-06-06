// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:cleon_mobile/views/bottomnavbar.dart';
import 'package:cleon_mobile/views/home/home.dart';
import 'package:cleon_mobile/views/others/others.dart';
import 'package:cleon_mobile/views/shop/shop.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  int _selectedIndex = 0;
  bool isOffline = false;

  @override
  void initState() {
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          isOffline = true;
        });
      }
    });
    // ignore: todo
    // TODO: implement initState
    super.initState();
    checkConnectivity();
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    _connectivitySubscription.cancel();
  }

  void onClicked(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  checkConnectivity() {
    return Fluttertoast.showToast(
        msg: "No Internet Found",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.red);
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
