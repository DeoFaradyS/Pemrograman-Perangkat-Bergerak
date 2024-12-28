import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Model/todo_model.dart';

class CreateTodoWidget extends StatefulWidget {
  final TodoModel? todo;
  final ValueChanged<String> onSubmit;

  const CreateTodoWidget({super.key, this.todo, required this.onSubmit});

  @override
  State<CreateTodoWidget> createState() => _CreateTodoWidgetState();
}

class _CreateTodoWidgetState extends State<CreateTodoWidget> {
  final controller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    controller.text = widget.todo?.title ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final isUpdate = widget.todo != null;
    return AlertDialog(
      title: Text(isUpdate ? 'Edit Todo' : 'Add Todo'),
      content: Form(
          key: formkey,
          child: TextFormField(
            controller: controller,
            autofocus: true,
            validator: (value) =>
                value != null && value.isEmpty ? 'Title is required' : null,
          )),
      actions: [
        TextButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                Navigator.pop(context);
              }
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              widget.onSubmit(controller.text);
            },
            child: const Text("Submit")),
      ],
    );
  }
}
