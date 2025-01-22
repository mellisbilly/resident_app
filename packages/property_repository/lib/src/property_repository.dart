import 'package:collection/collection.dart';
import 'package:property_api_client/property_api_client.dart';

// TODO(billy): create new models to consume only the data we need to from the property api client
/// {@template property_repository}
/// Property repository
/// {@endtemplate}
class PropertyRepository {
  /// {@macro property_repository}
  PropertyRepository({
    PropertyApiClient? propertyApiClient,
  }) : _propertyApiClient = propertyApiClient ?? PropertyApiClient();

  final PropertyApiClient _propertyApiClient;

  Future<Map<String, List<Device>>> getDevices({
    required bool withLatestReading,
    required bool withAlerts,
    required bool withEvents,
  }) async {
    try {
      final devices = await _propertyApiClient.getDevices(
        withLatestReading: withLatestReading,
        withAlerts: withAlerts,
        withEvents: withEvents,
      );

      final activeDevices = devices
          .where(
            (device) => device.statusId == 'ACTIVE',
          )
          .toList();

      final groupedDevices = groupBy<Device, String>(
        activeDevices,
        (device) => device.roomName!,
      );

      return groupedDevices;
    } catch (e) {
      throw Exception('Failed to get devices: $e');
    }
  }
}
