import 'package:flutter/material.dart';
import 'package:velolog/routes/app_router.dart';
import 'package:velolog/routes/app_router.gr.dart';
import 'package:velolog/screens/home_screen.dart';
import 'package:velolog/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Velolog',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
