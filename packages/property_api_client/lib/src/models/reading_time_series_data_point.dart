import 'package:json_annotation/json_annotation.dart';

part 'reading_time_series_data_point.g.dart';

enum PointInTime { now, halfHour, hour, day, week, month }

enum AggregationType { minimum, average, maximum, sum }

enum Granularity { hour, day, month }


Map<AggregationType, String> aggregationTypeMap = {
  AggregationType.minimum: 'min',
  AggregationType.average: 'avg',
  AggregationType.maximum: 'max',
  AggregationType.sum: 'sum',
};

Map<Granularity, String> granularityTypeMap = {
  Granularity.hour: 'hour',
  Granularity.day: 'day',
  Granularity.month: 'month',
};


@JsonSerializable()
class ReadingTimeSeriesDataPoint {
  ReadingTimeSeriesDataPoint({
    required this.propertyId,
    required this.propertyReference,
    required this.deviceId,
    required this.bucketStart,
    required this.bucketEnd,
    required this.readingYear,
    required this.readingMonth,
    required this.readingDay,
    required this.readingHour,
    required this.value,
    required this.locationId,
    required this.locationName,
    required this.locationNickname,
    required this.readingTypeId,
    required this.pointInTime,
  });

  factory ReadingTimeSeriesDataPoint.fromJson(Map<String, dynamic> json) =>
      _$ReadingTimeSeriesDataPointFromJson(json);

  final String propertyId;
  final String propertyReference;
  final String deviceId;
  final DateTime bucketStart;
  final DateTime bucketEnd;
  final int readingYear;
  final int readingMonth;
  final int readingDay;
  final int readingHour;
  final double value;
  final String locationId;
  final String locationName;
  final String locationNickname;
  final AggregationType aggregationType = AggregationType.average;
  final int days = 1;
  final String readingTypeId;
  final PointInTime pointInTime;

  Map<String, dynamic> toJson() => _$ReadingTimeSeriesDataPointToJson(this);
}
