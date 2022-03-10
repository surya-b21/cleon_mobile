// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Kuota extends StatefulWidget {
  const Kuota({Key? key}) : super(key: key);

  @override
  State<Kuota> createState() => _KuotaState();
}

class _KuotaState extends State<Kuota> {
  final List<dynamic> wireless = [
    ["5K", 5, "5.000", 5],
    ["10K", 10, "10.000", 10],
    ["20K", 20, "20.000", 15],
    ["30K", 30, "30.000", 20],
    ["40K", 40, "40.000", 30]
  ];

  final List<dynamic> optik = [
    ["5K", 10, "5.000", 7],
    ["10K", 20, "10.000", 14],
    ["20K", 50, "20.000", 21]
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
            title: Text("KUOTA ${wireless[0][0]} ${wireless[0][1]}GB"),
            subtitle: Text("Masa aktif ${wireless[0][3]} hari, 2.5 mpbs"),
            trailing: Text("Rp ${wireless[0][2]}"),
          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("KUOTA ${wireless[1][0]} ${wireless[1][1]}GB"),
            subtitle: Text("Masa aktif ${wireless[1][3]} hari, 2.5 mpbs"),
            trailing: Text("Rp ${wireless[1][2]}"),
          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("KUOTA ${wireless[2][0]} ${wireless[2][1]}GB"),
            subtitle: Text("Masa aktif ${wireless[2][3]} hari, 2.5 mpbs"),
            trailing: Text("Rp ${wireless[2][2]}"),
          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("KUOTA ${wireless[3][0]} ${wireless[3][1]}GB"),
            subtitle: Text("Masa aktif ${wireless[3][3]} hari, 2.5 mpbs"),
            trailing: Text("Rp ${wireless[3][2]}"),
          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("KUOTA ${wireless[4][0]} ${wireless[4][1]}GB"),
            subtitle: Text("Masa aktif ${wireless[4][3]} hari, 2.5 mpbs"),
            trailing: Text("Rp ${wireless[4][2]}"),
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
            title: Text("KUOTA FO ${optik[0][0]} ${optik[0][1]}GB"),
            subtitle: Text("Masa aktif ${optik[0][3]} hari, 2.5 mpbs"),
            trailing: Text("Rp ${optik[0][2]}"),
          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("KUOTA FO ${optik[1][0]} ${optik[1][1]}GB"),
            subtitle: Text("Masa aktif ${optik[1][3]} hari, 2.5 mpbs"),
            trailing: Text("Rp ${optik[1][2]}"),
          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            title: Text("KUOTA FO ${optik[2][0]} ${optik[2][1]}GB"),
            subtitle: Text("Masa aktif ${optik[2][3]} hari, 2.5 mpbs"),
            trailing: Text("Rp ${optik[2][2]}"),
          ),
        ),
      ],
    );
  }
}
