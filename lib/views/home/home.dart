// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cleon_mobile/api/api_services.dart';
import 'package:cleon_mobile/models/user.dart';
import 'package:cleon_mobile/views/home/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List paket = List<String>.generate(15, (index) => "Paket SS ${index + 1} GB");
  late Future<List<User>> futureUser;
  final api = ApiServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureUser = api.getUser();
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
          title: FutureBuilder<List<User>>(
              future: futureUser,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "hi, " + snapshot.data![0].name,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        snapshot.data![0].email,
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
            child: ListView.builder(
                itemCount: paket.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ListTile(
                      title: Text(paket[index]),
                      trailing: Text('29/01/2022'),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Detail()));
                      },
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
