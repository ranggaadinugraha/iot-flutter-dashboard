import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final form = GlobalKey<FormState>();

  bool isLogin = true;
  bool isAuthenticated = false;

  String enteredEmail = '';
  String enteredPassword = '';

  Future<void> submit(BuildContext context) async {
    final isValid = form.currentState?.validate() ?? false;

    if (!isValid) return;

    form.currentState?.save();

    await Future.delayed(const Duration(seconds: 1));

    if (isLogin) {
      if (enteredEmail.isNotEmpty && enteredPassword.isNotEmpty) {
        isAuthenticated = true;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login berhasil (Demo Mode)'),
          ),
        );

        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email dan password wajib diisi'),
          ),
        );
      }
    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registrasi berhasil (Demo Mode). Silakan login.'),
        ),
      );

      isLogin = true; 
    }

    notifyListeners();
  }

  void logout(BuildContext context) {
    isAuthenticated = false;

    Navigator.pushReplacementNamed(context, '/login');

    notifyListeners();
  }

  void toggleAuthMode() {
    isLogin = !isLogin;
    notifyListeners();
  }
}
