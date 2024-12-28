import 'package:sqflite/sqflite.dart';
import 'package:todo_app/DB/database_helper.dart';
import 'package:todo_app/Model/todo_model.dart';

class TodoDb {
  final tableName = 'todo';

  Future<void> createTable(Database db) async {
    await db.execute("""
        CREATE TABLE IF NOT EXISTS $tableName(
          "id" INTEGER NOT NULL,
          "title" TEXT NOT NULL,
          PRIMARY KEY("id" AUTOINCREMENT)
        );
      """);
  }

  Future<int> create({required String title}) async {
    final database = await DatabaseHelper().database;

    return await database.rawInsert("""
        INSERT INTO $tableName (title) VALUES (?)
      """, [title]);
  }

  Future<List<TodoModel>> getAll() async {
    final database = await DatabaseHelper().database;

    final todos = await database.rawQuery("""
        SELECT * FROM $tableName
      """);

    return todos.map((todo) => TodoModel.fromSqfliteDatabase(todo)).toList();
  }

  Future<TodoModel> getById(int id) async {
    final database = await DatabaseHelper().database;

    final todo = await database.rawQuery("""
        SELECT * FROM $tableName WHERE id=?
      """, [id]);

    return TodoModel.fromSqfliteDatabase(todo.first);
  }

  Future<int> update({required int id, String? title}) async {
    final database = await DatabaseHelper().database;

    return await database.update(tableName, {if (title != null) 'title': title},
        where: 'id = ?',
        whereArgs: [id],
        conflictAlgorithm: ConflictAlgorithm.rollback);
  }

  Future<void> delete(int id) async {
    final database = await DatabaseHelper().database;

    await database.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
