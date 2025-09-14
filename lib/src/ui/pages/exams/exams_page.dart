import 'package:flutter/material.dart';

import '../../widgets/common.dart';
import '../../../theme/app_theme.dart';

/// Exams page listing active and past exams.
class ExamsPage extends StatelessWidget {
  const ExamsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GreenAppBar(title: 'Ujian'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionHeader(title: 'Ujian Aktif'),
          ...List.generate(
            3,
            (i) => _ExamCard(
              title: 'Ujian Matematika Bab ${i + 1}',
              time: 'Durasi 45 menit',
              onStart: () {},
            ),
          ),
          const SectionHeader(title: 'Riwayat'),
          ...List.generate(
            5,
            (i) => _ExamHistoryTile(
              title: 'IPA - Kelas 9',
              score: 78 + i,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExamCard extends StatelessWidget {
  const _ExamCard({required this.title, required this.time, required this.onStart});
  final String title;
  final String time;
  final VoidCallback onStart;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 6),
            Text(time),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: onStart,
                  child: const Text('Mulai'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Detail'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ExamHistoryTile extends StatelessWidget {
  const _ExamHistoryTile({required this.title, required this.score});
  final String title;
  final int score;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: kPrimaryGreen.withOpacity(0.12),
        child: const Icon(
          Icons.assignment_turned_in_rounded,
          color: kPrimaryGreen,
        ),
      ),
      title: Text(title),
      subtitle: Text('Nilai: $score'),
      trailing: const Icon(Icons.chevron_right_rounded),
    );
  }
}