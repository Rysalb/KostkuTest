import 'package:flutter/material.dart';
import 'package:projectmppl/keuangan/pemasukan.dart';
import 'package:projectmppl/keuangan/pengeluaran.dart';


class tambahlaporan extends StatefulWidget {

  @override
  State<tambahlaporan> createState() => _tambahlaporanState();
}

class _tambahlaporanState extends State<tambahlaporan> {

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
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.yellow[100]
                    ),
                    onPressed: () {Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => pemasukan()));

                    },
                    child: Row(
                        children: [
                          Padding(padding: const EdgeInsets.only(left: 25.0),
                            child: Text(
                              'Pemasukan',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 150.0),
                            child: Image.asset('assets/arrow.png'),
                          )
                        ],
                      ),
                  ),
                  ),
                SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                  margin: new EdgeInsets.symmetric(horizontal: 10.0),
                  width: 1000,
                  decoration: new BoxDecoration(
                      color: Colors.yellow[100]
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.yellow[100]
                    ),
                    onPressed: () {Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => pengeluaran()));
                    },
                    child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text(
                              'Pengeluaran',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 140.0),
                            child: Transform.rotate(
                              angle: 3.14159, // 180 degrees in radians
                              child: Image.asset('assets/arrow.png'),
                            ),
                          ),
                        ],
                      ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

