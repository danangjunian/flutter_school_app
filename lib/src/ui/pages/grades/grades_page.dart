import 'package:flutter/material.dart';

import '../../widgets/common.dart';
import '../../../theme/app_theme.dart';

/// Grades page showing average and subject breakdown.
class GradesPage extends StatelessWidget {
  const GradesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GreenAppBar(title: 'Nilai'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: const [
              Expanded(
                child: StatCard(
                  title: 'Rata-Rata',
                  value: '84',
                  icon: Icons.analytics_rounded,
                ),
              ),
              Expanded(
                child: StatCard(
                  title: 'Ranking Kelas',
                  value: 'Top 10%',
                  icon: Icons.emoji_events_rounded,
                ),
              ),
            ],
          ),
          const SectionHeader(title: 'Per Mata Pelajaran'),
          ...List.generate(
            6,
            (i) => _GradeTile(
              subject: 'Mapel ${i + 1}',
              score: 75 + i,
              trendUp: i % 2 == 0,
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.picture_as_pdf_rounded),
            label: const Text('Unduh Rapor PDF'),
          ),
        ],
      ),
    );
  }
}

class _GradeTile extends StatelessWidget {
  const _GradeTile(
      {required this.subject, required this.score, this.trendUp = true});
  final String subject;
  final int score;
  final bool trendUp;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: kPrimaryGreen.withOpacity(0.12),
        child: Icon(
          trendUp ? Icons.trending_up_rounded : Icons.trending_down_rounded,
          color: kPrimaryGreen,
        ),
      ),
      title: Text(subject),
      subtitle: Text('Nilai: $score'),
      trailing: const Icon(Icons.chevron_right_rounded),
    );
  }
}