import 'package:velolog/models/models.dart';

class MockDataProvider {
  // Mock Bike Data
  static final Bike canyonBike = Bike(
    id: '1',
    name: 'Canyon Grizl 7',
    brand: 'Canyon',
    model: 'Grizl 7',
    totalDistance: 2453.0,
    imageUrl:
        'assets/images/canyon_grizl.png', // This would be replaced with actual image
    tasksOverdue: 1,
  );

  static final List<Bike> bikes = [canyonBike];

  // Mock Maintenance Tasks
  static final List<MaintenanceTask> maintenanceTasks = [
    MaintenanceTask(
      id: '1',
      bikeId: '1',
      title: 'Lube Chain – Canyon',
      status: TaskStatus.overdue,
      dueDate: DateTime.now().subtract(const Duration(days: 3)),
      dueInKm: 0,
    ),
    MaintenanceTask(
      id: '2',
      bikeId: '1',
      title: 'Check Tire Pressure – Canyon',
      status: TaskStatus.upcoming,
      dueDate: DateTime.now().add(const Duration(days: 2)),
      dueInKm: 45,
    ),
  ];

  // Mock Ride Data
  static final List<Ride> rides = [
    Ride(
      id: '1',
      bikeId: '1',
      title: 'Morning Ride',
      date: DateTime(2025, 3, 15),
      distance: 45.2,
      duration: const Duration(hours: 2, minutes: 15),
    ),
    Ride(
      id: '2',
      bikeId: '1',
      title: 'Weekend Long Ride',
      date: DateTime(2025, 3, 12),
      distance: 85.7,
      duration: const Duration(hours: 4, minutes: 30),
    ),
  ];

  // Get bike by ID
  static Bike getBikeById(String id) {
    return bikes.firstWhere((bike) => bike.id == id, orElse: () => bikes.first);
  }

  // Get maintenance tasks for a bike
  static List<MaintenanceTask> getTasksForBike(String bikeId) {
    return maintenanceTasks.where((task) => task.bikeId == bikeId).toList();
  }

  // Get rides for a bike
  static List<Ride> getRidesForBike(String bikeId) {
    return rides.where((ride) => ride.bikeId == bikeId).toList();
  }
}
