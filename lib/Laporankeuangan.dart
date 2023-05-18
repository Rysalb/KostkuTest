import 'package:flutter/material.dart';
import 'package:projectmppl/daftarakun.dart';
import 'package:projectmppl/passbaru.dart';
import 'package:projectmppl/tambahlaporan.dart';

import 'Login.dart';
import 'home.dart';
import 'lupapass.dart';
import 'ubahprofile.dart';

class laporankeuangan extends StatefulWidget {

  @override
  State<laporankeuangan> createState() => _laporankeuanganState();
}

class _laporankeuanganState extends State<laporankeuangan> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.deepOrange,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('KostKu',style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              ),
              Padding(
                padding: const EdgeInsets.only(left : 2.0),
                child: Text('Laporan Keuangan',style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 1000,
                  height: 20,
                  color: Colors.yellow[100],
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                  margin: new EdgeInsets.symmetric(horizontal: 10.0),
                  width: 1000,
                  decoration: new BoxDecoration(
                      color: Colors.yellow[100]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(padding: const EdgeInsets.only(left: 25.0),
                            child: Text(
                              '25',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 60.0),
                            child: Text(
                              'Pembayaran Listrik', style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Maret 2022',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text(
                              'Rp.400.000', style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 80.0),
                            child: Text(
                              'Pengeluaran', style: TextStyle(
                              color: Colors.black45,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child:
                  Container(
                    margin: new EdgeInsets.symmetric(horizontal: 10.0),
                    width: 1000,
                    decoration: new BoxDecoration(
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.yellow[100]
                      ),
                      onPressed: () {Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => tambahlaporan()));

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Icon(Icons.add_circle,
                                color: Colors.black,
                                size: 50.0,)
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5,left: 15.0),
                            child: Text(
                              'Tambah Laporan',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

