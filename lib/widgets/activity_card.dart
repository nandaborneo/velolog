import 'package:flutter/material.dart';
import 'package:velolog/models/models.dart';
import 'package:velolog/theme/app_theme.dart';
import 'package:intl/intl.dart';

class ActivityCard extends StatelessWidget {
  final Ride ride;

  const ActivityCard({Key? key, required this.ride}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Activity Icon
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFFFF3EF),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.directions_bike,
                color: Color(0xFFFF5722), // Orange color for activity icon
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            // Activity Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ride.title,
                    style: AppTheme.labelLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('MMM dd, yyyy').format(ride.date),
                    style: AppTheme.bodySmall,
                  ),
                ],
              ),
            ),
            // Distance and Duration
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${ride.distance.toStringAsFixed(1)} km',
                  style: AppTheme.labelLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  _formatDuration(ride.duration),
                  style: AppTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours}h ${minutes}m';
  }
}
