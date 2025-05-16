import 'package:flutter/material.dart';
import 'package:velolog/models/models.dart';
import 'package:velolog/theme/app_theme.dart';
import 'package:intl/intl.dart';

class BikeCard extends StatelessWidget {
  final Bike bike;

  const BikeCard({Key? key, required this.bike}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Bike Image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/canyon_grizl.webp', // Replace with actual image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Gradient overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
            ),
          ),
          // Bike Info
          Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bike.name,
                  style: AppTheme.headingMedium.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  '${NumberFormat('#,##0.0').format(bike.totalDistance)} km total',
                  style: AppTheme.bodyMedium.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          // Task Overdue Badge
          if (bike.tasksOverdue > 0)
            Positioned(
              bottom: 16,
              right: 16,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.errorColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${bike.tasksOverdue} task overdue',
                      style: AppTheme.labelMedium.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
