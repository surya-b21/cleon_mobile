// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Ss extends StatefulWidget {
  const Ss({Key? key}) : super(key: key);

  @override
  State<Ss> createState() => _SsState();
}

class _SsState extends State<Ss> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("SS 1 50 GB"),
            subtitle: Text("Masa aktif 30 hari, 1.6 mpbs"),
            trailing: Text("Rp 50.000"),
          ),
        ),
        Card(
          margin: EdgeInsets.only(right: 10, left: 10, bottom: 5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("SS 2 50 GB"),
            subtitle: Text("Masa aktif 30 hari, 1.6 mpbs"),
            trailing: Text("Rp 100.000"),
          ),
        ),
      ],
    );
  }
}
