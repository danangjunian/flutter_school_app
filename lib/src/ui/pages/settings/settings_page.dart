import 'package:flutter/material.dart';

import '../../widgets/common.dart';
import '../../../theme/app_theme.dart';

/// Settings page with toggles and options.
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GreenAppBar(title: 'Pengaturan'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            value: true,
            onChanged: (_) {},
            title: const Text('Tema Hijau Elegan'),
            subtitle: const Text('Material 3, sudut membulat, dan bayangan lembut'),
          ),
          SwitchListTile(
            value: true,
            onChanged: (_) {},
            title: const Text('Animasi Halus'),
            subtitle: const Text('Transisi dan efek subtle untuk pengalaman modern'),
          ),
          ListTile(
            leading:
                const Icon(Icons.privacy_tip_rounded, color: kPrimaryGreenDark),
            title: const Text('Privasi & Keamanan'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded, color: Colors.redAccent),
            title: const Text('Keluar'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}