import 'package:flutter/material.dart';

/// Practical C4: Build a StatefulWidget-based to-do list app where each item
/// can be added, marked complete (using setState), and removed, ensuring proper
/// use of didUpdateWidget when the list is passed from a parent widget.

class TodoItem {
  final String id;
  final String title;
  bool isCompleted;

  TodoItem({required this.id, required this.title, this.isCompleted = false});
}

// Child Widget utilizing didUpdateWidget
class TodoListWidget extends StatefulWidget {
  final List<TodoItem> todos;
  final Function(String id) onToggle;
  final Function(String id) onDelete;

  const TodoListWidget({
    super.key,
    required this.todos,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  int _itemCount = 0;

  @override
  void initState() {
    super.initState();
    _itemCount = widget.todos.length;
  }

  @override
  void didUpdateWidget(covariant TodoListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.todos.length != widget.todos.length) {
      debugPrint('[didUpdateWidget] Todo list length changed from ${oldWidget.todos.length} to ${widget.todos.length}');
      setState(() {
        _itemCount = widget.todos.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.todos.isEmpty) {
      return const Center(child: Text('No tasks added yet!'));
    }

    return ListView.builder(
      itemCount: _itemCount,
      itemBuilder: (context, index) {
        final todo = widget.todos[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: ListTile(
            leading: Checkbox(
              value: todo.isCompleted,
              onChanged: (_) => widget.onToggle(todo.id),
            ),
            title: Text(
              todo.title,
              style: TextStyle(
                decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
                color: todo.isCompleted ? Colors.grey : Colors.black,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.redAccent),
              onPressed: () => widget.onDelete(todo.id),
            ),
          ),
        );
      },
    );
  }
}

// Parent TodoAppScreen
class TodoAppScreen extends StatefulWidget {
  const TodoAppScreen({super.key});

  @override
  State<TodoAppScreen> createState() => _TodoAppScreenState();
}

class _TodoAppScreenState extends State<TodoAppScreen> {
  final List<TodoItem> _todoList = [
    TodoItem(id: '1', title: 'Complete MAD Practical A1'),
    TodoItem(id: '2', title: 'Implement didUpdateWidget in Todo App'),
  ];

  final TextEditingController _textController = TextEditingController();

  void _addTodo() {
    if (_textController.text.trim().isNotEmpty) {
      setState(() {
        _todoList.add(
          TodoItem(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            title: _textController.text.trim(),
          ),
        );
      });
      _textController.clear();
    }
  }

  void _toggleTodo(String id) {
    setState(() {
      final item = _todoList.firstWhere((element) => element.id == id);
      item.isCompleted = !item.isCompleted;
    });
  }

  void _deleteTodo(String id) {
    setState(() {
      _todoList.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('C4: Todo App (didUpdateWidget)'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Enter new task...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: _addTodo,
                  icon: const Icon(Icons.add),
                  backgroundColor: Colors.teal,
                ),
              ],
            ),
          ),
          Expanded(
            child: TodoListWidget(
              todos: List.from(_todoList), // Passes list triggering didUpdateWidget
              onToggle: _toggleTodo,
              onDelete: _deleteTodo,
            ),
          ),
        ],
      ),
    );
  }
}
