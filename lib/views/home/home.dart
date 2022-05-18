// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cleon_mobile/api/api_services.dart';
import 'package:cleon_mobile/models/riwayat.dart';
import 'package:cleon_mobile/models/user.dart';
import 'package:cleon_mobile/views/home/detail_riwayat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<User> futureUser;
  late Future<List<Riwayat>> futureRiwayat;
  final api = ApiServices();

  @override
  void initState() {
    // ignore: todo
    // s
    super.initState();
    futureUser = api.getUser();
    futureRiwayat = api.getRiwayat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff2F2E41),
          centerTitle: false,
          leading: Icon(Icons.person),
          titleSpacing: 1,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          title: FutureBuilder<User>(
              future: futureUser,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "hi, " + snapshot.data!.name,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        snapshot.data!.email,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  );
                } else {
                  return CupertinoActivityIndicator(
                    color: Colors.white,
                  );
                }
              }),
        ),
      ),
      backgroundColor: Color(0xffdedede),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 10, bottom: 5),
            child: Text(
              "Riwayat Pembelian",
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Riwayat>>(
                future: futureRiwayat,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data![index];
                          return Card(
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: ListTile(
                                title: Text(data.nama),
                                trailing: Text(data.createdAt.day.toString() +
                                    "/" +
                                    data.createdAt.month.toString() +
                                    "/" +
                                    data.createdAt.year.toString()),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => DetailRiwayat(
                                                riwayat: data,
                                              )));
                                },
                              ));
                        });
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                        child: SizedBox(
                      width: 50,
                      height: 50,
                      child:
                          CircularProgressIndicator(color: Color(0xff867EBA)),
                    ));
                  } else {
                    return Center(
                      child: Text("Anda belum melakukan transaksi"),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
