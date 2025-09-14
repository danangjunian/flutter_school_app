import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/common.dart';
import '../../../theme/app_theme.dart';

/// Absence scanning page with QR code placeholder and history list.
class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GreenAppBar(title: 'Absensi'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Scan QR untuk Absen',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  const Text('Waktu absensi dibuka pukul 06.30–07.15 WIB'),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 160,
                    child: Center(
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                          color: kSoftMint,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: kOutline),
                        ),
                        child: const Icon(
                          Icons.qr_code_scanner_rounded,
                          size: 80,
                          color: kPrimaryGreen,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () => context.go('/attendance/scan'),
                    icon: const Icon(Icons.qr_code_scanner_rounded),
                    label: const Text('Mulai Scan'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          const SectionHeader(title: 'Riwayat Kehadiran'),
          ...List.generate(
            6,
            (i) => _AttendanceTile(
              date: '2025-09-${i + 1}',
      status: i % 4 == 0 ? 'Terlambat' : 'Hadir',
           }
          ),
        ],
      ),
    );
  }
}

class _AttendanceTile extends StatelessWidget {
  const _AttendanceTile({required this.date, required this.status});
  final String date;
  final String status;
  @override
  Widget build(BuildContext context) {
    final isLate = status.toLowerCase() == 'terlambat';
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      leading: CircleAvatar(
        backgroundColor:
            (isLate ? Colors.orange : kPrimaryGreen).withOpacity(0.15),
        child: Icon(
          isLate ? Icons.timer_rounded : Icons.check_circle_rounded,
          color: isLate ? Colors.orange : kPrimaryGreen,
        ),
      ),
      title: Text(date),
      subtitle: Text(isLate ? 'Terlambat' : 'Hadir'),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () {},
    );
  }
}
