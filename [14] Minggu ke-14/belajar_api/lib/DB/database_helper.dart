import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:belajar_api/DB/todo_db.dart';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    
    _database = await _initDatabase();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'todo.db';

    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initDatabase() async {
    final path = await fullPath;

    var database = await openDatabase(path,
        version: 1, onCreate: create, singleInstance: true);

    return database;
  }

  Future<void> create(Database db, int version) async {
    TodoDb todoDB = TodoDb();
    await todoDB.createTable(db);
  }
}
