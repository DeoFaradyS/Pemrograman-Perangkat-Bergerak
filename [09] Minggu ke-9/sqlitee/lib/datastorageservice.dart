import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'User.dart';

class DataStorageService {
  static const String _userKey = 'User ';
  static const String _tokenKey = 'User Token';
  static const String _localUserFileName = 'local_user.json';

  // SharedPreferences
  Future<void> saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, name);
  }

  Future<String?> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userKey);
  }

  // FlutterSecureStorage
  Future<void> saveToken(String token) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    final storage =  FlutterSecureStorage();
    return await storage.read(key: _tokenKey);
  }

  // Local File Storage
  Future<void> saveLocalUser (User user) async {
    final file = File('${(await getApplicationDocumentsDirectory()).path}/$_localUserFileName');
    await file.writeAsString(json.encode(user.toJson()));
  }

  Future<User?> getLocalUser () async {
    final file = File('${(await getApplicationDocumentsDirectory()).path}/$_localUserFileName');
    if (await file.exists()) {
      String fileContent = await file.readAsString();
      return User.fromJson(json.decode(fileContent));
    }
    return null;
  }

  // SQLite
  Future<void> createTable() async {
    var databasesPath = await getDatabasesPath();
    join(databasesPath, 'demo.db');
  }
}