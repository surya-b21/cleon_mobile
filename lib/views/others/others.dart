// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cleon_mobile/api/api_services.dart';
import 'package:cleon_mobile/bloc/auth/auth_bloc.dart';
import 'package:cleon_mobile/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class Others extends StatefulWidget {
  const Others({Key? key}) : super(key: key);

  @override
  State<Others> createState() => _OthersState();
}

class _OthersState extends State<Others> {
  late Future<User> futureUser;
  final api = ApiServices();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    futureUser = api.getUser();
  }

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
                  FutureBuilder<User>(
                      future: futureUser,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!.name);
                        } else {
                          return Shimmer(
                            gradient: LinearGradient(stops: [
                              0.4,
                              0.5,
                              0.6
                            ], colors: [
                              Colors.black.withOpacity(0.25),
                              Colors.white.withOpacity(0.5),
                              Colors.black.withOpacity(0.25)
                            ]),
                            child: Container(
                              height: 20,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black.withOpacity(0.25)),
                            ),
                          );
                        }
                      }),
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
                  FutureBuilder<User>(
                      future: futureUser,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!.email);
                        } else {
                          return Shimmer(
                            gradient: LinearGradient(stops: [
                              0.4,
                              0.5,
                              0.6
                            ], colors: [
                              Colors.black.withOpacity(0.25),
                              Colors.white.withOpacity(0.5),
                              Colors.black.withOpacity(0.25)
                            ]),
                            child: Container(
                              height: 20,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black.withOpacity(0.25)),
                            ),
                          );
                        }
                      }),
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
              onTap: () {
                Navigator.pushNamed(context, '/ganti-password');
              },
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
