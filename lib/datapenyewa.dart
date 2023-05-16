import 'package:flutter/material.dart';
import 'package:projectmppl/daftarakun.dart';
import 'package:projectmppl/passbaru.dart';

import 'Login.dart';
import 'home.dart';
import 'lupapass.dart';
import 'ubahprofile.dart';

class datapenyewa extends StatefulWidget {

  @override
  State<datapenyewa> createState() => _datapenyewaState();
}

class _datapenyewaState extends State<datapenyewa> {

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
          leading: IconButton(
            icon: Icon(
                Icons.keyboard_arrow_left,
                size: 70.0,
              ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => home()));
            },
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('KostKu',style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              ),
              Padding(
                padding: const EdgeInsets.only(left : 2.0),
                child: Text('Data Penyewa',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
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
                  margin: new EdgeInsets.symmetric(horizontal: 10.0),
                  width: 1000,
                  decoration: new BoxDecoration(
                      color: Colors.yellow[100]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Kamar 1',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Nama                          : ',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Yuyun', style: TextStyle(
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
                          Padding(padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Waktu Kos Berakhir : ',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '2 Hari', style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          )

                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 10.0),
                  width: 1000,
                  decoration: new BoxDecoration(
                      color: Colors.yellow[100]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Kamar 2',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Nama                          : ',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Kazuma', style: TextStyle(
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
                          Padding(padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Waktu Kos Berakhir : ',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '99 Hari', style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 10.0),
                  width: 1000,
                  decoration: new BoxDecoration(
                      color: Colors.yellow[100]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Kamar 3',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Nama                          : ',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Megumin', style: TextStyle(
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
                          Padding(padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Waktu Kos Berakhir : ',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '12 Hari', style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          )

                        ],
                      )
                    ],
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

