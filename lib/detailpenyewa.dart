import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailPenyewa extends StatelessWidget {
  final int penyewaDoc;

  const DetailPenyewa({
    required this.penyewaDoc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        title: Text('Detail Penyewa'),
      ),
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance
            .collection('penyewa')
            .where('id', isEqualTo: penyewaDoc)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          try {
            if (snapshot.hasError) {
              throw snapshot.error!;
            }

            if (snapshot.data!.docs.isEmpty) {
              return Center(child: Text('Document does not exist'));
            }

            var penyewaData = snapshot.data!.docs[0].data();

            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.deepOrange,
                    Colors.orangeAccent,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Image.network(
                                penyewaData?['img'] ?? '', // Use null-aware operator and provide a default value
                                width: 300,
                                height: 200,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Nama: ${penyewaData?['nama'] ?? ''}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Nomor HP: ${penyewaData?['nomor_hp'] ?? ''}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Tanggal Bayar: ${DateFormat('dd MMM yyyy').format((penyewaData?['tanggal_bayar'] as Timestamp?)?.toDate() ?? DateTime.now())}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Tanggal Masuk: ${DateFormat('dd MMM yyyy').format((penyewaData?['tanggal_masuk'] as Timestamp?)?.toDate() ?? DateTime.now())}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } catch (error) {
            return Center(child: Text('Error: $error'));
          }
        },
      ),
    );
  }
}
