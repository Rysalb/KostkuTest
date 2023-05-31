import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  _ChartScreenState createState() => _ChartScreenState();
}


class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grafik Pemasukan dan Pengeluaran'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('keuangan').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!.docs;
            final pemasukan = data.where((doc) => doc['status'] == true);
            final pengeluaran = data.where((doc) => doc['status'] == false);

            final chartData = [
              ChartData('Pemasukan', pemasukan.length),
              ChartData('Pengeluaran', pengeluaran.length),
            ];

            // Menghitung total pemasukan dan pengeluaran
            int totalPemasukan = 0;
            int totalPengeluaran = 0;
            for (var doc in pemasukan) {
              totalPemasukan += int.parse(doc['biaya'].toString());
            }
            for (var doc in pengeluaran) {
              totalPengeluaran += int.parse(doc['biaya'].toString());
            }

            final totalSaldo = totalPemasukan - totalPengeluaran;

            return Column(
              children: [
                SizedBox(
                  height: 400,
                  child: SfCircularChart(
                    series: <CircularSeries>[
                      PieSeries<ChartData, String>(
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.label,
                        yValueMapper: (ChartData data, _) => data.value,
                        dataLabelMapper: (ChartData data, _) => '${data.value}',
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                        ),
                      )
                    ],
                  ),
                ),
                Text('Total Pemasukan: $totalPemasukan'),
                Text('Total Pengeluaran: $totalPengeluaran'),
                Text('Total Saldo: $totalSaldo'),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}


class ChartData {
  final String label;
  final int value;

  ChartData(this.label, this.value);
}