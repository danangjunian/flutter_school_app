import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/auth_providers.dart';
import '../../../services/supabase_service.dart';

import '../../widgets/common.dart';
import '../../../theme/app_theme.dart';

/// Home page with greeting, stats and menu grid.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GreenAppBar(title: 'Beranda'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          const _GreetingCard(name: 'Danang'),
          const SizedBox(height: 8),
          Row(
            children: const [
              Expanded(
                child: StatCard(
                  title: 'Hadir Bulan Ini',
                  value: '92%',
                  icon: Icons.verified_rounded,
                ),
              ),
              Expanded(
                child: StatCard(
                  title: 'Tugas Selesai',
                  value: '18',
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
              _MenuTile(
                icon: Icons.qr_code_2_rounded,
                label: 'Absensi',
                onTap: () => context.go('/attendance'),
              ),
              _MenuTile(
                icon: Icons.fact_check_rounded,
                label: 'Ujian',
                onTap: () => context.go('/exams'),
              ),
              _MenuTile(
                icon: Icons.task_rounded,
                label: 'Tugas',
                onTap: () => context.go('/assignments'),
              ),
              _MenuTile(
                icon: Icons.bar_chart_rounded,
                label: 'Nilai',
                onTap: () => context.go('/grades'),
              ),
              _MenuTile(
                icon: Icons.campaign_rounded,
                label: 'Pengumuman',
                onTap: () => context.go('/announcements'),
              ),
              _MenuTile(
                icon: Icons.calendar_month_rounded,
                label: 'Jadwal',
                onTap: () => context.go('/schedule'),
              ),
              _MenuTile(
                icon: Icons.chat_bubble_rounded,
                label: 'Chat',
                onTap: () => context.go('/chat'),
              ),
              _MenuTile(
                icon: Icons.person_rounded,
                label: 'Profil',
                onTap: () => context.go('/profile'),
              ),
              _MenuTile(
                icon: Icons.settings_rounded,
                label: 'Pengaturan',
                onTap: () => context.go('/settings'),
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
