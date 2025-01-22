// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alert _$AlertFromJson(Map<String, dynamic> json) => Alert(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      raisedDate: DateTime.parse(json['raisedDate'] as String),
      value: json['value'] as String?,
      valueUnitId: json['valueUnitId'] as String?,
      eventId: json['eventId'] as String,
      eventTypeId: json['eventTypeId'] as String,
      typeId: json['typeId'] as String,
      statusId: json['statusId'] as String,
      deviceId: json['deviceId'] as String?,
      modelTypeReference: json['modelTypeReference'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AlertToJson(Alert instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'raisedDate': instance.raisedDate.toIso8601String(),
      'value': instance.value,
      'valueUnitId': instance.valueUnitId,
      'eventId': instance.eventId,
      'eventTypeId': instance.eventTypeId,
      'typeId': instance.typeId,
      'statusId': instance.statusId,
      'deviceId': instance.deviceId,
      'modelTypeReference': instance.modelTypeReference,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
