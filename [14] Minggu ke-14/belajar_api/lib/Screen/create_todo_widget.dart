import 'package:flutter/material.dart';
import 'package:belajar_api/Model/todo_api_model.dart';
import 'package:belajar_api/Model/todo_model.dart';

class CreateTodoWidget extends StatefulWidget {
  final TodoModel? todo;
  final TodoApiModel? todoApi;
  final ValueChanged<String> onSubmit;

  const CreateTodoWidget({
    super.key,
    this.todo,
    this.todoApi,
    required this.onSubmit,
  });

  @override
  State<CreateTodoWidget> createState() => _CreateTodoWidgetState();
}

class _CreateTodoWidgetState extends State<CreateTodoWidget> {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    controller.text = widget.todo?.title ?? '';
    controller.text = widget.todoApi?.title ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.todo != null 
    || widget.todoApi != null;
    return AlertDialog(
      title: Text(isEditing ? 'Edit Todo' : 'Add Todo'),
      content: Form(
          key: formKey,
          child: TextFormField(
            autofocus: true,
            controller: controller,
            validator: (value) =>
                value != null && value.isEmpty ? 'Title is required' : null,
          )),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                widget.onSubmit(controller.text);
              }
            },
            child: const Text("Submit"))
      ],
    );
  }
}
