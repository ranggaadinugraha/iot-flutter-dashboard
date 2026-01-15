import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/data_controller.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(16),
      child: Consumer<DataController>(
        builder: (context, controller, _) {
          if (controller.sensorData.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          final latestData = controller.getLatestData();

          return ListView.separated(
            itemCount: latestData.length,
            separatorBuilder: (_, __) => const Divider(
              color: Colors.white24,
              thickness: 1,
            ),
            itemBuilder: (context, index) {
              final data = latestData[index];
              return _buildDataCard(
                time: data['time']!,
                humidity: data['humidity']!,
                temperature: data['temperature']!,
                soilMoisture: data['soilMoisture']!,
                pumpState: data['pumpState']!,
                systemMode: data['systemMode']!,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildDataCard({
    required String time,
    required String humidity,
    required String temperature,
    required String soilMoisture,
    required String pumpState,
    required String systemMode,
  }) {
    return Card(
      color: Colors.grey[850],
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _row('Time', time),
            _row('Humidity', humidity),
            _row('Temperature', temperature),
            _row('Soil Moisture', soilMoisture),
            _row('Pump State', pumpState),
            _row('System Mode', systemMode),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
