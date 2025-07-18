import 'package:dio/dio.dart';
import 'package:texastodo/api%20test/model/test_model.dart';

class ApiRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<List<Todo>> getTodos() async {
    try {
      print('[GET] /get');
      final response = await _dio.get('/todos');
      print('Response: ${response.statusCode} ${response.data}');

      if (response.statusCode == 200) {
        final data = TodoModel.fromJson(response.data);
        return data.todos ?? [];
      } else {
        throw Exception('Failed to load todos: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getTodos: $e');
      rethrow;
    }
  }

  Future<Todo> getTodoById(String id) async {
    try {
      print('[GET] /get/$id');
      final response = await _dio.get('/todos/$id');
      print('Response: ${response.statusCode} ${response.data}');

      if (response.statusCode == 200) {
        return Todo.fromJson(response.data);
      } else {
        throw Exception('Failed to load todo: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getTodoById: $e');
      rethrow;
    }
  }

  Future<Todo> createTodo(Map<String, dynamic> value) async {
    try {
      final response = await _dio.post('/todos/add', data: value);
      print('Response: ${response.statusCode} ${response.data}');

      if (response.statusCode == 201) {
        return Todo.fromJson(response.data);
      } else {
        throw Exception('Failed to create todo: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in createTodo: $e');
      rethrow;
    }
  }

  Future<Todo> updateTodo(String id, Map<String, dynamic> updateData) async {
    try {
      print('[PUT] /update/$id with data: $updateData');
      final response = await _dio.put('/todos/$id', data: updateData);
      print('Response: ${response.statusCode} ${response.data}');

      if (response.statusCode == 200) {
        return Todo.fromJson(response.data);
      } else {
        throw Exception('Failed to update todo: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in updateTodo: $e');
      rethrow;
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      print('[DELETE] /delete/$id');
      final response = await _dio.delete('/todos/$id');
      print('Response: ${response.statusCode} ${response.data}');

      if (response.statusCode != 200) {
        throw Exception('Failed to delete todo: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in deleteTodo: $e');
      rethrow;
    }
  }
}
