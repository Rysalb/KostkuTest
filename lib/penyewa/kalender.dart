import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:projectmppl/penyewa/homepenyewa.dart';
import 'package:table_calendar/table_calendar.dart';

class Kalender extends StatefulWidget {
  @override
  _KalenderState createState() => _KalenderState();
}

class _KalenderState extends State<Kalender> {
  final DateTime _selectedDate = DateTime.now();
  List<Map<String, dynamic>> _kamarList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('kamar').get();

    List<Map<String, dynamic>> kamarList = [];
    snapshot.docs.forEach((doc) {
      kamarList.add(doc.data() as Map<String, dynamic>);
    });

    setState(() {
      _kamarList = kamarList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              MaterialPageRoute(builder: (context) => homepenyewa()),
            );
          },
        ),
        title: Text(
          'Kalender',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            TableCalendar(
              focusedDay: _selectedDate,
              firstDay: DateTime.utc(2000),
              lastDay: DateTime.utc(2100),
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _kamarList.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> kamar = _kamarList[index];
                  return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('penyewa')
                        .where('id_kamar', isEqualTo: kamar['id'])
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }

                      QuerySnapshot penyewaDocs = snapshot.data!;
                      DocumentSnapshot? penyewaDoc;

                      if (penyewaDocs.size > 0) {
                        // If there are tenants for this room, get the first tenant data
                        penyewaDoc = penyewaDocs.docs[0];
                      }

                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                          width: 1000,
                          decoration: BoxDecoration(
                            color: Colors.yellow[100],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Kamar No ${kamar['id']}',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    if (penyewaDoc != null) ...[
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5.0),
                                            child: Text(
                                              'Nama : ',
                                              style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              '${penyewaDoc['nama']}',
                                              style: TextStyle(
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
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5.0),
                                            child: Text(
                                              'Nomor HP: ',
                                              style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              '0${penyewaDoc['nomor_hp']}',
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
