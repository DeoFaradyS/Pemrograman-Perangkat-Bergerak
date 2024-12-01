import 'dart:io';

import 'package:sqflite/sqflite.dart';

class DatabaseInstance {
  final String _databaseName = 'sqlitee.db';
  final int _databaseVersion = 1;

  // Product Table
  final String tableProduct = 'product';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnDescription = 'description';

  Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory document
  }
}
