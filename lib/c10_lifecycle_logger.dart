import 'package:flutter/material.dart';

/// Practical C10: Build a complete widget lifecycle logger utility: a wrapper
/// StatefulWidget that logs every lifecycle event (with timestamps) for any child
/// widget passed to it, and demonstrate it wrapping a Counter widget.

class LifecycleLoggerWrapper extends StatefulWidget {
  final Widget child;

  const LifecycleLoggerWrapper({super.key, required this.child});

  @override
  State<LifecycleLoggerWrapper> createState() => _LifecycleLoggerWrapperState();
}

class _LifecycleLoggerWrapperState extends State<LifecycleLoggerWrapper> {
  final List<String> _eventLogs = [];

  void _log(String event) {
    final timestamp = DateTime.now().toString().substring(11, 22);
    final logMessage = '[$timestamp] $event';
    debugPrint(logMessage);
    _eventLogs.add(logMessage);
  }

  @override
  void initState() {
    super.initState();
    _log('initState()');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _log('didChangeDependencies()');
  }

  @override
  void didUpdateWidget(covariant LifecycleLoggerWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    _log('didUpdateWidget()');
  }

  @override
  void deactivate() {
    _log('deactivate()');
    super.deactivate();
  }

  @override
  void dispose() {
    _log('dispose()');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _log('build()');

    return Column(
      children: [
        // Wrapped Child Widget
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.teal.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.teal),
          ),
          child: widget.child,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Lifecycle Logger Output:', style: TextStyle(fontWeight: FontWeight.bold)),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  _eventLogs.clear();
                });
              },
              icon: const Icon(Icons.clear_all, size: 18),
              label: const Text('Clear Logs'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black90,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.builder(
              itemCount: _eventLogs.length,
              itemBuilder: (context, index) {
                return Text(
                  _eventLogs[index],
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontFamily: 'monospace',
                    fontSize: 13,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

// Inner Counter Widget used to demonstrate wrapping
class CounterWidgetDemo extends StatefulWidget {
  const CounterWidgetDemo({super.key});

  @override
  State<CounterWidgetDemo> createState() => _CounterWidgetDemoState();
}

class _CounterWidgetDemoState extends State<CounterWidgetDemo> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Counter Value: $_count', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: () => setState(() => _count++),
          icon: const Icon(Icons.add),
          label: const Text('Increment Counter'),
        ),
      ],
    );
  }
}

class LifecycleLoggerScreen extends StatelessWidget {
  const LifecycleLoggerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('C10: Lifecycle Logger Utility'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LifecycleLoggerWrapper(
          child: const CounterWidgetDemo(),
        ),
      ),
    );
  }
}
