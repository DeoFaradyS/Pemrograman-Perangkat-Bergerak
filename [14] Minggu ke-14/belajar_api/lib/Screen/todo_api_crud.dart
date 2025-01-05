import 'package:flutter/material.dart';
import 'package:belajar_api/DB/todo_api.dart';
import 'package:belajar_api/Screen/create_todo_widget.dart';

class TodoApiCrud extends StatefulWidget {
  const TodoApiCrud({super.key});

  @override
  State<TodoApiCrud> createState() => _TodoApiCrudState();
}

// ignore: camel_case_types
class _TodoApiCrudState extends State<TodoApiCrud> {
  Future<dynamic>? futureTodo;
  final todoApi = TodoApi();

  @override
  void initState() {
    super.initState();
    getTodo();
  }

  void getTodo() {
    setState(() {
      futureTodo = todoApi.getTodo();
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
                    await todoApi.post(Title);
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
                              await todoApi.delete(todo.id);
                              getTodo();
                            },
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => CreateTodoWidget(
                                    todoApi: todo,
                                    onSubmit: (Title) async {
                                      await todoApi.put(
                                          todo.id, Title);
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
