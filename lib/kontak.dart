import 'package:flutter/material.dart';

import 'home.dart';

class kontak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kontak'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => home()),
            );
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Text('A'),
            ),
            title: Text('Ahmad'),
            subtitle: Text('08123456789'),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text('B'),
            ),
            title: Text('Budi'),
            subtitle: Text('08234567890'),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text('C'),
            ),
            title: Text('Citra'),
            subtitle: Text('08345678901'),
          ),
          // Tambahkan daftar kontak lainnya di sini
        ],
      ),
    );
  }
}
