import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../../widgets/common.dart';

class AttendanceScanPage extends StatelessWidget {
  const AttendanceScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GreenAppBar(title: 'Scan Absensi'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.qr_code_scanner_rounded, size: 96, color: kPrimaryGreen),
            SizedBox(height: 12),
            Text('Fitur scan akan ditambahkan'),
          ],
        ),
      ),
    );
  }
}
