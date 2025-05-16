import 'package:flutter/material.dart';
import 'package:velolog/models/models.dart';
import 'package:velolog/theme/app_theme.dart';

class MaintenanceTaskCard extends StatelessWidget {
  final MaintenanceTask task;

  const MaintenanceTaskCard({Key? key, required this.task}) : super(key: key);

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
            // Task Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: task.isOverdue
                    ? AppTheme.overdueBgColor
                    : AppTheme.backgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getIconForTask(task.title),
                color: task.isOverdue
                    ? AppTheme.overdueTextColor
                    : AppTheme.primaryColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            // Task Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: AppTheme.labelLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    task.isOverdue
                        ? '${task.dueText}'
                        : 'in ${task.dueInKm} km',
                    style: AppTheme.bodySmall.copyWith(
                      color: task.isOverdue
                          ? AppTheme.overdueTextColor
                          : AppTheme.textSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            // Checkmark
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppTheme.backgroundColor,
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.dividerColor),
              ),
              child: const Icon(
                Icons.check,
                color: AppTheme.successColor,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForTask(String taskTitle) {
    if (taskTitle.toLowerCase().contains('chain')) {
      return Icons.link;
    } else if (taskTitle.toLowerCase().contains('tire') ||
        taskTitle.toLowerCase().contains('pressure')) {
      return Icons.tire_repair;
    } else {
      return Icons.build;
    }
  }
}
