import 'package:belajar_api/Model/todo_api_model.dart';
import 'package:http/http.dart' as http;

String baseURL = 'https://6767d3e0c1de2e6421c85934.mockapi.io/todo';
var client = http.Client();

class TodoApi {
  Future<dynamic> getTodo() async {
    var url = Uri.parse(baseURL);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      return todoApiModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<dynamic> getById(String id) async {
    var url = Uri.parse('$baseURL/$id');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      return todoApiModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<dynamic> post(String title) async {
    var url = Uri.parse(baseURL);
    var body = {"title": title};
    var response = await client.post(url, body: body);

    if (response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<dynamic> put(String id, String title) async {
    var url = Uri.parse('$baseURL/$id');
    var body = {"title": title};
    var response = await client.put(url, body: body);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<dynamic> delete(String id) async {
    var url = Uri.parse('$baseURL/$id');
    var response = await client.delete(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
