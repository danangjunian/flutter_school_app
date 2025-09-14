import 'package:flutter/material.dart';

import '../../widgets/common.dart';
import '../../../theme/app_theme.dart';

/// Profile page showing user information.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GreenAppBar(title: 'Profil'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: CircleAvatar(
              radius: 44,
              backgroundColor: kPrimaryGreen.withOpacity(0.15),
              child:
                  const Icon(Icons.person_rounded, size: 44, color: kPrimaryGreen),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text('Danang Junian Widodo',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          const SizedBox(height: 4),
          Center(
            child: Chip(
              label: const Text('Siswa'),
              avatar: const Icon(Icons.school_rounded),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.badge_rounded),
                  title: Text('NIS'),
                  subtitle: Text('2025-00123'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.class_rounded),
                  title: Text('Kelas'),
                  subtitle: Text('IX-A'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.email_rounded),
                  title: Text('Email'),
                  subtitle: Text('danang@example.sch.id'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit_rounded),
            label: const Text('Edit Profil'),
          ),
        ],
      ),
    );
  }
}