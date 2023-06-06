import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Kalender extends StatefulWidget {
  @override
  _KalenderState createState() => _KalenderState();
}

class _KalenderState extends State<Kalender> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kalender',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orangeAccent[700],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarController: _calendarController,
            // Konfigurasi opsional lainnya dapat ditambahkan di sini
          ),
          // Tambahkan widget lain yang diperlukan di sini
        ],
      ),
    );
  }
}
