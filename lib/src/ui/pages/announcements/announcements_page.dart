import 'package:flutter/material.dart';

import '../../widgets/common.dart';

/// Announcements page listing school announcements.
class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GreenAppBar(title: 'Pengumuman'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: List.generate(
          8,
          (i) => ListTile(
            leading: const Icon(Icons.campaign_rounded),
            title: Text('Pengumuman ${i + 1}'),
            subtitle: const Text('Isi pengumuman singkat...'),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
        ),
      ),
    );
  }
}