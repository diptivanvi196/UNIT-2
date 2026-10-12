import 'package:flutter/material.dart';

/// Practical B7: Build a TabBar with three tabs (Photos, Videos, Files),
/// each showing different placeholder content in a TabBarView.
class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('B7: TabBar & TabBarView'),
          backgroundColor: Colors.cyan.shade700,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.photo), text: 'Photos'),
              Tab(icon: Icon(Icons.videocam), text: 'Videos'),
              Tab(icon: Icon(Icons.insert_drive_file), text: 'Files'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.photo_library, size: 80, color: Colors.cyan),
                  SizedBox(height: 16),
                  Text('Photos Gallery Tab Content', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.video_library, size: 80, color: Colors.deepOrange),
                  SizedBox(height: 16),
                  Text('Videos Library Tab Content', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.folder, size: 80, color: Colors.purple),
                  SizedBox(height: 16),
                  Text('Documents & Files Tab Content', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
