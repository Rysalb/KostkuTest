import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectmppl/home.dart';

class tambahfasilitas extends StatefulWidget {
  @override
  State<tambahfasilitas> createState() => _tambahfasilitasState();
}

class _tambahfasilitasState extends State<tambahfasilitas> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _hargaController = TextEditingController();
  TextEditingController _unitController = TextEditingController();
  TextEditingController _kondisiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => home()),
            );// Kembali ke halaman sebelumnya
          },
        ),
        title: Text(
          'Tambah Fasilitas',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        toolbarHeight: 80,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _showAddFormDialog(context); // Tampilkan form tambah data
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // ...
          child: Column(
            // ...
            children: <Widget>[
              // ...
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('fasilitas')
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    // Process and display the data from the snapshot
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot document = snapshot.data!.docs[index];
                        String nama = document['nama'];
                        int harga = document['harga'];

                        // Widget untuk menampilkan data
                        return ListTile(
                          title: Text(nama),
                          subtitle: Text('Harga: $harga'),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    // Handle error state
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Show loading indicator
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),

              // ...
            ],
          ),
        ),
      ),
    );
  }

  void _showAddFormDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah Data Fasilitas'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                ),
              ),
              TextField(
                controller: _hargaController,
                decoration: InputDecoration(
                  labelText: 'Harga',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _unitController,
                decoration: InputDecoration(
                  labelText: 'Unit',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _kondisiController,
                decoration: InputDecoration(
                  labelText: 'Kondisi',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _addDataToFasilitas(); // Tambahkan data ke koleksi fasilitas
                Navigator.pop(context); // Tutup dialog
              },
              child: Text('Tambah'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _addDataToFasilitas() async {
    String nama = _namaController.text;
    int harga = int.tryParse(_hargaController.text) ?? 0;
    int unit = int.tryParse(_unitController.text) ?? 0;
    String kondisi = _kondisiController.text;
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('fasilitas')
        .get();

    int totalData = snapshot.size;
    // Lakukan logika tambah data ke koleksi fasilitas
    // Misalnya:
    FirebaseFirestore.instance.collection('fasilitas').add({
      'id' : totalData +1,
      'nama': nama,
      'harga': harga,
      'unit': unit,
      'kondisi': kondisi,
    });
  }
}