import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:velolog/data/mock_data.dart';
import 'package:velolog/models/models.dart';
import 'package:velolog/theme/app_theme.dart';
import 'package:velolog/widgets/activity_card.dart';
import 'package:velolog/widgets/bike_card.dart';
import 'package:velolog/widgets/bottom_nav_bar.dart';
import 'package:velolog/widgets/maintenance_task_card.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final Bike _currentBike = MockDataProvider.bikes.first;
  late List<MaintenanceTask> _tasks;
  late List<Ride> _rides;

  @override
  void initState() {
    super.initState();
    _tasks = MockDataProvider.getTasksForBike(_currentBike.id);
    _rides = MockDataProvider.getRidesForBike(_currentBike.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Velolog'),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/canyon_grizl.webp'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bike Card
              BikeCard(bike: _currentBike),
              const SizedBox(height: 24),

              // Next Maintenance Section
              _buildSectionHeader('Next Maintenance', 'View All'),
              const SizedBox(height: 16),
              ..._tasks.map((task) => MaintenanceTaskCard(task: task)).toList(),
              const SizedBox(height: 24),

              // Recent Activity Section
              _buildSectionHeader('Recent Activity', 'View All'),
              const SizedBox(height: 16),
              ..._rides.map((ride) => ActivityCard(ride: ride)).toList(),
              const SizedBox(height: 80), // Space for bottom nav
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTheme.headingSmall,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            actionText,
            style: AppTheme.labelMedium.copyWith(
              color: AppTheme.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
