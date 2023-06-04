import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:projectmppl/home.dart';

class daftarkamar extends StatefulWidget {
  @override
  State<daftarkamar> createState() => _daftarkamarState();
}

class _daftarkamarState extends State<daftarkamar> {
  TextEditingController namaController = TextEditingController();
  TextEditingController tipeController = TextEditingController();
  File? imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().getImage(source: source);
    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
      });
    }
  }

  Future<String?> _uploadImage(File image) async {
    try {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref('Kamar/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg');
      firebase_storage.UploadTask uploadTask = ref.putFile(image);
      firebase_storage.TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent[700],
          elevation: 0,
          toolbarHeight: 80,
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
                MaterialPageRoute(builder: (context) => home()),
              );
            },
          ),
          title: Text(
            'Daftar Kamar',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.black,
                size: 40.0,),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Tambah Kamar'),
                      content: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Pilih Gambar'),
                                      actions: [
                                        TextButton(
                                          child: Text('Kamera'),
                                          onPressed: () {
                                            _pickImage(ImageSource.camera);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Galeri'),
                                          onPressed: () {
                                            _pickImage(ImageSource.gallery);
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text('Pilih Gambar'),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 50,
                              height: 50,
                              child: imageFile != null ? Image.file(imageFile!) : Container(),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: namaController,
                              decoration: InputDecoration(
                                labelText: 'Nama Kamar',
                              ),
                            ),
                            TextField(
                              controller: tipeController,
                              decoration: InputDecoration(
                                labelText: 'Tipe Kamar',
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: Text('Batal'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Simpan'),
                          onPressed: () async {
                            if (imageFile != null) {
                              String? downloadURL = await _uploadImage(imageFile!);
                              QuerySnapshot snapshot = await FirebaseFirestore.instance
                                  .collection('kamar')
                                  .get();

                              int totalData = snapshot.size;
                              if (downloadURL != null) {
                                FirebaseFirestore.instance.collection('kamar').add({
                                  'id' : totalData +1,
                                  'img': downloadURL,
                                  'nama': namaController.text,
                                  'tipe': tipeController.text,
                                });
                              }
                            }
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('kamar').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var document = snapshot.data!.docs[index];
                          var id = document['id'];
                          var img = document['img'];
                          var nama = document['nama'];
                          var kelas = document['tipe'];

                          return ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  icon: Image.network(
                                    img,
                                    width: 100,
                                    height: 100,
                                  ),
                                  title: Text('Kamar Nomor $id'),
                                  content: Text('Tipe kamar $kelas'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.black,
                              elevation: 0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.yellow[200],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Image.network(
                                      img,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5, left: 15.0),
                                    child: Text(
                                      nama,
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
                          );
                        },
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}