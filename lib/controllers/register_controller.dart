import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier {
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  String enteredEmail = '';
  String enteredPassword = '';

  bool isLoading = false;
  bool isRegistered = false;

  Future<void> register(BuildContext context) async {
    if (form.currentState?.validate() ?? false) {
      form.currentState?.save();
      isLoading = true;
      notifyListeners();

      // ⏳ simulasi loading (seperti request backend)
      await Future.delayed(const Duration(seconds: 1));

      // ✅ simulasi registrasi berhasil
      isRegistered = true;
      isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registrasi berhasil (Demo Mode)'),
        ),
      );

      // 👉 setelah register, bisa langsung kembali ke login
      Navigator.pop(context);
    }
  }
}
