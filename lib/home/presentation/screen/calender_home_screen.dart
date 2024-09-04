import 'package:flutter/material.dart';
import 'package:someday/common/components/default_layout.dart';
import 'package:someday/home/presentation/components/calender_month.dart';
import 'package:someday/home/presentation/components/calender_week.dart';

class CalenderHomeScreen extends StatefulWidget {
  const CalenderHomeScreen({super.key});

  @override
  State<CalenderHomeScreen> createState() => _CalenderHomeScreenState();
}

class _CalenderHomeScreenState extends State<CalenderHomeScreen> {
  bool _showMonthCalendar = true;
  bool _iconToggled = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Calendar Home',
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notification_add_outlined),
        ),
        IconButton(
          icon: _iconToggled
              ? const Icon(Icons.toggle_on_outlined)
              : const Icon(Icons.toggle_off_outlined),
          onPressed: () {
            setState(() {
              _iconToggled = !_iconToggled;
              _showMonthCalendar = !_showMonthCalendar; // Body value toggle
            });
          },
        ),
      ],
      child: _showMonthCalendar ? CalenderMonth() : CalenderWeek(),
    );
  }
}
