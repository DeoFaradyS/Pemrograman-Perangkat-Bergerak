import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';

class CreateTodoWidget extends StatefulWidget {
  final TodoModel? todo;
  final ValueChanged<String> onSubmit;

  const CreateTodoWidget({
    super.key,
    this.todo,
    required this.onSubmit,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CreateTodoWidgetState createState() => _CreateTodoWidgetState();
}

class _CreateTodoWidgetState extends State<CreateTodoWidget> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    _controller.text = widget.todo?.title ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: _buildDialogTitle(),
      content: _buildForm(),
      actions: _buildDialogActions(),
    );
  }

  Widget _buildDialogTitle() {
    final isEditing = widget.todo != null;
    return Text(isEditing ? 'Edit Todo' : 'Add Todo');
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: TextFormField(
        autofocus: true,
        controller: _controller,
        validator: _validateTitle,
      ),
    );
  }

  String? _validateTitle(String? value) {
    return (value == null || value.isEmpty) ? 'Title is required' : null;
  }

  List<Widget> _buildDialogActions() {
    return [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text("Cancel"),
      ),
      TextButton(
        onPressed: _onSubmit,
        child: const Text("Submit"),
      ),
    ];
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() == true) {
      widget.onSubmit(_controller.text);
      Navigator.pop(context); // Close the dialog after submission
    }
  }
}