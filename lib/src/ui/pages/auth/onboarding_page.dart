import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../theme/app_theme.dart';

/// Onboarding slideshow introducing app features.
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSoftMint,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                children: const [
                  _OnboardSlide(
                    title: 'Sekolah lebih rapi',
                    desc:
                        'Absensi, tugas, nilai, pengumuman—semua dalam satu aplikasi.',
                    icon: Icons.eco_rounded,
                  ),
                  _OnboardSlide(
                    title: 'Belajar makin nyaman',
                    desc:
                        'Materi dan ujian online dengan UI elegan hijau-putih.',
                    icon: Icons.auto_awesome_rounded,
                  ),
                  _OnboardSlide(
                    title: 'Orang tua ikut memantau',
                    desc:
                        'Wali bisa cek kehadiran dan nilai secara real-time.',
                    icon: Icons.family_restroom_rounded,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () => context.go('/signin'),
                    child: const Text('Mulai Sekarang'),
                  ),
                  TextButton(
                    onPressed: () => context.go('/home'),
                    child: const Text('Lewati'),
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

class _OnboardSlide extends StatelessWidget {
  const _OnboardSlide(
      {required this.title, required this.desc, required this.icon});
  final String title;
  final String desc;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 220,
            width: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: kPrimaryGreen.withOpacity(0.1),
                  blurRadius: 24,
                ),
              ],
            ),
            child: Icon(icon, color: kPrimaryGreen, size: 96),
          ),
          const SizedBox(height: 32),
          Text(title,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Text(desc,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}