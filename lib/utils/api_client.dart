import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio();

  Future<Response> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } catch (error) {
      throw Exception('Failed to make GET request');
    }
  }

  Future<Response> post(String url, dynamic data) async {
    try {
      final response = await _dio.post(url, data: data);
      return response;
    } catch (error) {
      throw Exception('Failed to make POST request');
    }
  }

  Future<Response> put(String url, dynamic data) async {
    try {
      final response = await _dio.put(url, data: data);
      return response;
    } catch (error) {
      throw Exception('Failed to make PUT request');
    }
  }

  Future<Response> delete(String url) async {
    try {
      final response = await _dio.delete(url);
      return response;
    } catch (error) {
      throw Exception('Failed to make DELETE request');
    }
  }
}
