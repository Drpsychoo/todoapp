import 'package:dio/dio.dart';
import 'package:texastodo/api%20test/model/test_model.dart';

class ApiRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://10.160.9.8:3000/todos'));

  Future<List<TodoModel>> getTodos() async {
    try {
      print('[GET] /get');
      final response = await _dio.get('/get');
      print('Response: ${response.statusCode} ${response.data}');

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        return data.map((e) => TodoModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load todos: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getTodos: $e');
      rethrow;
    }
  }

  Future<TodoModel> getTodoById(String id) async {
    try {
      print('[GET] /get/$id');
      final response = await _dio.get('/get/$id');
      print('Response: ${response.statusCode} ${response.data}');

      if (response.statusCode == 200) {
        return TodoModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load todo: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getTodoById: $e');
      rethrow;
    }
  }

  Future<TodoModel> createTodo(String title) async {
    try {
      print('[POST] /create with data: {"title": "$title"}');
      final response = await _dio.post('/create', data: {'title': title});
      print('Response: ${response.statusCode} ${response.data}');

      if (response.statusCode == 201) {
        return TodoModel.fromJson(response.data);
      } else {
        throw Exception('Failed to create todo: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in createTodo: $e');
      rethrow;
    }
  }

  Future<TodoModel> updateTodo(
    String id,
    Map<String, dynamic> updateData,
  ) async {
    try {
      print('[PUT] /update/$id with data: $updateData');
      final response = await _dio.put('/update/$id', data: updateData);
      print('Response: ${response.statusCode} ${response.data}');

      if (response.statusCode == 200) {
        return TodoModel.fromJson(response.data);
      } else {
        throw Exception('Failed to update todo: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in updateTodo: $e');
      rethrow;
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      print('[DELETE] /delete/$id');
      final response = await _dio.delete('/delete/$id');
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
