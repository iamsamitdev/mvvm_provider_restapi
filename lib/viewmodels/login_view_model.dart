// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mvvm_provider_restapi/providers/login_provider.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginProvider _loginProvider;

  LoginViewModel(this._loginProvider);

  Future<void> login(BuildContext context, String email, String password) async {
    try {
      await _loginProvider.login(email, password);
      // Handle any additional logic after successful login if needed

      // Navigate to the dashboard screen after successful login
      Navigator.pushReplacementNamed(context, '/dashboard');
    } catch (error) {
      // Handle login errors, e.g., show an error message
      throw Exception('Login failed');
    }
  }
}
