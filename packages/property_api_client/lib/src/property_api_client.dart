import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:property_api_client/property_api_client.dart';
import 'package:property_api_client/src/models/reading_time_series_data_point.dart';

/// {@template property_api_client}
/// Property package
/// {@endtemplate}
class PropertyApiClient {
  /// {@macro property_api_client}
  PropertyApiClient({
    http.Client? httpClient,
    String? userToken,
    String? baseUrl,
    String? propertyReference,
  })  : _httpClient = httpClient ?? http.Client(),
        _userToken = userToken ?? '',
        _baseUrl = baseUrl ?? '',
        _propertyReference = propertyReference ?? '';

  final http.Client _httpClient;
  final String _userToken;
  final String _baseUrl;
  final String _propertyReference;

  Future<List<ReadingTimeSeriesDataPoint>> getReadingTimeSeries(
    AggregationType aggregationType,
    int numberOfDays, {
    Granularity? granularity,
    int? units,
    String? readingTypeId,
    String? groupBy,
    bool onlyUseDates = true,
  }) async {
    // Current date and time
    final now = DateTime.now();

    // Calculate start time by subtracting numberOfDays
    final startTime = now.subtract(Duration(days: numberOfDays));

    final formatter = DateFormat('yyyy-MM-ddTHH:mm:ss');

    final start = formatter.format(startTime);
    final end = formatter.format(now);

    final aggregate = aggregationTypeMap[aggregationType]!;

    var url =
        '$_baseUrl/service/property$_propertyReference/timeseries?start=$start&end=$end&agg=$aggregate&groupBy=${groupBy ?? 'device'}';

    if (granularity != null) {
      url = '$url&interval=${granularityTypeMap[granularity]}';
    }

    if (readingTypeId != null) {
      url = '$url&type=$readingTypeId';
    }

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'bearer $_userToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) return [];

    final readingDataPoints = (json.decode(response.body) as List)
        .map(
          (dataPoint) => ReadingTimeSeriesDataPoint.fromJson(
            dataPoint as Map<String, dynamic>,
          ),
        )
        .toList();

    return readingDataPoints;
  }

  Future<List<Device>> getDevices({
    bool? withLatestReading = false,
    bool? withAlerts = false,
    bool? withEvents = false,
  }) async {
    final url =
        '$_baseUrl/service/property/$_propertyReference/devices?withAlerts=$withAlerts&withEvents=$withEvents&active=true';

    final response = await _httpClient.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'bearer $_userToken',
        'Content-Type': 'application/json',
      },
    );

    final responseCode = response.statusCode;
    if (responseCode == 204) {
      return [];
    }

    if (responseCode != 200 && !response.body.contains('Address not found')) {
      throw Exception('Failed to get Model Api Response: ${response.body}');
    }

    final devices = (json.decode(response.body) as List)
        .map((device) => Device.fromJson(device as Map<String, dynamic>))
        .toList();

    return devices;
  }
}
