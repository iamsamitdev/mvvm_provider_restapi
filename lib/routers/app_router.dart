// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mvvm_provider_restapi/views/dashboard_view.dart';
import 'package:mvvm_provider_restapi/views/login_view.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => LoginView(),
    '/dashboard': (context) => DashboardView(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder);
    } else {
      return MaterialPageRoute(builder: (_) => Scaffold(
        body: Center(
          child: Text('404 - Page not found'),
        ),
      ));
    }
  }
}
