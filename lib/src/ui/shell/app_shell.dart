import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_theme.dart';

/// Root shell widget with a bottom navigation bar.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navShell});
  final StatefulNavigationShell navShell;

  void _goBranch(int index, BuildContext context) {
    navShell.goBranch(index, initialLocation: index == navShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navShell,
      bottomNavigationBar: _GreenNavBar(
        currentIndex: navShell.currentIndex,
        onTap: (i) => _goBranch(i, context),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/announcements'),
        backgroundColor: kPrimaryGreen,
        foregroundColor: Colors.white,
        label: const Text('Pengumuman'),
        icon: const Icon(Icons.campaign_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

/// Custom bottom navigation bar with notch for FAB.
class _GreenNavBar extends StatelessWidget {
  const _GreenNavBar({required this.currentIndex, required this.onTap});
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final items = const [
      BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Beranda'),
      BottomNavigationBarItem(icon: Icon(Icons.qr_code_rounded), label: 'Absensi'),
      BottomNavigationBarItem(icon: Icon(Icons.fact_check_rounded), label: 'Ujian'),
      BottomNavigationBarItem(icon: Icon(Icons.task_rounded), label: 'Tugas'),
      BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: 'Nilai'),
    ];
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: BottomAppBar(
        height: 74,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          items: items,
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kPrimaryGreen,
          unselectedItemColor: Colors.black54,
          backgroundColor: Colors.white,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}