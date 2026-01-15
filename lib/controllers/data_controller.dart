import 'dart:async';
import 'package:flutter/material.dart';

class DataController extends ChangeNotifier {
  List<Map<String, dynamic>> sensorData = [];

  Timer? _timer;

  DataController() {
    _startSimulation();
  }

  void _startSimulation() {
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      final now = DateTime.now();

      sensorData.insert(0, {
        'time': now.toIso8601String().substring(11, 19),
        'humidity': '${(50 + now.second % 30)}%',
        'temperature': '${(24 + now.second % 6)}°C',
        'soilMoisture': '${(40 + now.second % 40)}%',
        'pumpState': now.second % 2 == 0 ? 'ON' : 'OFF',
        'systemMode': now.second % 2 == 0 ? 'Automatic' : 'Manual',
      });

      // simpan maksimal 10 data terakhir
      if (sensorData.length > 10) {
        sensorData = sensorData.take(10).toList();
      }

      notifyListeners();
    });
  }

  List<Map<String, dynamic>> getLatestData() {
    return sensorData;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
