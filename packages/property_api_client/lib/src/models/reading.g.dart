// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reading _$ReadingFromJson(Map<String, dynamic> json) => Reading(
      id: json['id'] as String,
      deviceId: json['deviceId'] as String,
      value: json['value'] as String,
      readingTypeId: json['readingTypeId'] as String,
      readingDate: DateTime.parse(json['readingDate'] as String),
      collectionDate: DateTime.parse(json['collectionDate'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      pointInTime: json['pointInTime'] as String?,
    );

Map<String, dynamic> _$ReadingToJson(Reading instance) => <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'value': instance.value,
      'readingTypeId': instance.readingTypeId,
      'readingDate': instance.readingDate.toIso8601String(),
      'collectionDate': instance.collectionDate.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'pointInTime': instance.pointInTime,
    };
