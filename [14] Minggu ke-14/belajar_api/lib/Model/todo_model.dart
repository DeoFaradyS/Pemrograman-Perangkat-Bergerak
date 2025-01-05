class TodoModel {
  final int id;
  final String title;

  TodoModel({required this.id, required this.title});

  factory TodoModel.fromSqfliteDatabase(Map<String, dynamic> map) => TodoModel(
    id: map['id'],
    title: map['title']
  );
}