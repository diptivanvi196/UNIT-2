import 'package:flutter/material.dart';

/// Practical C5: Create a fully responsive navigation shell: a Drawer for mobile
/// width and a permanent side NavigationRail-style Column for desktop width,
/// switching automatically using LayoutBuilder.
class ResponsiveNavShellScreen extends StatefulWidget {
  const ResponsiveNavShellScreen({super.key});

  @override
  State<ResponsiveNavShellScreen> createState() => _ResponsiveNavShellScreenState();
}

class _ResponsiveNavShellScreenState extends State<ResponsiveNavShellScreen> {
  int _selectedIndex = 0;

  final List<String> _navTitles = const ['Home', 'Search', 'Notifications', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 700;

        final navItems = const [
          NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
          NavigationRailDestination(icon: Icon(Icons.search), label: Text('Search')),
          NavigationRailDestination(icon: Icon(Icons.notifications), label: Text('Notifications')),
          NavigationRailDestination(icon: Icon(Icons.settings), label: Text('Settings')),
        ];

        Widget mainContent = Center(
          child: Text(
            'Active Page: ${_navTitles[_selectedIndex]}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey),
          ),
        );

        if (isDesktop) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('C5: Navigation Shell (Desktop NavigationRail)'),
              backgroundColor: Colors.blueGrey,
              foregroundColor: Colors.white,
            ),
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() => _selectedIndex = index);
                  },
                  labelType: NavigationRailLabelType.all,
                  destinations: navItems,
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(child: mainContent),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('C5: Navigation Shell (Mobile Drawer)'),
              backgroundColor: Colors.blueGrey,
              foregroundColor: Colors.white,
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blueGrey),
                    child: Text('Navigation Menu', style: TextStyle(color: Colors.white, fontSize: 22)),
                  ),
                  for (int i = 0; i < _navTitles.length; i++)
                    ListTile(
                      leading: Icon([Icons.home, Icons.search, Icons.notifications, Icons.settings][i]),
                      title: Text(_navTitles[i]),
                      selected: _selectedIndex == i,
                      onTap: () {
                        setState(() => _selectedIndex = i);
                        Navigator.pop(context);
                      },
                    ),
                ],
              ),
            ),
            body: mainContent,
          );
        }
      },
    );
  }
}
