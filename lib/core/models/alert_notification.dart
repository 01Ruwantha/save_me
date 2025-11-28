import 'location_point.dart';

class AlertNotification {
  AlertNotification({
    required this.id,
    required this.incidentType,
    required this.severity,
    required this.roadBlocked,
    required this.incidentTime,
    required this.affectedPeople,
    required this.affectedChildren,
    required this.affectedAdults,
    required this.comments,
    required this.waterLevel,
    required this.trueReports,
    required this.spamReports,
    required this.reporterName,
    required this.reporterPhone,
    required this.location,
    required this.photoUrls,
  });

  final int id;
  final String incidentType;
  final String severity;
  final bool roadBlocked;
  final DateTime? incidentTime;
  final int affectedPeople;
  final int affectedChildren;
  final int affectedAdults;
  final String comments;
  final double? waterLevel;
  final int trueReports;
  final int spamReports;
  final String reporterName;
  final String reporterPhone;
  final LocationPoint? location;
  final List<String> photoUrls;

  factory AlertNotification.fromJson(Map<String, dynamic> json) {
    int parseInt(dynamic value) {
      if (value is int) return value;
      if (value is num) return value.toInt();
      return int.tryParse(value?.toString() ?? '') ?? 0;
    }

    double? parseDouble(dynamic value) {
      if (value == null) return null;
      if (value is num) return value.toDouble();
      return double.tryParse(value.toString());
    }

    bool parseBool(dynamic value) {
      if (value is bool) return value;
      if (value is num) return value != 0;
      return value?.toString().toLowerCase() == 'true';
    }

    DateTime? parseDate(dynamic value) {
      if (value is DateTime) return value;
      if (value is String && value.isNotEmpty) {
        return DateTime.tryParse(value);
      }
      return null;
    }

    String? _photoUrl(dynamic item) {
      if (item is String) return item;
      if (item is Map<String, dynamic>) {
        return item['url']?.toString();
      }
      return null;
    }

    final reporter = json['reporter'] as Map<String, dynamic>?;
    final locationJson = json['location'];

    return AlertNotification(
      id: parseInt(json['id']),
      incidentType: (json['incidentType'] ??
              json['type'] ??
              json['incident_type'] ??
              '')
          .toString(),
      severity: (json['severity'] ?? '').toString(),
      roadBlocked: parseBool(json['roadBlocked'] ?? json['isRoadBlocked']),
      incidentTime: parseDate(json['incidentTime'] ?? json['createdAt']),
      affectedPeople: parseInt(json['affectedPeople']),
      affectedChildren: parseInt(json['affectedChildren']),
      affectedAdults: parseInt(json['affectedAdults']),
      comments: (json['comments'] ?? '').toString(),
      waterLevel: parseDouble(json['waterLevel']),
      trueReports: parseInt(json['trueReports']),
      spamReports: parseInt(json['spamReports']),
      reporterName: (reporter?['name'] ??
              json['reporterName'] ??
              reporter?['fullName'] ??
              'Unknown')
          .toString(),
      reporterPhone:
          (reporter?['phoneNumber'] ?? json['reporterPhone'] ?? '').toString(),
      location: locationJson is Map<String, dynamic>
          ? LocationPoint.fromJson(locationJson)
          : null,
      photoUrls: (json['photos'] as List?)
              ?.map(_photoUrl)
              .whereType<String>()
              .toList() ??
          const [],
    );
  }

  bool get hasValidLocation => location?.hasValidCoordinates ?? false;

  String get severityLabel =>
      severity.isEmpty ? 'Unknown' : severity.toUpperCase();

  String get incidentLabel =>
      incidentType.isEmpty ? 'Unknown' : incidentType.toUpperCase();
}

