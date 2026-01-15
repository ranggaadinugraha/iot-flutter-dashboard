import 'package:flutter/material.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
          ),

          const SizedBox(height: 20),

          const Text(
            'User Demo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'rangga@email.com',
            style: TextStyle(color: Colors.white70),
          ),

          const SizedBox(height: 16),

          const Text(
            'Flutter Developer | UI Enthusiast',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54),
          ),

          const SizedBox(height: 40),

          ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
                (_) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFAC7875),
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 60,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
