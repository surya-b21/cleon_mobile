// ignore_for_file: prefer_const_constructors

import 'package:cleon_mobile/models/paket.dart';
import 'package:cleon_mobile/views/shop/pembayaran.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPaket extends StatelessWidget {
  final Paket paket;
  const DetailPaket({Key? key, required this.paket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat("#,###", "pt");
    return Scaffold(
      backgroundColor: Color(0xffdedede),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 25),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              color: Color(0xff2F2E41),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                )
              ],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                paket.nama,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 0),
                  )
                ],
                borderRadius: BorderRadius.circular(20)),
            child: Column(children: [
              ListTile(
                title: Text(
                  "Masa Aktif",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Text(paket.aktif.toString() + " hari",
                    style: TextStyle(fontSize: 20)),
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Text(
                  "Kecepatan",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Text(paket.speed.toString() + " Mbps",
                    style: TextStyle(fontSize: 20)),
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                paket.keterangan,
                style: TextStyle(fontSize: 20),
              )
            ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 0),
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                ListTile(
                  title: Text("Harga"),
                  trailing: Text("Rp. ${currency.format(paket.harga)}"),
                ),
                SizedBox(
                  width: 250,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff867EBA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Beli",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Pembayaran(paket: paket)));
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
