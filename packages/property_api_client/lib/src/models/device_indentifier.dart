import 'package:json_annotation/json_annotation.dart';

part 'device_indentifier.g.dart';

@JsonSerializable()
class DeviceIdentifier {
  DeviceIdentifier({
    required this.id,
    required this.modelId,
    required this.key,
    required this.regex,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DeviceIdentifier.fromJson(Map<String, dynamic> json) =>
      _$DeviceIdentifierFromJson(json);

  final String id;
  final int modelId;
  final String key;
  final String regex;
  final String value;
  final String createdAt;
  final String updatedAt;

  Map<String, dynamic> toJson() => _$DeviceIdentifierToJson(this);
}
