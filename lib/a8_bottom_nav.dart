import 'package:flutter/material.dart';

/// Practical A8: Build a BottomNavigationBar with three tabs: Home, Search, and Profile.
class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text('Home Screen Content', style: TextStyle(fontSize: 24, color: Colors.blue))),
    Center(child: Text('Search Screen Content', style: TextStyle(fontSize: 24, color: Colors.amber))),
    Center(child: Text('Profile Screen Content', style: TextStyle(fontSize: 24, color: Colors.green))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A8: Bottom Navigation Bar'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
