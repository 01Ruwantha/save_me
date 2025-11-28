import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:save_me/core/models/alert_notification.dart';
import 'package:save_me/core/services/api_service.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const CameraPosition _defaultCamera = CameraPosition(
    target: LatLng(
      7.8731,
      80.7718,
    ), // Center of Sri Lanka as a sensible default
    zoom: 7,
  );

  final ApiService _apiService = ApiService();

  Set<Marker> _markers = {};
  bool _loading = true;
  String? _error;
  CameraPosition _initialCamera = _defaultCamera;

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    try {
      final List<AlertNotification> notifications = await _apiService
          .fetchNotifications();

      final validNotifications = notifications
          .where((n) => n.hasValidLocation)
          .toList();

      final markers = validNotifications
          .map(
            (n) => Marker(
              markerId: MarkerId(n.id.toString()),
              position: LatLng(n.location!.latitude, n.location!.longitude),
              infoWindow: InfoWindow(
                title: n.incidentLabel,
                snippet:
                    '${n.severityLabel} • ${n.affectedPeople} people affected',
              ),
            ),
          )
          .toSet();

      CameraPosition camera = _defaultCamera;
      if (validNotifications.isNotEmpty) {
        final first = validNotifications.first.location!;
        camera = CameraPosition(
          target: LatLng(first.latitude, first.longitude),
          zoom: 12,
        );
      }

      if (!mounted) return;
      setState(() {
        _markers = markers;
        _initialCamera = camera;
        _loading = false;
        _error = null;
      });
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = e.message;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = 'Failed to load map data';
      });
    }
  }

  @override
  void dispose() {
    _apiService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flood Alerts Map'), elevation: 0),
      body: (Platform.isAndroid || Platform.isIOS)
          ? Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: _initialCamera,
                  markers: _markers,
                  myLocationButtonEnabled: true,
                  compassEnabled: true,
                ),
                if (_loading)
                  const Positioned.fill(
                    child: IgnorePointer(
                      ignoring: true,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
                if (_error != null && !_loading)
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: Card(
                      color: Colors.red.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.redAccent,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _error ?? 'Failed to load data',
                                style: const TextStyle(color: Colors.redAccent),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            )
          : const Center(
              child: Text('Maps are only available on mobile devices'),
            ),
    );
  }
}
