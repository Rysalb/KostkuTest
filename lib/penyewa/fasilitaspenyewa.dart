import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homepenyewa.dart';

class fasilitaspenyewa extends StatefulWidget {
  @override
  State<fasilitaspenyewa> createState() => _fasilitaspenyewaState();
}

class _fasilitaspenyewaState extends State<fasilitaspenyewa> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _hargaController = TextEditingController();
  TextEditingController _unitController = TextEditingController();
  TextEditingController _kondisiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => homepenyewa()),
            ); // Kembali ke halaman sebelumnya
          },
        ),
        title: Text(
          'Fasilitas',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        toolbarHeight: 80,
        elevation: 0,
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
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
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

  Future<void> _addDataToFasilitas() async {
    String nama = _namaController.text;
    int harga = int.tryParse(_hargaController.text) ?? 0;
    int unit = int.tryParse(_unitController.text) ?? 0;
    String kondisi = _kondisiController.text;
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('fasilitas').get();

    int totalData = snapshot.size;
    // Lakukan logika tambah data ke koleksi fasilitas
    // Misalnya:
    FirebaseFirestore.instance.collection('fasilitas').add({
      'id': totalData + 1,
      'nama': nama,
      'harga': harga,
      'unit': unit,
      'kondisi': kondisi,
    });
  }
}
