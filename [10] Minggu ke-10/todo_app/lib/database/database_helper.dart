import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/database/todo_db.dart';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    return _database ??= await _initDatabase();
  }

  Future<String> get _databasePath async {
    const String dbName = 'todo.db';
    final String path = await getDatabasesPath();
    return join(path, dbName);
  }

  Future<Database> _initDatabase() async {
    final String path = await _databasePath;

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      singleInstance: true,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    final TodoDb todoDB = TodoDb();
    await todoDB.createTable(db);
  }
}