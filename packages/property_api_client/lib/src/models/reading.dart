import 'package:json_annotation/json_annotation.dart';

part 'reading.g.dart';

@JsonSerializable()
class Reading {
  Reading({
    required this.id,
    required this.deviceId,
    required this.value,
    required this.readingTypeId,
    required this.readingDate,
    required this.collectionDate,
    required this.createdAt,
    required this.pointInTime,
  });

  factory Reading.fromJson(Map<String, dynamic> json) =>
      _$ReadingFromJson(json);

  final String id;
  final String deviceId;
  final String value;
  final String readingTypeId;
  final DateTime readingDate;
  final DateTime collectionDate;
  final DateTime createdAt;
  final String? pointInTime;

  Map<String, dynamic> toJson() => _$ReadingToJson(this);
}
