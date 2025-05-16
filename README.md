# Velolog - Bicycle Maintenance Tracker

## Overview
Velolog is a Flutter application designed to help cyclists track their bike maintenance tasks, record rides, and monitor the overall status of their bicycles. The app features a clean, modern UI with intuitive navigation and comprehensive tracking capabilities.

## Features
- Bike status tracking with total distance
- Maintenance task management with due dates and status indicators
- Ride activity logging with distance and duration metrics
- Clean architecture implementation with BLoC/Cubit for state management

## Technical Specifications
- Flutter Version: 3.19.0
- Dart Version: 3.3.0
- Architecture: Clean Architecture with BLoC/Cubit
- Navigation: auto_route
- State Management: flutter_bloc

## Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.3
  bloc: ^8.1.2
  auto_route: ^7.8.4
  equatable: ^2.0.5
  intl: ^0.19.0
  google_fonts: ^6.1.0
  flutter_svg: ^2.0.9

dev_dependencies:
  flutter_test:
    sdk: flutter
  auto_route_generator: ^7.3.2
  build_runner: ^2.4.7
```

## Getting Started

### Prerequisites
- Flutter SDK (version 3.19.0 or higher)
- Dart SDK (version 3.3.0 or higher)
- Android Studio / VS Code with Flutter extensions

### Installation
1. Clone this repository
   ```
   git clone https://github.com/yourusername/velolog.git
   ```
2. Navigate to the project directory
   ```
   cd velolog
   ```
3. Install dependencies
   ```
   flutter pub get
   ```
4. Run the app
   ```
   flutter run
   ```

## Project Structure
```
lib/
  ├── data/
  │   └── mock_data.dart
  ├── models/
  │   └── models.dart
  ├── routes/
  │   ├── app_router.dart
  │   └── app_router.gr.dart
  ├── screens/
  │   └── home_screen.dart
  ├── theme/
  │   └── app_theme.dart
  ├── widgets/
  │   ├── activity_card.dart
  │   ├── bike_card.dart
  │   ├── bottom_nav_bar.dart
  │   └── maintenance_task_card.dart
  └── main.dart
```

## Creating and Pushing to GitHub Repository

To create a GitHub repository and push this project:

1. Create a new repository on GitHub through the web interface
2. Initialize git in the project folder (if not already initialized):
   ```
   git init
   ```
3. Add all files to git:
   ```
   git add .
   ```
4. Commit the changes:
   ```
   git commit -m "Initial commit"
   ```
5. Add the remote repository:
   ```
   git remote add origin https://github.com/yourusername/velolog.git
   ```
6. Push to GitHub:
   ```
   git push -u origin main
   ```

## License
This project is licensed under the MIT License.
