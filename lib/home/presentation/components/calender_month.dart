import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:someday/common/const/colors.dart';

class CalenderMonth extends StatefulWidget {
  @override
  _CalenderMonthState createState() => _CalenderMonthState();
}

class _CalenderMonthState extends State<CalenderMonth> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2023, 1, 1),
          lastDay: DateTime.utc(2999, 12, 31),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            }
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          calendarBuilders: CalendarBuilders(
            holidayBuilder: (context, day, focusedDay) {
              return Center(
                child: Text(
                  day.day.toString(),
                  style: TextStyle(color: Colors.red),
                ),
              );
            },
            selectedBuilder: (context, day, focusedDay) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                    color: BRIGHT_YELLOW),
                child: Text(
                  day.day.toString(),
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
            todayBuilder: (context, day, focusedDay) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12),
                  color: SECONDARY_COLOR,
                ),
                child: Text(
                  day.day.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
          headerStyle: HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
          ),
        ),
      ],
    );
  }
}
