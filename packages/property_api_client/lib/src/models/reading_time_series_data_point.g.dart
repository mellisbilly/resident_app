// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_time_series_data_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadingTimeSeriesDataPoint _$ReadingTimeSeriesDataPointFromJson(
        Map<String, dynamic> json,) =>
    ReadingTimeSeriesDataPoint(
      propertyId: json['propertyId'] as String,
      propertyReference: json['propertyReference'] as String,
      deviceId: json['deviceId'] as String,
      bucketStart: DateTime.parse(json['bucketStart'] as String),
      bucketEnd: DateTime.parse(json['bucketEnd'] as String),
      readingYear: (json['readingYear'] as num).toInt(),
      readingMonth: (json['readingMonth'] as num).toInt(),
      readingDay: (json['readingDay'] as num).toInt(),
      readingHour: (json['readingHour'] as num).toInt(),
      value: (json['value'] as num).toDouble(),
      locationId: json['locationId'] as String,
      locationName: json['locationName'] as String,
      locationNickname: json['locationNickname'] as String,
      readingTypeId: json['readingTypeId'] as String,
      pointInTime: $enumDecode(_$PointInTimeEnumMap, json['pointInTime']),
    );

Map<String, dynamic> _$ReadingTimeSeriesDataPointToJson(
        ReadingTimeSeriesDataPoint instance,) =>
    <String, dynamic>{
      'propertyId': instance.propertyId,
      'propertyReference': instance.propertyReference,
      'deviceId': instance.deviceId,
      'bucketStart': instance.bucketStart.toIso8601String(),
      'bucketEnd': instance.bucketEnd.toIso8601String(),
      'readingYear': instance.readingYear,
      'readingMonth': instance.readingMonth,
      'readingDay': instance.readingDay,
      'readingHour': instance.readingHour,
      'value': instance.value,
      'locationId': instance.locationId,
      'locationName': instance.locationName,
      'locationNickname': instance.locationNickname,
      'readingTypeId': instance.readingTypeId,
      'pointInTime': _$PointInTimeEnumMap[instance.pointInTime],
    };

const _$PointInTimeEnumMap = {
  PointInTime.now: 'now',
  PointInTime.halfHour: 'halfHour',
  PointInTime.hour: 'hour',
  PointInTime.day: 'day',
  PointInTime.week: 'week',
  PointInTime.month: 'month',
};
