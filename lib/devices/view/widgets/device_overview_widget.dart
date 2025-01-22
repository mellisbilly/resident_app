import 'package:flutter/material.dart';
import 'package:property_api_client/property_api_client.dart';
import 'package:resident_app/device/device.dart';


// TODOset up new service to access battery data
class DeviceOverviewWidget extends StatelessWidget {
  const DeviceOverviewWidget({required this.device, super.key});

  final Device device;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: GestureDetector(
        // 
        onTap: () => Navigator.of(context).push(
          // ignore: inference_failure_on_instance_creation
          MaterialPageRoute(
            builder: (context) => DevicePage(
              device: device,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: colorScheme.primary,
          ),
          child: Row(
            children: [
              DeviceImage(modelTypeId: device.modelTypeId),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      style: textTheme.bodyMedium,
                      device.modelName,
                    ),
                    Text(
                      textAlign: TextAlign.start,
                      style: textTheme.bodySmall,
                      device.roomName!,
                    ),
                    // TODOcalculate status of device based on requirements
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeviceImage extends StatelessWidget {
  const DeviceImage({
    required this.modelTypeId,
    super.key,
  });

  final String? modelTypeId;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _getImage(modelTypeId),
      width: 50,
      height: 50,
    );
  }

  String _getImage(String? modelTypeId) {
    switch (modelTypeId) {
      case 'COALARM':
        return 'assets/images/devices/COAlarm.png';
      case 'ENVSENSOR':
      case 'ENVCO2SENSOR':
        return 'assets/images/devices/Ei102025.png';
      case 'GATEWAY':
        return 'assets/images/devices/AicoGateway.png';
      case 'FIREALARM':
      case 'FIRECOALARM':
        return 'assets/images/devices/SmokeAlarm.png';
      default:
        return 'assets/images/devices/Ei102025.png';
    }
  }
}
