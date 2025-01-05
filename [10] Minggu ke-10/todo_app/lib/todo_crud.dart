import 'package:flutter/material.dart';
import 'package:todo_app/database/todo_db.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/create_todo_widget.dart';

class TodoCRUD extends StatefulWidget {
  const TodoCRUD({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoCRUDState createState() => _TodoCRUDState();
}

class _TodoCRUDState extends State<TodoCRUD> {
  Future<List<TodoModel>>? _futureTodos;
  final TodoDb _todoDB = TodoDb();

  @override
  void initState() {
    super.initState();
    _fetchTodos();
  }

  void _fetchTodos() {
    setState(() {
      _futureTodos = _todoDB.getAll();
    });
  }

  Future<void> _createTodo(String title) async {
    await _todoDB.create(title: title);
    if (!mounted) return;
    _fetchTodos();
  }

  Future<void> _updateTodo(TodoModel todo, String title) async {
    await _todoDB.update(id: todo.id, title: title);
    if (!mounted) return;
    _fetchTodos();
  }

  Future<void> _deleteTodo(int id) async {
    await _todoDB.delete(id);
    _fetchTodos();
  }

  void _showCreateTodoDialog({TodoModel? todo}) {
    showDialog(
      context: context,
      builder: (context) => CreateTodoWidget(
        todo: todo,
        onSubmit: todo == null ? _createTodo : (title) => _updateTodo(todo, title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateTodoDialog(),
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<TodoModel>>(
        future: _futureTodos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error loading todos"));
          }

          final todos = snapshot.data ?? [];

          if (todos.isEmpty) {
            return const Center(child: Text("No Todo Added Yet"));
          }

          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return ListTile(
                title: Text(todo.title),
                trailing: IconButton(
                  onPressed: () => _deleteTodo(todo.id),
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
                onTap: () => _showCreateTodoDialog(todo: todo),
              );
            },
          );
        },
      ),
    );
  }
}