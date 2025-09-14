// lib/src/ui/pages/dashboard/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/common.dart';
import '../../../theme/app_theme.dart';
import '../../../providers/auth_providers.dart';
import '../../../services/supabase_service.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref
        .watch(roleProvider)
        .maybeWhen(data: (r) => r, orElse: () => null);
    final name =
        SupabaseService.client.auth.currentUser?.userMetadata?['full_name'] ??
        'Pengguna';

    // Daftar menu + peran yang boleh lihat
    final menus = <Map<String, dynamic>>[
      {
        'icon': Icons.qr_code_2_rounded,
        'label': 'Absensi',
        'route': '/attendance',
        'roles': AppRole.values,
      },
      {
        'icon': Icons.fact_check_rounded,
        'label': 'Ujian',
        'route': '/exams',
        'roles': [AppRole.admin, AppRole.guru, AppRole.siswa],
      },
      {
        'icon': Icons.task_rounded,
        'label': 'Tugas',
        'route': '/assignments',
        'roles': AppRole.values,
      },
      {
        'icon': Icons.bar_chart_rounded,
        'label': 'Nilai',
        'route': '/grades',
        'roles': AppRole.values,
      },
      {
        'icon': Icons.campaign_rounded,
        'label': 'Pengumuman',
        'route': '/announcements',
        'roles': AppRole.values,
      },
      {
        'icon': Icons.calendar_month_rounded,
        'label': 'Jadwal',
        'route': '/schedule',
        'roles': AppRole.values,
      },
      {
        'icon': Icons.chat_bubble_rounded,
        'label': 'Chat',
        'route': '/chat',
        'roles': AppRole.values,
      },
      {
        'icon': Icons.settings_rounded,
        'label': 'Pengaturan',
        'route': '/settings',
        'roles': AppRole.values,
      },
      // Khusus admin & guru
      {
        'icon': Icons.manage_accounts_rounded,
        'label': 'Kelola Sekolah',
        'route': '/admin',
        'roles': [AppRole.admin],
      },
      {
        'icon': Icons.library_books_rounded,
        'label': 'Bank Soal',
        'route': '/exams',
        'roles': [AppRole.admin, AppRole.guru],
      },
    ];

    final visibleMenus = role == null
        ? menus // saat role belum ter-load, tampilkan semua agar UI tidak kosong
        : menus.where((m) => (m['roles'] as List).contains(role)).toList();

    return Scaffold(
      appBar: const GreenAppBar(title: 'Beranda'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          _GreetingCard(name: name),
          const SizedBox(height: 8),
          const Row(
            children: [
              Expanded(
                child: StatCard(
                  title: 'Hadir Bulan Ini',
                  value: '—',
                  icon: Icons.verified_rounded,
                ),
              ),
              Expanded(
                child: StatCard(
                  title: 'Tugas Selesai',
                  value: '—',
                  icon: Icons.task_alt_rounded,
                ),
              ),
            ],
          ),
          const SectionHeader(title: 'Menu Utama'),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final m in visibleMenus)
                _MenuTile(
                  icon: m['icon'] as IconData,
                  label: m['label'] as String,
                  onTap: () => context.go(m['route'] as String),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GreetingCard extends StatelessWidget {
  const _GreetingCard({required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [kPrimaryGreen, kPrimaryGreenDark],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const Icon(Icons.eco_rounded, color: Colors.white, size: 36),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assalamualaikum, $name',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Semoga harimu penuh semangat!',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        width: (MediaQuery.of(context).size.width - 16 * 2 - 12 * 2) / 3,
        height: 96,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: kOutline),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: kPrimaryGreen),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
