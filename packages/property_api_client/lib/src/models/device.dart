import 'package:json_annotation/json_annotation.dart';
import 'package:property_api_client/property_api_client.dart';

part 'device.g.dart';

@JsonSerializable()
class Device {
  Device({
    required this.id,
    required this.propertyId,
    required this.name,
    required this.modelName,
    required this.serialNumber,
    required this.modelReference,
    required this.modelTypeId,
    required this.locationId,
    required this.locationNickname,
    required this.statusId,
    required this.typeId,
    required this.installationDate,
    required this.deviceIdentifiers,
    required this.hidden,
    required this.lifetimeMonths,
    required this.replaceByDate,
    required this.lifePercentage,
    required this.batteryPercentage,
    required this.lastTestedDate,
    required this.roomName,
  });

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  final String id;
  final String propertyId;
  final String name;
  final String modelName;
  final String serialNumber;
  final String? modelReference;
  final String? modelTypeId;
  final String locationId;
  final String? locationNickname;
  final String statusId;
  final String typeId;
  final DateTime installationDate;
  final List<DeviceIdentifier>? deviceIdentifiers;
  final bool? hidden;
  final int? lifetimeMonths;
  final List<Reading> readings = [];
  final List<Alert>? activeAlerts = [];
  final List<Alert>? resolvedAlerts = [];
  final List<Event>? events = [];
  final DateTime? replaceByDate;
  final double? lifePercentage;
  final double? batteryPercentage;
  final DateTime? lastTestedDate;
  final String? roomName;

  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}
