import 'package:supabase_flutter/supabase_flutter.dart';

/// Encapsulates Supabase initialization and exposes the client.
class SupabaseService {
  static const _supabaseUrl = 'https://iiohvhlvgjomwfzdnwra.supabase.co';
  static const _supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlpb2h2aGx2Z2pvbXdmemRud3JhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc2ODcxNjEsImV4cCI6MjA3MzI2MzE2MX0.Op_zzHL1Q-5Vyazu7zxjPyhe3frXDGj6hJQHLZxNbGU';
  static bool _initialized = false;

  /// Initializes the Supabase client. Call this before using the client.
  static Future<void> initialize() async {
    await Supabase.initialize(url: _supabaseUrl, anonKey: _supabaseKey);
    _initialized = true;
  }

  /// Provides access to the Supabase client.
  static SupabaseClient get client => Supabase.instance.client;

  /// Returns the client if initialized, otherwise null. Useful for tests.
  static SupabaseClient? get maybeClient =>
      _initialized ? Supabase.instance.client : null;

  static bool get isInitialized => _initialized;
}
