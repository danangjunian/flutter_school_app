import 'package:flutter/material.dart';

import '../../widgets/common.dart';
import '../../../theme/app_theme.dart';

/// Schedule page showing daily timetable.
class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GreenAppBar(title: 'Jadwal'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _DayHeader(day: 'Senin, 15 Sep 2025'),
          _ScheduleTile(title: 'Mapel 1', time: '07:00 - 08:40', room: 'Ruang A1'),
          _ScheduleTile(title: 'Mapel 2', time: '08:40 - 10:20', room: 'Ruang A2'),
          _ScheduleTile(title: 'Mapel 3', time: '10:30 - 12:00', room: 'Ruang A3'),
          _ScheduleTile(title: 'Mapel 4', time: '13:00 - 14:30', room: 'Ruang A4'),
          _DayHeader(day: 'Selasa, 16 Sep 2025'),
          _ScheduleTile(title: 'Mapel 5', time: '07:00 - 08:40', room: 'Ruang B1'),
          _ScheduleTile(title: 'Mapel 6', time: '08:40 - 10:20', room: 'Ruang B2'),
          _ScheduleTile(title: 'Mapel 7', time: '10:30 - 12:00', room: 'Ruang B3'),
        ],
      ),
    );
  }
}

class _DayHeader extends StatelessWidget {
  const _DayHeader({required this.day});
  final String day;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        day,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}

class _ScheduleTile extends StatelessWidget {
  const _ScheduleTile(
      {required this.title, required this.time, required this.room});
  final String title;
  final String time;
  final String room;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.calendar_today_rounded, color: kPrimaryGreenDark),
        title: Text(title),
        subtitle: Text('$time • $room'),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}