class SummaryStats {
  const SummaryStats({
    required this.tapped,
    required this.missing,
    required this.criticalAlerts,
  });

  final int tapped;
  final int missing;
  final int criticalAlerts;

  factory SummaryStats.fromJson(Map<String, dynamic> json) {
    int parseInt(dynamic value) {
      if (value is int) return value;
      if (value is num) return value.toInt();
      return int.tryParse(value?.toString() ?? '') ?? 0;
    }

    return SummaryStats(
      tapped: parseInt(json['tapped']),
      missing: parseInt(json['missing']),
      criticalAlerts: parseInt(json['criticalAlerts']),
    );
  }
}

