import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/supabase_service.dart';

/// Supabase client via Riverpod
final supabaseProvider = Provider<SupabaseClient>(
  (_) => SupabaseService.client,
);

/// Stream session (dipakai router agar auto-redirect ketika login/logout)
final authSessionStreamProvider = StreamProvider<Session?>((ref) {
  final client = ref.watch(supabaseProvider);
  // onAuthStateChange mengirim (AuthChangeEvent, Session?)
  return client.auth.onAuthStateChange.map((e) => e.session);
});

/// Snapshot session saat ini (nullable)
final sessionProvider = Provider<Session?>((ref) {
  final current = SupabaseService.client.auth.currentSession;
  final async = ref.watch(authSessionStreamProvider);
  return async.maybeWhen(data: (s) => s ?? current, orElse: () => current);
});

/// Enum peran aplikasi
enum AppRole { admin, guru, siswa, wali }

/// Ambil role user dari tabel memberships (role: 'admin' | 'guru' | 'siswa' | 'wali')
final roleProvider = FutureProvider<AppRole?>((ref) async {
  final client = ref.watch(supabaseProvider);
  final user = client.auth.currentUser;
  if (user == null) return null;

  final row = await client
      .from('memberships')
      .select('role')
      .eq('user_id', user.id)
      .limit(1)
      .maybeSingle();

  final roleStr = (row?['role'] as String?)?.toLowerCase();
  switch (roleStr) {
    case 'admin':
      return AppRole.admin;
    case 'guru':
      return AppRole.guru;
    case 'wali':
      return AppRole.wali;
    case 'siswa':
      return AppRole.siswa;
    default:
      return null;
  }
});
