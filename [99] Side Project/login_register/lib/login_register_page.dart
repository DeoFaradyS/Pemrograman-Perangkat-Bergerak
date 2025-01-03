import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'user.dart';

class LoginRegisterPage extends StatefulWidget {
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  bool _isLogin = true;

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _submit() async {
    if (_isLogin) {
      // Login
      User? user = await _databaseHelper.getUser(
        _usernameController.text,
        _passwordController.text,
      );
      if (user != null) {
        // Login berhasil
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login berhasil!')),
        );
      } else {
        // Login gagal
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Username atau password salah!')),
        );
      }
    } else {
      // Register
      User newUser = User(
        username: _usernameController.text,
        password: _passwordController.text,
      );
      await _databaseHelper.insertUser(newUser);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registrasi berhasil!')),
      );
      _toggleForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Login' : 'Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text(_isLogin ? 'Login' : 'Register'),
            ),
            TextButton(
              onPressed: _toggleForm,
              child: Text(_isLogin
                  ? 'Belum punya akun? Daftar'
                  : 'Sudah punya akun? Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/userList');
              },
              child: Text('Lihat Daftar Pengguna'),
            ),
          ],
        ),
      ),
    );
  }
}
