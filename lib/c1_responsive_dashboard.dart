import 'package:flutter/material.dart';

/// Practical C1: Build a complete responsive dashboard screen that displays
/// a single-column list on mobile, a two-column grid on tablets, and a
/// three-panel Row layout (sidebar, content, details) on desktop width,
/// using LayoutBuilder and MediaQuery together.
class ResponsiveDashboardScreen extends StatelessWidget {
  const ResponsiveDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('C1: Dashboard (${mediaWidth.toInt()} dp)'),
        backgroundColor: Colors.indigo.shade800,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          // Desktop Layout (> 1100 dp)
          if (width >= 1100) {
            return Row(
              children: [
                // Panel 1: Sidebar
                Container(
                  width: 220,
                  color: Colors.indigo.shade50,
                  child: ListView(
                    padding: const EdgeInsets.all(12),
                    children: const [
                      Text('Navigation', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Divider(),
                      ListTile(leading: Icon(Icons.dashboard), title: Text('Overview')),
                      ListTile(leading: Icon(Icons.analytics), title: Text('Analytics')),
                      ListTile(leading: Icon(Icons.people), title: Text('Users')),
                      ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
                    ],
                  ),
                ),
                // Panel 2: Main Content (2-column Grid)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Main Dashboard', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        Expanded(child: _buildGridCards(2)),
                      ],
                    ),
                  ),
                ),
                // Panel 3: Details Side Panel
                Container(
                  width: 280,
                  color: Colors.grey.shade100,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Recent Activity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      const ListTile(leading: Icon(Icons.notifications), title: Text('New user registered'), subtitle: Text('5 mins ago')),
                      const ListTile(leading: Icon(Icons.shopping_cart), title: Text('Order #1042 completed'), subtitle: Text('20 mins ago')),
                      const ListTile(leading: Icon(Icons.bug_report), title: Text('System alert logged'), subtitle: Text('1 hour ago')),
                    ],
                  ),
                ),
              ],
            );
          }
          // Tablet Layout (600 dp - 1099 dp)
          else if (width >= 600) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Tablet Dashboard (2-Column Grid)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Expanded(child: _buildGridCards(2)),
                ],
              ),
            );
          }
          // Mobile Layout (< 600 dp)
          else {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Mobile Dashboard (Single-Column)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Expanded(child: _buildListCards()),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildGridCards(int count) {
    final metrics = [
      {'title': 'Total Sales', 'value': '\$45,230', 'color': Colors.blue},
      {'title': 'Active Users', 'value': '1,280', 'color': Colors.green},
      {'title': 'Conversion Rate', 'value': '3.42%', 'color': Colors.orange},
      {'title': 'Pending Support', 'value': '14 Tickets', 'color': Colors.purple},
    ];

    return GridView.builder(
      itemCount: metrics.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.8,
      ),
      itemBuilder: (context, index) {
        final m = metrics[index];
        return Card(
          color: (m['color'] as Color).withOpacity(0.1),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(m['title'] as String, style: const TextStyle(fontSize: 16, color: Colors.black54)),
                const SizedBox(height: 8),
                Text(m['value'] as String, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: m['color'] as Color)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListCards() {
    final metrics = [
      {'title': 'Total Sales', 'value': '\$45,230', 'icon': Icons.attach_money, 'color': Colors.blue},
      {'title': 'Active Users', 'value': '1,280', 'icon': Icons.people, 'color': Colors.green},
      {'title': 'Conversion Rate', 'value': '3.42%', 'icon': Icons.trending_up, 'color': Colors.orange},
      {'title': 'Pending Support', 'value': '14 Tickets', 'icon': Icons.support_agent, 'color': Colors.purple},
    ];

    return ListView.builder(
      itemCount: metrics.length,
      itemBuilder: (context, index) {
        final m = metrics[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: m['color'] as Color,
              child: Icon(m['icon'] as IconData, color: Colors.white),
            ),
            title: Text(m['title'] as String),
            trailing: Text(
              m['value'] as String,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: m['color'] as Color),
            ),
          ),
        );
      },
    );
  }
}
