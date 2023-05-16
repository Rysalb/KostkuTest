import 'package:flutter/material.dart';
import 'package:projectmppl/daftarakun.dart';
import 'package:projectmppl/passbaru.dart';

import 'Login.dart';
import 'home.dart';
import 'lupapass.dart';
import 'ubahprofile.dart';

class daftarkamar extends StatefulWidget {

  @override
  State<daftarkamar> createState() => _daftarkamarState();
}

class _daftarkamarState extends State<daftarkamar> {

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
            'Daftar Kamar' ,style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold, color: Colors.black
          )
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                ),
                SizedBox(height: 20),
                Container(
                  width: 1000,
                  height: 5,
                  color: Colors.purple[200],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Text(
                    '08212723671284',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: 1000,
                  height: 5,
                  color: Colors.purple[200],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

