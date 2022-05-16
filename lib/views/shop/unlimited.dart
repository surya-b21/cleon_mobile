// ignore_for_file: prefer_const_constructors

import 'package:cleon_mobile/api/api_services.dart';
import 'package:cleon_mobile/models/paket.dart';
import 'package:flutter/material.dart';

class Unlimited extends StatefulWidget {
  const Unlimited({Key? key}) : super(key: key);

  @override
  State<Unlimited> createState() => _UnlimitedState();
}

class _UnlimitedState extends State<Unlimited> {
  final api = ApiServices();
  late Future<List<Paket>> futurePaket;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurePaket = api.getPaket(5);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Paket>>(
        future: futurePaket,
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
  }
}
