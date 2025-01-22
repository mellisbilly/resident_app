import 'package:json_annotation/json_annotation.dart';

part 'alert.g.dart';

@JsonSerializable()
class Alert {
  Alert({
    required this.id,
    required this.title,
    required this.description,
    required this.raisedDate,
    required this.value,
    required this.valueUnitId,
    required this.eventId,
    required this.eventTypeId,
    required this.typeId,
    required this.statusId,
    required this.deviceId,
    required this.modelTypeReference,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);

  final String id;
  final String title;
  final String description;
  final DateTime raisedDate;
  final String? value;
  final String? valueUnitId;
  final String eventId;
  final String eventTypeId;
  final String typeId;
  final String statusId;
  final String? deviceId;
  final String? modelTypeReference;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String> months = [
    'January',
    'Febuary',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  Map<String, dynamic> toJson() => _$AlertToJson(this);
}
