import 'dart:convert';

class TodoApiModel {
  final String id;
  final String title;

  TodoApiModel({
    required this.id,
    required this.title,
  });

  factory TodoApiModel.fromJson(Map<String, dynamic> json) {
    return TodoApiModel(
      id: json['id'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}

List<TodoApiModel> todoApiModelFromJson(String jsonString) {
  final List<dynamic> jsonData = json.decode(jsonString);
  return jsonData.map((json) => TodoApiModel.fromJson(json)).toList();
}

String todoApiModelToJson(List<TodoApiModel> todos) {
  final List<Map<String, dynamic>> jsonList = todos.map((todo) => todo.toJson()).toList();
  return json.encode(jsonList);
}