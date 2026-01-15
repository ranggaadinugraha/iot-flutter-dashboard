import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/gauge_widget.dart';
import '../widgets/rounded_button.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardController = context.watch<DashboardController>();
    final theme = Theme.of(context);

    final isDataLoaded =
        dashboardController.temperature != 0 ||
        dashboardController.soilMoisture != 0 ||
        dashboardController.humidity != 0;

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: isDataLoaded
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GaugeWidget(
                      label: "Temperature",
                      value: dashboardController.temperature,
                      color: Colors.green,
                    ),
                    GaugeWidget(
                      label: "Soil Moisture",
                      value: dashboardController.soilMoisture,
                      color: Colors.yellow,
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                GaugeWidget(
                  label: "Humidity",
                  value: dashboardController.humidity,
                  color: Colors.cyan,
                ),

                const SizedBox(height: 80),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Pump Status",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: dashboardController.togglePumpStatus,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: RoundedButton(
                              key: ValueKey(dashboardController.isPumpOn),
                              label: dashboardController.isPumpOn ? "ON" : "OFF",
                              color: dashboardController.isPumpOn
                                  ? theme.colorScheme.error
                                  : Colors.teal,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        const Text(
                          "Mode",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: dashboardController.toggleAutoMode,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: RoundedButton(
                              key: ValueKey(dashboardController.isAutoMode),
                              label: dashboardController.isAutoMode
                                  ? "Auto"
                                  : "Manual",
                              color: dashboardController.isAutoMode
                                  ? Colors.green
                                  : Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
