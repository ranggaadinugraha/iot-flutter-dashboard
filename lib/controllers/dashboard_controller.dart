import 'dart:async';
import 'package:flutter/material.dart';

class DashboardController extends ChangeNotifier {
  bool _isPumpOn = false;
  bool _isAutoMode = true;

  int _humidity = 65;
  int _soilMoisture = 55;
  int _temperature = 28;
  int _threshold = 60;

  Timer? _timer;

  bool get isPumpOn => _isPumpOn;
  bool get isAutoMode => _isAutoMode;
  int get humidity => _humidity;
  int get soilMoisture => _soilMoisture;
  int get temperature => _temperature;
  int get threshold => _threshold;

  DashboardController() {
    _startSimulation();
  }

  void _startSimulation() {
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      _humidity = (_humidity + 1) % 100;
      _temperature = 25 + DateTime.now().second % 6;

      if (_isPumpOn) {
        _soilMoisture += 2;
      } else {
        _soilMoisture -= 1;
      }

      _soilMoisture = _soilMoisture.clamp(20, 90);

      if (_isAutoMode) {
        _handleAutomaticMode();
      }

      notifyListeners();
    });
  }

  void _handleAutomaticMode() {
    if (_soilMoisture < _threshold && !_isPumpOn) {
      _isPumpOn = true;
    } else if (_soilMoisture >= _threshold && _isPumpOn) {
      _isPumpOn = false;
    }
  }

  void togglePumpStatus() {
    if (!_isAutoMode) {
      _isPumpOn = !_isPumpOn;
      notifyListeners();
    }
  }

  void toggleAutoMode() {
    _isAutoMode = !_isAutoMode;
    notifyListeners();
  }

  void updateThreshold(int value) {
    _threshold = value.clamp(30, 80);
    notifyListeners();
  }

  Future<void> refreshData() async {
    await Future.delayed(const Duration(milliseconds: 500));
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
