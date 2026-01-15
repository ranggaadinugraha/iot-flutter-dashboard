import 'package:flutter/material.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';
import '../pages/bottom_nav_bar_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/login': (context) => const LoginPage(),
      '/register': (context) => const RegisterPage(),
      '/home': (context) => const BottomNavBarPage(),
    };
  }
}
