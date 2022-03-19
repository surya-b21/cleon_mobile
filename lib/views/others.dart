// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cleon_mobile/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Others extends StatelessWidget {
  const Others({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffdedede),
          elevation: 0,
        ),
      ),
      backgroundColor: Color(0xffdedede),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.only(left: 7, right: 7, bottom: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama",
                    style: TextStyle(fontSize: 10, color: Color(0xff6B6A6A)),
                  ),
                  Text("Mas Joni")
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 7, right: 7, bottom: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListTile(
              leading: Icon(Icons.email),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 10, color: Color(0xff6B6A6A)),
                  ),
                  Text("masjoni@gmail.com")
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 7, right: 7, bottom: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListTile(
              leading: Icon(Icons.password),
              title: Text("Ubah Kata Sandi"),
              subtitle: Text("Ubah kata sandi anda dengan kata sandi baru"),
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 7, right: 7, bottom: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListTile(
              leading: Icon(Icons.contact_support),
              title: Text("Kontak"),
              onTap: () {
                Navigator.pushNamed(context, '/kontak');
              },
            ),
          ),
          SizedBox(
            width: 150,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(Logout());
              },
              child: Text("Logout"),
            ),
          )
        ],
      ),
    );
  }
}
