import 'package:flutter/material.dart';

import '../../widgets/common.dart';
import '../../../theme/app_theme.dart';

/// Chat page for class discussions.
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GreenAppBar(title: 'Chat Kelas'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: List.generate(
                12,
                (i) => Align(
                  alignment: i % 2 == 0
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: i % 2 == 0
                          ? kPrimaryGreen.withOpacity(0.12)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: kOutline),
                    ),
                    child: Text(i % 2 == 0
                        ? 'Siap, Pak Guru.'
                        : 'Jangan lupa ujian besok 07.00'),
                  ),
                ),
              ),
            ),
          ),
          const _ChatComposer(),
        ],
      ),
    );
  }
}

class _ChatComposer extends StatelessWidget {
  const _ChatComposer();
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Tulis pesan...'
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(56, 50),
                padding: EdgeInsets.zero,
              ),
              child: const Icon(Icons.send_rounded),
            ),
          ],
        ),
      ),
    );
  }
}