// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Unlimited extends StatefulWidget {
  const Unlimited({Key? key}) : super(key: key);

  @override
  State<Unlimited> createState() => _UnlimitedState();
}

class _UnlimitedState extends State<Unlimited> {
  List<dynamic> wireless = [
    [1, "60.000", 30, 1.6],
    [2, "100.000", 30, 2.5],
  ];

  List<dynamic> optik = [
    [1, "30.000", 30, 1.2],
    [2, "60.000", 30, 3],
    [3, "100.000", 30, 4],
  ];

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
            title: Text("HEMAT ${wireless[0][0]}"),
            subtitle: Text(
                "Masa aktif ${wireless[0][2]} hari, ${wireless[0][3]} Mpbs"),
            trailing: Text("Rp ${wireless[0][1]}"),
          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("HEMAT ${wireless[1][0]}"),
            subtitle: Text(
                "Masa aktif ${wireless[1][2]} hari, ${wireless[1][3]} Mpbs"),
            trailing: Text("Rp ${wireless[1][1]}"),
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
            title: Text("OK ${optik[0][0]}"),
            subtitle:
                Text("Masa aktif ${optik[0][2]} hari, ${optik[0][3]} Mpbs"),
            trailing: Text("Rp ${optik[0][1]}"),
          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("OK ${optik[1][0]}"),
            subtitle:
                Text("Masa aktif ${optik[1][2]} hari, ${optik[1][3]} Mpbs"),
            trailing: Text("Rp ${optik[1][1]}"),
          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("OK ${optik[2][0]}"),
            subtitle:
                Text("Masa aktif ${optik[2][2]} hari, ${optik[2][3]} Mpbs"),
            trailing: Text("Rp ${optik[2][1]}"),
          ),
        ),
      ],
    );
  }
}
