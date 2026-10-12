import 'package:flutter/material.dart';

/// Practical B1: Build a StatefulWidget lifecycle demo app that prints a message
/// to the console at each lifecycle stage (initState, build, dispose, etc.).
class LifecycleDemoScreen extends StatefulWidget {
  const LifecycleDemoScreen({super.key});

  @override
  State<LifecycleDemoScreen> createState() => _LifecycleDemoScreenState();
}

class _LifecycleDemoScreenState extends State<LifecycleDemoScreen> {
  final List<String> _logs = [];

  void _addLog(String event) {
    debugPrint('[Lifecycle] $event');
    _logs.add('${DateTime.now().toString().substring(11, 19)}: $event');
  }

  @override
  void initState() {
    super.initState();
    _addLog('initState() called');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _addLog('didChangeDependencies() called');
  }

  @override
  void didUpdateWidget(covariant LifecycleDemoScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _addLog('didUpdateWidget() called');
  }

  @override
  void deactivate() {
    _addLog('deactivate() called');
    super.deactivate();
  }

  @override
  void dispose() {
    _addLog('dispose() called');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _addLog('build() called');

    return Scaffold(
      appBar: AppBar(
        title: const Text('B1: Lifecycle Demo'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _addLog('Triggered setState()');
                });
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Rebuild Widget (setState)'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Lifecycle Logs:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                  itemCount: _logs.length,
                  itemBuilder: (context, index) {
                    return Text(
                      _logs[index],
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontFamily: 'monospace',
                        fontSize: 14,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
