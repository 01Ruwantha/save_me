import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/app_config.dart';
import '../models/alert_notification.dart';
import '../models/location_point.dart';
import '../models/summary_stats.dart';

class ApiException implements Exception {
  ApiException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => 'ApiException($statusCode): $message';
}

class ApiService {
  ApiService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Future<List<AlertNotification>> fetchNotifications() async {
    final response = await _client.get(
      AppConfig.buildUri('/api/notifications'),
    );

    final body = _decodeResponse(response);
    if (body is List) {
      return body
          .whereType<Map<String, dynamic>>()
          .map(AlertNotification.fromJson)
          .toList();
    }

    throw ApiException('Unexpected notifications response shape');
  }

  Future<SummaryStats> fetchSummary() async {
    final response = await _client.get(
      AppConfig.buildUri('/api/notifications/summary'),
    );

    final body = _decodeResponse(response);
    if (body is Map<String, dynamic>) {
      return SummaryStats.fromJson(body);
    }
    throw ApiException('Unexpected summary response shape');
  }

  Future<List<LocationPoint>> fetchLocations() async {
    final response = await _client.get(
      AppConfig.buildUri('/api/locations'),
    );

    final body = _decodeResponse(response);
    if (body is List) {
      return body
          .whereType<Map<String, dynamic>>()
          .map(LocationPoint.fromJson)
          .toList();
    }
    throw ApiException('Unexpected locations response shape');
  }

  dynamic _decodeResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) return null;
      return jsonDecode(response.body);
    }

    throw ApiException(
      'Request failed with status ${response.statusCode}',
      statusCode: response.statusCode,
    );
  }

  void dispose() {
    _client.close();
  }
}

