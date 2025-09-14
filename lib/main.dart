import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/theme/app_theme.dart';
import 'src/routing/app_router.dart';
import 'src/services/supabase_service.dart';

/// Entry point of the super app.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseService.initialize(); // <-- pastikan ini ada
  runApp(const ProviderScope(child: SchoolSuperApp()));
}

/// Root widget for the school application.
class SchoolSuperApp extends StatelessWidget {
  const SchoolSuperApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = buildAppTheme();
    final router = buildRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Sekolah+ Super App',
      theme: theme,
      routerConfig: router,
    );
  }
}
