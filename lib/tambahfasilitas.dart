import 'package:flutter/material.dart';
import 'package:projectmppl/daftarakun.dart';
import 'package:projectmppl/passbaru.dart';

import 'Login.dart';
import 'home.dart';
import 'lupapass.dart';
import 'tambahkamar.dart';
import 'ubahprofile.dart';

class tambahfasilitas extends StatefulWidget {

  @override
  State<tambahfasilitas> createState() => _tambahfasilitasState();
}

class _tambahfasilitasState extends State<tambahfasilitas> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.arrow_downward,
                color: Colors.black,
                size: 50.0,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => home()));
            },
          ),
          title: Text(
              'Tambah Fasilitas' ,style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold, color: Colors.black
          )
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 10.0),
                  width: 1000,
                  decoration: new BoxDecoration(
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5,left: 15.0),
                            child: Text(
                              'Lantai 1',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                                padding: const EdgeInsets.only(top: 5,left: 200.0),
                                child: Icon(Icons.delete, color: Colors.black,
                                  size: 40.0,)
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Fasilitas',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Dapur, TV, Tempat Duduk, Kamar Mandi',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 10.0),
                  width: 1000,
                  decoration: new BoxDecoration(
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5,left: 15.0),
                            child: Text(
                              'Lantai 2',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5,left: 200.0),
                              child: Icon(Icons.delete, color: Colors.black,
                                size: 40.0,)
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Fasilitas',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Dapur, TV, Tempat Duduk, Kamar Mandi',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 10.0),
                  width: 1000,
                  decoration: new BoxDecoration(
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.black,
                        elevation: 0,
                        side: const BorderSide(
                          width: 1.0,
                          color: Colors.black45,
                        )),
                    onPressed: () {
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
                            'Tambah Kamar',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

