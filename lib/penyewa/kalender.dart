import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:projectmppl/penyewa/homepenyewa.dart';
import 'package:table_calendar/table_calendar.dart';

class Kalender extends StatelessWidget {
  final DateTime _selectedDate = DateTime.now();

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
        child: TableCalendar(
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
      ),
    );
  }
}
