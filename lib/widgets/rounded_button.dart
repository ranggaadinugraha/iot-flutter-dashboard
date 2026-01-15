import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final Color color;

  const RoundedButton({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
