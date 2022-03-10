// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Unlimited extends StatefulWidget {
  const Unlimited({Key? key}) : super(key: key);

  @override
  State<Unlimited> createState() => _UnlimitedState();
}

class _UnlimitedState extends State<Unlimited> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Paket Unlimited"),
    );
  }
}
