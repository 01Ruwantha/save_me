class LocationPoint {
  const LocationPoint({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  factory LocationPoint.fromJson(Map<String, dynamic> json) {
    double parse(dynamic value) {
      if (value is num) {
        return value.toDouble();
      }
      return double.tryParse(value?.toString() ?? '') ?? 0;
    }

    return LocationPoint(
      latitude: parse(json['latitude'] ?? json['lat']),
      longitude: parse(json['longitude'] ?? json['lng']),
    );
  }

  bool get hasValidCoordinates =>
      latitude.abs() > 0 && longitude.abs() > 0;
}

