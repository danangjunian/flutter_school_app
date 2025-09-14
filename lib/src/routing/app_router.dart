// lib/src/routing/app_router.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/supabase_service.dart';
// Attendance page import temporarily replaced by a local stub to fix analyzer errors.
import '../ui/pages/attendance/scan_page.dart';

import '../ui/shell/app_shell.dart';
import '../ui/pages/auth/onboarding_page.dart';
import '../ui/pages/auth/signin_page.dart';
import '../ui/pages/dashboard/home_page.dart';

import '../ui/pages/exams/exams_page.dart';
import '../ui/pages/assignments/assignments_page.dart';
import '../ui/pages/grades/grades_page.dart';
import '../ui/pages/announcements/announcements_page.dart';
import '../ui/pages/calendar/schedule_page.dart';
import '../ui/pages/chat/chat_page.dart';
import '../ui/pages/profile/profile_page.dart';
import '../ui/pages/settings/settings_page.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _sub = stream.asBroadcastStream().listen((_) => notifyListeners());
  }
  late final StreamSubscription _sub;
  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}

GoRouter buildRouter() {
  final authStream =
      (SupabaseService.maybeClient?.auth.onAuthStateChange) ??
      const Stream.empty();

  return GoRouter(
    initialLocation: '/onboarding',
    // refreshListenable bikin GoRouter auto-cek redirect saat sesi berubah
    refreshListenable: GoRouterRefreshStream(authStream),

    // Logika penjagaan route
    redirect: (context, state) {
      final session = SupabaseService.maybeClient?.auth.currentSession;
      final loggedIn = session != null;

      // halaman yang boleh diakses tanpa login
      const publicPaths = ['/onboarding', '/signin'];
      final isOnPublic = publicPaths.contains(state.matchedLocation);

      // belum login & bukan halaman public -> paksa ke /signin
      if (!loggedIn && !isOnPublic) {
        return '/signin';
      }

      // sudah login & masih di halaman public -> lempar ke /home
      if (loggedIn && isOnPublic) {
        return '/home';
      }

      // selain itu, tetap tinggal
      return null;
    },

    routes: [
      GoRoute(path: '/onboarding', builder: (_, __) => const OnboardingPage()),
      GoRoute(path: '/signin', builder: (_, __) => const SignInPage()),

      // Shell bottom nav (beranda/absensi/ujian/tugas/nilai)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navShell) => AppShell(navShell: navShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/home', builder: (_, __) => const HomePage()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/attendance',
                builder: (_, __) => const AttendancePageStub(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/exams', builder: (_, __) => const ExamsPage()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/assignments',
                builder: (_, __) => const AssignmentsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/grades', builder: (_, __) => const GradesPage()),
            ],
          ),
        ],
      ),

      // Halaman di luar bottom nav
      GoRoute(
        path: '/announcements',
        builder: (_, __) => const AnnouncementsPage(),
      ),
      GoRoute(path: '/schedule', builder: (_, __) => const SchedulePage()),
      GoRoute(path: '/chat', builder: (_, __) => const ChatPage()),
      GoRoute(path: '/profile', builder: (_, __) => const ProfilePage()),
      GoRoute(path: '/settings', builder: (_, __) => const SettingsPage()),

      // Route untuk halaman scan QR
      GoRoute(
        path: '/attendance/scan',
        builder: (_, __) => const AttendanceScanPage(),
      ),
    ],
  );
}

/// Fallback stub for Attendance when actual page import causes issues.
class AttendancePageStub extends StatelessWidget {
  const AttendancePageStub({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: Text('Attendance page')), 
      );
}
