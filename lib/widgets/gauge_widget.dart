import 'package:flutter/material.dart';

class GaugeWidget extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const GaugeWidget({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Membatasi nilai value antara 0 dan 100
    int clampedValue = value.clamp(0, 100);

    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: 150,
          height: 180,
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: clampedValue / 100, // Pastikan nilainya antara 0 dan 1
                    strokeWidth: 10,
                    backgroundColor: Colors.grey[800],
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "$clampedValue", // Menampilkan nilai yang sudah dibatasi
                  style: TextStyle(
                    color: color,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
