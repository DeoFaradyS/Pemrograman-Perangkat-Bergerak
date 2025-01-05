import 'package:flutter/material.dart';
import 'package:belajar_api/DB/todo_db.dart';
import 'package:belajar_api/Model/todo_model.dart';
import 'package:belajar_api/Screen/create_todo_widget.dart';

class TodoCrud extends StatefulWidget {
  const TodoCrud({super.key});

  @override
  State<TodoCrud> createState() => _TodoCrudState();
}

// ignore: camel_case_types
class _TodoCrudState extends State<TodoCrud> {
  Future<List<TodoModel>>? futureTodo;
  final todoDb = TodoDb();

  @override
  void initState() {
    super.initState();
    getTodo();
  }

  void getTodo() {
    setState(() {
      futureTodo = todoDb.getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo CRUD"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => CreateTodoWidget(onSubmit: (Title) async {
                    await todoDb.create(title: Title);
                    if (!mounted) return;
                    getTodo();
                    Navigator.of(context).pop();
                  }));
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
          future: futureTodo,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              if (snapshot.data == null) {
                return const Center(child: Text('No Todo Added Yet'));
              }

              final todos = snapshot.data!;

              return todos.isEmpty
                  ? const Center(
                      child: Text("No Todo Added Yet"),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 12,
                        );
                      },
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final todo = todos[index];

                        return ListTile(
                          title: Text(todo.title),
                          trailing: IconButton(
                            onPressed: () async {
                              await todoDb.delete(todo.id);
                              getTodo();
                            },
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => CreateTodoWidget(
                                    todo: todo,
                                    onSubmit: (Title) async {
                                      await todoDb.update(
                                          id: todo.id, title: Title);
                                      if (!mounted) return;
                                      getTodo();
                                      Navigator.of(context).pop();
                                    }));
                          },
                        );
                      },
                    );
            }
          }),
    );
  }
}
