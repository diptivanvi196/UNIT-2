import 'package:flutter/material.dart';

/// Practical C9: Design a settings screen with grouped sections using nested
/// Column and Table widgets, where the layout gracefully reflows into two
/// columns when width exceeds 700 dp.
class ResponsiveSettingsScreen extends StatelessWidget {
  const ResponsiveSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 700;

    final section1 = _buildGroupedSection('Account Settings', [
      ['Username', 'diptipatel'],
      ['Email', 'dipti@example.com'],
      ['Two-Factor Auth', 'Enabled'],
    ]);

    final section2 = _buildGroupedSection('Privacy & Security', [
      ['Profile Visibility', 'Public'],
      ['Data Sharing', 'Disabled'],
      ['Passcode Lock', 'Active'],
    ]);

    final section3 = _buildGroupedSection('App Preferences', [
      ['Language', 'English (US)'],
      ['Theme', 'System Dark'],
      ['Font Size', 'Medium (16sp)'],
    ]);

    final section4 = _buildGroupedSection('System Info', [
      ['OS Version', 'Android 14 (API 34)'],
      ['App Build', 'v2.6.0 (800)'],
      ['Storage Usage', '128 MB'],
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Text('C9: Settings (${screenWidth.toInt()} dp)'),
        backgroundColor: Colors.blueGrey.shade900,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: isWide
            ? Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: section1),
                      const SizedBox(width: 16),
                      Expanded(child: section2),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: section3),
                      const SizedBox(width: 16),
                      Expanded(child: section4),
                    ],
                  ),
                ],
              )
            : Column(
                children: [
                  section1,
                  const SizedBox(height: 16),
                  section2,
                  const SizedBox(height: 16),
                  section3,
                  const SizedBox(height: 16),
                  section4,
                ],
              ),
      ),
    );
  }

  Widget _buildGroupedSection(String title, List<List<String>> pairs) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const Divider(height: 20),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
              },
              children: pairs.map((pair) {
                return TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        pair[0],
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(pair[1], style: const TextStyle(color: Colors.black87)),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
