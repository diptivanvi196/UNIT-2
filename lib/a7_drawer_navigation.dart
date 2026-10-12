import 'package:flutter/material.dart';

/// Practical A7: Design a Drawer with at least four navigation menu items using ListTile.
class DrawerNavScreen extends StatefulWidget {
  const DrawerNavScreen({super.key});

  @override
  State<DrawerNavScreen> createState() => _DrawerNavScreenState();
}

class _DrawerNavScreenState extends State<DrawerNavScreen> {
  String _selectedPage = 'Home Page';

  void _onSelectItem(String title) {
    setState(() {
      _selectedPage = title;
    });
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A7: Drawer Navigation'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Dipti Patel'),
              accountEmail: Text('dipti@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('DP', style: TextStyle(fontSize: 24, color: Colors.brown)),
              ),
              decoration: BoxDecoration(color: Colors.brown),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => _onSelectItem('Home Page'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () => _onSelectItem('Profile Page'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => _onSelectItem('Settings Page'),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () => _onSelectItem('About Page'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Current Screen:\n$_selectedPage',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown),
        ),
      ),
    );
  }
}
