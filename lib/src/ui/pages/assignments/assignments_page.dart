import 'package:flutter/material.dart';

import '../../widgets/common.dart';
import '../../../theme/app_theme.dart';

/// Assignments page showing upcoming deadlines and history.
class AssignmentsPage extends StatelessWidget {
  const AssignmentsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GreenAppBar(title: 'Tugas'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionHeader(title: 'Tenggat Mendatang'),
          ...List.generate(
            4,
            (i) => _AssignmentCard(
              title: 'Bahasa Indonesia - Ringkasan Bab ${i + 2}',
              due: 'Jatuh tempo: 14 Sep 2025',
            ),
          ),
          const SectionHeader(title: 'Riwayat'),
          ...List.generate(
            3,
            (i) => _AssignmentTile(
              title: 'IPS - Esai',
              status: i % 2 == 0 ? 'Dinilai' : 'Terkirim',
            ),
          ),
        ],
      ),
    );
  }
}

class _AssignmentCard extends StatelessWidget {
  const _AssignmentCard({required this.title, required this.due});
  final String title;
  final String due;
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
            Row(
              children: [
                const Icon(Icons.schedule_rounded,
                    size: 18, color: kPrimaryGreenDark),
                const SizedBox(width: 6),
                Text(due),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Kumpulkan'),
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

class _AssignmentTile extends StatelessWidget {
  const _AssignmentTile({required this.title, required this.status});
  final String title;
  final String status;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: kPrimaryGreen.withOpacity(0.12),
        child:
            const Icon(Icons.task_alt_rounded, color: kPrimaryGreen),
      ),
      title: Text(title),
      subtitle: Text(status),
      trailing: const Icon(Icons.chevron_right_rounded),
    );
  }
}