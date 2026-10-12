import 'package:flutter/material.dart';

/// Practical C6: Design a custom multi-tab profile screen combining TabBar,
/// GridView (for a photo grid tab), and ListView (for an activity feed tab)
/// inside a single Scaffold.
class MultiTabProfileScreen extends StatelessWidget {
  const MultiTabProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('C6: Multi-Tab Profile Screen'),
          backgroundColor: Colors.indigo.shade700,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.indigo.shade50,
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
                    child: Icon(Icons.person, size: 40),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dipti Patel', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('Senior Mobile App Developer', style: TextStyle(color: Colors.black54)),
                        SizedBox(height: 6),
                        Text('120 Posts • 3.4k Followers • 450 Following', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // TabBar
            const TabBar(
              labelColor: Colors.indigo,
              indicatorColor: Colors.indigo,
              tabs: [
                Tab(icon: Icon(Icons.grid_on), text: 'Photos Grid'),
                Tab(icon: Icon(Icons.list), text: 'Activity Feed'),
              ],
            ),
            // TabBarView Content
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1: GridView for photos
                  GridView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: 12,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                    ),
                    itemBuilder: (context, index) {
                      return Image.network(
                        'https://picsum.photos/200/200?random=$index',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.indigo.shade100,
                          child: Center(child: Text('Pic #${index + 1}')),
                        ),
                      );
                    },
                  ),
                  // Tab 2: ListView for activity feed
                  ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: const CircleAvatar(child: Icon(Icons.star)),
                          title: Text('Activity Item #${index + 1}'),
                          subtitle: Text('Published updates ${index + 1} hours ago.'),
                        ),
                      );
                    },
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
