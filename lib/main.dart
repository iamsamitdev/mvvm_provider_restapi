// ignore_for_file: use_key_in_widget_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_provider_restapi/providers/login_provider.dart';
import 'package:mvvm_provider_restapi/viewmodels/login_view_model.dart';
import 'package:mvvm_provider_restapi/views/login_view.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatelessWidget {
  final Dio _dio = Dio(); // Create an instance of Dio

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Dio>.value(value: _dio), // Provide the Dio instance
        ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(_dio),
        ),
        ChangeNotifierProxyProvider<LoginProvider, LoginViewModel>(
          create: (_) => LoginViewModel(Provider.of<LoginProvider>(context, listen: false)),
          update: (_, loginProvider, previousViewModel) => LoginViewModel(loginProvider),
        ),
      ],
      child: MaterialApp(
        title: 'Login Demo',
        home: LoginView(),
      ),
    );
  }
}
