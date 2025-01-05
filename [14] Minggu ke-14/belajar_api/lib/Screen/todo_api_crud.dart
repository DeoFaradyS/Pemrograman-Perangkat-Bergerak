import 'package:flutter/material.dart';
import 'package:belajar_api/DB/todo_api.dart';
import 'package:belajar_api/Screen/create_todo_widget.dart';
import 'package:belajar_api/Model/todo_api_model.dart';

class TodoApiCrud extends StatefulWidget {
  const TodoApiCrud({super.key});

  @override
  State<TodoApiCrud> createState() => _TodoApiCrudState();
}

class _TodoApiCrudState extends State<TodoApiCrud> {
  Future<List<TodoApiModel>>? _futureTodos;
  final TodoApi _todoApi = TodoApi();

  @override
  void initState() {
    super.initState();
    _fetchTodos();
  }

  void _fetchTodos() {
    setState(() {
      _futureTodos = _todoApi.fetchTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo CRUD"),
      ),
      floatingActionButton: _buildFloatingActionButton(),
      body: _buildBody(),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => _showCreateTodoDialog(),
      child: const Icon(Icons.add),
    );
  }

  Future<void> _showCreateTodoDialog() async {
    showDialog(
      context: context,
      builder: (_) => CreateTodoWidget(onSubmit: (title) async {
        await _todoApi.createTodo(title);
        if (!mounted) return;
        _fetchTodos();
        Navigator.of(context).pop();
      }),
    );
  }

  Widget _buildBody() {
    return FutureBuilder<List<TodoApiModel>>(
      future: _futureTodos,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Todo Added Yet'));
        }

        final todos = snapshot.data!;

        return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return _buildTodoItem(todos[index]);
          },
        );
      },
    );
  }

  Widget _buildTodoItem(TodoApiModel todo) {
    return ListTile(
      title: Text(todo.title),
      trailing: IconButton(
        onPressed: () async {
          await _todoApi.deleteTodo(todo.id);
          _fetchTodos();
        },
        icon: const Icon(Icons.delete),
        color: Colors.red,
      ),
      onTap: () => _showUpdateTodoDialog(todo),
    );
  }

  Future<void> _showUpdateTodoDialog(TodoApiModel todo) async {
    showDialog(
      context: context,
      builder: (context) => CreateTodoWidget(
        todoApi: todo,
        onSubmit: (title) async {
          await _todoApi.updateTodo(todo.id, title);
          if (!mounted) return;
          _fetchTodos();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}