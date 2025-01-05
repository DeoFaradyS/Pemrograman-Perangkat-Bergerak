import 'dart:convert';

class TodoApiModel {
  String id;
  String title;

  TodoApiModel({
    required this.id,
    required this.title,
  });

  factory TodoApiModel.fromJson(Map<String, dynamic> json) {
    return TodoApiModel(
      id: json['id'],
      title: json['title'],
    );
    
  }
    Map<String, dynamic> toJson() => {
      'id': id,
      'title': title
    };
}

List<TodoApiModel> todoApiModelFromJson(String str) => List<TodoApiModel>.from(json.decode(str).map((x) => TodoApiModel.fromJson(x)));

String todoApiModelToJson(
  List<TodoApiModel> data,
) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));