import 'package:flutter/material.dart';

/// Practical B6: Design a badge/notification icon using Stack and Positioned,
/// showing a count on top of an Icon.
class BadgeIconScreen extends StatefulWidget {
  const BadgeIconScreen({super.key});

  @override
  State<BadgeIconScreen> createState() => _BadgeIconScreenState();
}

class _BadgeIconScreenState extends State<BadgeIconScreen> {
  int _notificationCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B6: Badge Notification Icon'),
        backgroundColor: Colors.amber.shade800,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications, size: 32),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Notifications: $_notificationCount')),
                    );
                  },
                ),
                if (_notificationCount > 0)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child: Text(
                        '$_notificationCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Notification Count: $_notificationCount',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_notificationCount > 0) {
                      setState(() => _notificationCount--);
                    }
                  },
                  child: const Text('Clear One'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() => _notificationCount++);
                  },
                  child: const Text('Add Notification'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
