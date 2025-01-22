// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
      id: json['id'] as String,
      propertyId: json['propertyId'] as String,
      name: json['name'] as String,
      modelName: json['modelName'] as String,
      serialNumber: json['serialNumber'] as String,
      modelReference: json['modelReference'] as String?,
      modelTypeId: json['modelTypeId'] as String?,
      locationId: json['locationId'] as String,
      locationNickname: json['locationNickname'] as String?,
      statusId: json['statusId'] as String,
      typeId: json['typeId'] as String,
      installationDate: DateTime.parse(json['installationDate'] as String),
      deviceIdentifiers: (json['deviceIdentifiers'] as List<dynamic>?)
          ?.map((e) => DeviceIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      hidden: json['hidden'] as bool?,
      lifetimeMonths: (json['lifetimeMonths'] as num?)?.toInt(),
      replaceByDate: json['replaceByDate'] == null
          ? null
          : DateTime.parse(json['replaceByDate'] as String),
      lifePercentage: (json['lifePercentage'] as num?)?.toDouble(),
      batteryPercentage: (json['batteryPercentage'] as num?)?.toDouble(),
      lastTestedDate: json['lastTestedDate'] == null
          ? null
          : DateTime.parse(json['lastTestedDate'] as String),
      roomName: json['roomName'] as String?,
    );

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'id': instance.id,
      'propertyId': instance.propertyId,
      'name': instance.name,
      'modelName': instance.modelName,
      'serialNumber': instance.serialNumber,
      'modelReference': instance.modelReference,
      'modelTypeId': instance.modelTypeId,
      'locationId': instance.locationId,
      'locationNickname': instance.locationNickname,
      'statusId': instance.statusId,
      'typeId': instance.typeId,
      'installationDate': instance.installationDate.toIso8601String(),
      'deviceIdentifiers': instance.deviceIdentifiers,
      'hidden': instance.hidden,
      'lifetimeMonths': instance.lifetimeMonths,
      'replaceByDate': instance.replaceByDate?.toIso8601String(),
      'lifePercentage': instance.lifePercentage,
      'batteryPercentage': instance.batteryPercentage,
      'lastTestedDate': instance.lastTestedDate?.toIso8601String(),
      'roomName': instance.roomName,
    };
