import 'package:flutter/material.dart';

/// Practical C2: Create a reusable custom widget library containing at least
/// three custom widgets (e.g. CustomButton, CustomCard, CustomAppBar) and
/// combine them into one complete demo screen.

// 1. CustomAppBar Widget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;

  const CustomAppBar({super.key, required this.title, this.onBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 4,
      leading: onBack != null
          ? IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack)
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// 2. CustomCard Widget
class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accentColor;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.accentColor = Colors.indigo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: accentColor.withOpacity(0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 32, color: accentColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.black54),
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

// 3. CustomButton Widget
class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.color = Colors.indigo,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

// Combined Complete Demo Screen
class CustomWidgetLibraryScreen extends StatelessWidget {
  const CustomWidgetLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'C2: Custom Widget Library'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomCard(
              title: 'Reusable Component 1',
              subtitle: 'CustomCard widget with icon, title, and subtitle.',
              icon: Icons.star,
              accentColor: Colors.amber,
            ),
            const SizedBox(height: 12),
            const CustomCard(
              title: 'Reusable Component 2',
              subtitle: 'Encapsulated styling and consistent design system.',
              icon: Icons.palette,
              accentColor: Colors.purple,
            ),
            const SizedBox(height: 24),
            CustomButton(
              label: 'Trigger Primary Action',
              icon: Icons.check_circle,
              color: Colors.indigo,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('CustomButton Pressed!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
