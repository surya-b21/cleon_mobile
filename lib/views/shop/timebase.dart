// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cleon_mobile/api/api_services.dart';
import 'package:cleon_mobile/models/paket.dart';
import 'package:flutter/material.dart';

class TimeBase extends StatefulWidget {
  const TimeBase({Key? key}) : super(key: key);

  @override
  State<TimeBase> createState() => _TimeBaseState();
}

class _TimeBaseState extends State<TimeBase> {
  final api = ApiServices();
  late Future<List<Paket>> getPaket;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPaket = api.getPaket(3);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Paket>>(
        future: getPaket,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data![index];
                  return Card(
                    margin: EdgeInsets.only(
                        top: 10, right: 10, left: 10, bottom: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ListTile(
                      title: Text(data.nama),
                      subtitle: Text(data.keterangan),
                      trailing: Text("Rp. " + data.harga.toString()),
                    ),
                  );
                });
          } else {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
    // return ListView(
    //   children: [
    //     Padding(
    //       padding: EdgeInsets.only(top: 10, left: 10, bottom: 5),
    //       child: Text(
    //         "Wireless",
    //         style: TextStyle(fontSize: 15, color: Colors.black54),
    //       ),
    //     ),
    //     Card(
    //       margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
    //       shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(10))),
    //       child: ListTile(
    //         title: Text("Time Base Wireless 3 jam"),
    //         subtitle: Text("Masa aktif 3 jam, 2.5 mpbs"),
    //         trailing: Text("Rp. 2000"),
    //       ),
    //     ),
    //     Card(
    //       margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
    //       shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(10))),
    //       child: ListTile(
    //         title: Text("Time Base Wireless 10 jam"),
    //         subtitle: Text("Masa aktif 10 jam, 2.5 mpbs"),
    //         trailing: Text("Rp. 5000"),
    //       ),
    //     ),
    //     Card(
    //       margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
    //       shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(10))),
    //       child: ListTile(
    //         title: Text("Time Base Wireless 24 jam"),
    //         subtitle: Text("Masa aktif 24 jam, 2.5 mpbs"),
    //         trailing: Text("Rp. 10000"),
    //       ),
    //     ),
    //     Padding(
    //       padding: EdgeInsets.only(top: 10, left: 10, bottom: 5),
    //       child: Text(
    //         "Optik",
    //         style: TextStyle(fontSize: 15, color: Colors.black54),
    //       ),
    //     ),
    //     Card(
    //       margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
    //       shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(10))),
    //       child: ListTile(
    //         title: Text("Time Base Optik 3 Jam"),
    //         subtitle: Text("Masa aktif 3 jam, 5 mpbs"),
    //         trailing: Text("Rp. 2000"),
    //       ),
    //     ),
    //     Card(
    //       margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
    //       shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(10))),
    //       child: ListTile(
    //         title: Text("Time Base Optik 3 Jam"),
    //         subtitle: Text("Masa aktif 3 jam, 5 mpbs"),
    //         trailing: Text("Rp. 2000"),
    //       ),
    //     ),
    //     Card(
    //       margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
    //       shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(10))),
    //       child: ListTile(
    //         title: Text("Time Base Optik 3 Jam"),
    //         subtitle: Text("Masa aktif 3 jam, 5 mpbs"),
    //         trailing: Text("Rp. 2000"),
    //       ),
    //     ),
    //     Card(
    //       margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
    //       shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(10))),
    //       child: ListTile(
    //         title: Text("Time Base Optik 3 Jam"),
    //         subtitle: Text("Masa aktif 3 jam, 5 mpbs"),
    //         trailing: Text("Rp. 2000"),
    //       ),
    //     ),
    //   ],
    // );
  }
}
