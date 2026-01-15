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

      await Future.delayed(const Duration(seconds: 1));

      isRegistered = true;
      isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registrasi berhasil (Demo Mode)'),
        ),
      );

      Navigator.pop(context);
    }
  }
}
