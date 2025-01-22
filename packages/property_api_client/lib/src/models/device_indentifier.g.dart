// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_indentifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceIdentifier _$DeviceIdentifierFromJson(Map<String, dynamic> json) =>
    DeviceIdentifier(
      id: json['id'] as String,
      modelId: (json['modelId'] as num).toInt(),
      key: json['key'] as String,
      regex: json['regex'] as String,
      value: json['value'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$DeviceIdentifierToJson(DeviceIdentifier instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modelId': instance.modelId,
      'key': instance.key,
      'regex': instance.regex,
      'value': instance.value,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
