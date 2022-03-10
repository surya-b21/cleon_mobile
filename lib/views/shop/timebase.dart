// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TimeBase extends StatefulWidget {
  const TimeBase({Key? key}) : super(key: key);

  @override
  State<TimeBase> createState() => _TimeBaseState();
}

class _TimeBaseState extends State<TimeBase> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, left: 10, bottom: 5),
          child: Text(
            "Wireless",
            style: TextStyle(fontSize: 15, color: Colors.black54),
          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("Time Base Wireless 3 jam"),
            subtitle: Text("Masa aktif 3 jam, 2.5 mpbs"),
            trailing: Text("Rp. 2000"),
          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("Time Base Wireless 10 jam"),
            subtitle: Text("Masa aktif 10 jam, 2.5 mpbs"),
            trailing: Text("Rp. 5000"),
          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("Time Base Wireless 24 jam"),
            subtitle: Text("Masa aktif 24 jam, 2.5 mpbs"),
            trailing: Text("Rp. 10000"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 10, bottom: 5),
          child: Text(
            "Optik",
            style: TextStyle(fontSize: 15, color: Colors.black54),
          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("Time Base Optik 3 Jam"),
            subtitle: Text("Masa aktif 3 jam, 5 mpbs"),
            trailing: Text("Rp. 2000"),
          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("Time Base Optik 3 Jam"),
            subtitle: Text("Masa aktif 3 jam, 5 mpbs"),
            trailing: Text("Rp. 2000"),
          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("Time Base Optik 3 Jam"),
            subtitle: Text("Masa aktif 3 jam, 5 mpbs"),
            trailing: Text("Rp. 2000"),
          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("Time Base Optik 3 Jam"),
            subtitle: Text("Masa aktif 3 jam, 5 mpbs"),
            trailing: Text("Rp. 2000"),
          ),
        ),
      ],
    );
  }
}
