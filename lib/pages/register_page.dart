import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController =
        context.read<RegisterController>();

    return Scaffold(
      backgroundColor: Colors.grey[900],

      // ❌ APPBAR DIHILANGKAN TOTAL
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: registerController.form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),

                  /// TITLE
                  const Text(
                    'Buat Akun',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Daftar untuk mengakses dashboard',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),

                  /// EMAIL
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration('Email'),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) =>
                        registerController.enteredEmail = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return 'Email tidak valid';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 12),

                  /// PASSWORD
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration('Password'),
                    obscureText: true,
                    onSaved: (value) =>
                        registerController.enteredPassword = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      if (value.length < 6) {
                        return 'Minimal 6 karakter';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  /// REGISTER BUTTON
                  Consumer<RegisterController>(
                    builder: (context, controller, _) {
                      return ElevatedButton(
                        onPressed: controller.isLoading
                            ? null
                            : () =>
                                controller.register(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                              vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10),
                          ),
                        ),
                        child: controller.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                'Register',
                                style:
                                    TextStyle(fontSize: 16),
                              ),
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  /// BACK TO LOGIN
                  TextButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(
                            context, '/login'),
                    child: const Text(
                      'Sudah punya akun? Login di sini',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      filled: true,
      fillColor: Colors.grey[800],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blue),
      ),
    );
  }
}
