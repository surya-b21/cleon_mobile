// ignore_for_file: prefer_const_constructors

import 'package:cleon_mobile/api/api_services.dart';
import 'package:cleon_mobile/models/paket.dart';
import 'package:cleon_mobile/utils/constant.dart';
import 'package:cleon_mobile/views/shop/detail_paket.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Unlimited extends StatefulWidget {
  const Unlimited({Key? key}) : super(key: key);

  @override
  State<Unlimited> createState() => _UnlimitedState();
}

class _UnlimitedState extends State<Unlimited> {
  final api = ApiServices();
  late Future<List<Paket>> futurePaket;
  final currency = NumberFormat("#,###", "pt");
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    futurePaket = api.getPaket(jenisPaket['unlimited']);
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
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: ListTile(
                        title: Text(data.nama),
                        subtitle: Text(data.keterangan),
                        trailing: Text("Rp. ${currency.format(data.harga)}"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPaket(paket: data)));
                        },
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(color: Color(0xff867EBA)),
              ),
            );
          }
        });
  }
}
