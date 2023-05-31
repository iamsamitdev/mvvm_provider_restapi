import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final Dio _dio;

  LoginProvider(this._dio);

  Future<void> login(String email, String password) async {
    try {
      final response = await _dio.post(
        'https://your-api-endpoint.com/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      // Check the response status and handle success or failure accordingly
      if (response.statusCode == 200) {
        // Login successful
        // Perform any necessary processing or store user data if needed
      } else {
        // Login failed
        throw Exception('Login failed');
      }
    } catch (error) {
      // Handle any network or API errors
      throw Exception('Network error');
    }
  }
}
