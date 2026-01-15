import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = context.read<LoginController>();

    return Scaffold(
      backgroundColor: Colors.grey[900],
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: loginController.form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 60),

                  /// TITLE
                  const Text(
                    'Selamat Datang',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none, 
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'IoT Irrigation Dashboard (Demo)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      decoration: TextDecoration.none,
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// EMAIL
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration('Email'),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) =>
                        loginController.enteredEmail = value ?? '',
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

                  const SizedBox(height: 14),

                  /// PASSWORD
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration('Password'),
                    obscureText: true,
                    onSaved: (value) =>
                        loginController.enteredPassword = value ?? '',
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

                  const SizedBox(height: 28),

                  /// LOGIN BUTTON
                  Consumer<LoginController>(
                    builder: (context, controller, _) {
                      return ElevatedButton(
                        onPressed: controller.isLoading
                            ? null
                            : () => controller.login(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding:
                              const EdgeInsets.symmetric(vertical: 14),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: controller.isLoading
                            ? const SizedBox(
                                height: 22,
                                width: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  /// REGISTER (NO UNDERLINE)
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                      overlayColor: Colors.transparent,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, '/register'),
                    child: const Text(
                      'Belum punya akun? Daftar di sini',
                      style: TextStyle(
                        decoration: TextDecoration.none, // 🔥 HILANG
                      ),
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

  static InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      filled: true,
      fillColor: Colors.grey[800],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none, // 🔥 TIDAK ADA GARIS BAWAH
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blue),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
    );
  }
}
