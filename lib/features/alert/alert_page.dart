import 'package:flutter/material.dart';
import 'package:save_me/core/models/alert_notification.dart';
import 'package:save_me/core/models/summary_stats.dart';
import 'package:save_me/core/services/api_service.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({super.key});

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  final ApiService _apiService = ApiService();

  late Future<_AlertData> _future;

  @override
  void initState() {
    super.initState();
    _future = _loadData();
  }

  Future<_AlertData> _loadData() async {
    final notifications = await _apiService.fetchNotifications();
    final summary = await _apiService.fetchSummary();
    return _AlertData(
      notifications: notifications,
      summary: summary,
    );
  }

  @override
  void dispose() {
    _apiService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flood Alerts'),
      ),
      body: FutureBuilder<_AlertData>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            final message = snapshot.error is ApiException
                ? (snapshot.error as ApiException).message
                : 'Failed to load alerts';
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 40,
                      color: Colors.redAccent,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _future = _loadData();
                        });
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          final data = snapshot.data!;
          final notifications = data.notifications;
          final summary = data.summary;

          if (notifications.isEmpty) {
            return const Center(
              child: Text('No active flood alerts right now.'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: notifications.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _SummaryHeader(summary: summary);
              }
              final notification = notifications[index - 1];
              return _AlertCard(notification: notification);
            },
          );
        },
      ),
    );
  }
}

class _AlertData {
  _AlertData({
    required this.notifications,
    required this.summary,
  });

  final List<AlertNotification> notifications;
  final SummaryStats summary;
}

class _SummaryHeader extends StatelessWidget {
  const _SummaryHeader({required this.summary});

  final SummaryStats summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Current Status',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _SummaryChip(
              label: 'Verified',
              value: summary.tapped,
              color: Colors.green.shade600,
            ),
            const SizedBox(width: 8),
            _SummaryChip(
              label: 'Unverified',
              value: summary.missing,
              color: Colors.orange.shade700,
            ),
            const SizedBox(width: 8),
            _SummaryChip(
              label: 'Critical',
              value: summary.criticalAlerts,
              color: Colors.red.shade700,
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _SummaryChip extends StatelessWidget {
  const _SummaryChip({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final int value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: color.withOpacity(0.08),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: color,
            child: Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 11,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _AlertCard extends StatelessWidget {
  const _AlertCard({required this.notification});

  final AlertNotification notification;

  Color _severityColor() {
    final level = notification.severity.toLowerCase();
    if (level.contains('high') || level.contains('severe')) {
      return Colors.red.shade700;
    }
    if (level.contains('medium') || level.contains('moderate')) {
      return Colors.orange.shade700;
    }
    if (level.contains('low') || level.contains('minor')) {
      return Colors.green.shade700;
    }
    return Colors.blueGrey.shade600;
  }

  @override
  Widget build(BuildContext context) {
    final color = _severityColor();
    final location = notification.location;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    notification.incidentLabel,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  notification.severityLabel,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (location != null && location.hasValidCoordinates)
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${location.latitude.toStringAsFixed(4)}, '
                    '${location.longitude.toStringAsFixed(4)}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            if (location != null && location.hasValidCoordinates)
              const SizedBox(height: 8),
            Text(
              notification.comments.isEmpty
                  ? 'No additional description.'
                  : notification.comments,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.people_outline,
                  size: 14,
                  color: Colors.grey,
                ),
                const SizedBox(width: 4),
                Text(
                  '${notification.affectedPeople} people '
                  '(${notification.affectedChildren} children, '
                  '${notification.affectedAdults} adults)',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            if (notification.waterLevel != null) ...[
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.water_drop_outlined,
                    size: 14,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Water level: ${notification.waterLevel!.toStringAsFixed(1)} m',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reported by ${notification.reporterName}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                if (notification.roadBlocked)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'ROAD BLOCKED',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.red.shade700,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

