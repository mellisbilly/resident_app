import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.eventTypeId,
    required this.eventCategoryId,
    required this.eventTypeName,
    required this.propertyId,
    required this.deviceId,
    required this.alertId,
    required this.eventTypeDescription,
    required this.raisedDate,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  final String id;
  final String name;
  final String description;
  final String eventTypeId;
  final String eventCategoryId;
  final String eventTypeName;
  final String? propertyId;
  final String? deviceId;
  final String? alertId;
  final String? eventTypeDescription;
  final DateTime raisedDate;
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

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
