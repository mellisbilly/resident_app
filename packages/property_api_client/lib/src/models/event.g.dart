// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      eventTypeId: json['eventTypeId'] as String,
      eventCategoryId: json['eventCategoryId'] as String,
      eventTypeName: json['eventTypeName'] as String,
      propertyId: json['propertyId'] as String?,
      deviceId: json['deviceId'] as String?,
      alertId: json['alertId'] as String?,
      eventTypeDescription: json['eventTypeDescription'] as String?,
      raisedDate: DateTime.parse(json['raisedDate'] as String),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'eventTypeId': instance.eventTypeId,
      'eventCategoryId': instance.eventCategoryId,
      'eventTypeName': instance.eventTypeName,
      'propertyId': instance.propertyId,
      'deviceId': instance.deviceId,
      'alertId': instance.alertId,
      'eventTypeDescription': instance.eventTypeDescription,
      'raisedDate': instance.raisedDate.toIso8601String(),
    };
