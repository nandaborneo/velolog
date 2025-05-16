import 'package:equatable/equatable.dart';

class Bike extends Equatable {
  final String id;
  final String name;
  final String brand;
  final String model;
  final double totalDistance;
  final String imageUrl;
  final int tasksOverdue;

  const Bike({
    required this.id,
    required this.name,
    required this.brand,
    required this.model,
    required this.totalDistance,
    required this.imageUrl,
    required this.tasksOverdue,
  });

  @override
  List<Object?> get props =>
      [id, name, brand, model, totalDistance, imageUrl, tasksOverdue];
}

enum TaskStatus { upcoming, overdue, completed }

class MaintenanceTask extends Equatable {
  final String id;
  final String bikeId;
  final String title;
  final TaskStatus status;
  final DateTime dueDate;
  final int dueInKm;

  const MaintenanceTask({
    required this.id,
    required this.bikeId,
    required this.title,
    required this.status,
    required this.dueDate,
    required this.dueInKm,
  });

  bool get isOverdue => status == TaskStatus.overdue;

  String get dueText {
    if (status == TaskStatus.overdue) {
      final days = DateTime.now().difference(dueDate).inDays;
      return '$days days overdue';
    } else if (dueInKm > 0) {
      return 'in $dueInKm km';
    } else {
      return 'Upcoming';
    }
  }

  @override
  List<Object?> get props => [id, bikeId, title, status, dueDate, dueInKm];
}

class Ride extends Equatable {
  final String id;
  final String bikeId;
  final String title;
  final DateTime date;
  final double distance;
  final Duration duration;

  const Ride({
    required this.id,
    required this.bikeId,
    required this.title,
    required this.date,
    required this.distance,
    required this.duration,
  });

  @override
  List<Object?> get props => [id, bikeId, title, date, distance, duration];
}
