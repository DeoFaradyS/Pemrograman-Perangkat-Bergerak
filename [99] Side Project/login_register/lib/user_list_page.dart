import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'user.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  void _fetchUsers() async {
    List<User> users = await _databaseHelper.getAllUsers();
    setState(() {
      _users = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User  List'),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_users[index].username),
            subtitle: Text('Password: ${_users[index].password}'),
          );
        },
      ),
    );
  }
}
