import 'dart:convert';
import 'package:belajar_api/Model/todo_api_model.dart';
import 'package:http/http.dart' as http;

class TodoApi {
  static const String _baseURL = 'https://6767d3e0c1de2e6421c85934.mockapi.io/todo';
  final http.Client _client;

  TodoApi({http.Client? client}) : _client = client ?? http.Client();

  Future<List<TodoApiModel>> fetchTodos() async {
    final response = await _getRequest(_baseURL);
    return _handleResponse<List<TodoApiModel>>(response, (data) => (jsonDecode(data) as List).map((item) => TodoApiModel.fromJson(item)).toList());
  }

  Future<TodoApiModel> fetchTodoById(String id) async {
    final response = await _getRequest('$_baseURL/$id');
    return _handleResponse<TodoApiModel>(response, (data) => TodoApiModel.fromJson(jsonDecode(data)));
  }

  Future<TodoApiModel> createTodo(String title) async {
    final response = await _postRequest(_baseURL, {'title': title});
    return _handleResponse<TodoApiModel>(response, (data) => TodoApiModel.fromJson(jsonDecode(data)));
  }

  Future<TodoApiModel> updateTodo(String id, String title) async {
    final response = await _putRequest('$_baseURL/$id', {'title': title});
    return _handleResponse<TodoApiModel>(response, (data) => TodoApiModel.fromJson(jsonDecode(data)));
  }

  Future<void> deleteTodo(String id) async {
    final response = await _deleteRequest('$_baseURL/$id');
    _handleResponse<void>(response, (data) {});
  }

  Future<http.Response> _getRequest(String url) async {
    return await _client.get(Uri.parse(url));
  }

  Future<http.Response> _postRequest(String url, Map<String, String> body) async {
    return await _client.post(Uri.parse(url), body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
  }

  Future<http.Response> _putRequest(String url, Map<String, String> body) async {
    return await _client.put(Uri.parse(url), body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
  }

  Future<http.Response> _deleteRequest(String url) async {
    return await _client.delete(Uri.parse(url));
  }

  T _handleResponse<T>(http.Response response, T Function(String) fromJson) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return fromJson(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}