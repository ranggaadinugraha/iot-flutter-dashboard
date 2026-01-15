import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  String enteredEmail = '';
  String enteredPassword = '';

  bool isLoading = false;
  bool isLoggedIn = false;

  Future<void> login(BuildContext context) async {
    final isValid = form.currentState?.validate() ?? false;
    if (!isValid) return;

    form.currentState?.save();

    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    if (enteredEmail.isNotEmpty && enteredPassword.isNotEmpty) {
      isLoggedIn = true;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login berhasil (Demo Mode)'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushReplacementNamed(context, '/home');
    } else {
      isLoggedIn = false;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email dan password wajib diisi'),
          backgroundColor: Colors.red,
        ),
      );
    }

    isLoading = false;
    notifyListeners();
  }
}
