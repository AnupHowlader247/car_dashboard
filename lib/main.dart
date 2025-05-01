import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(CarDashboardApp());
}

class CarDashboardApp extends StatelessWidget {
  const CarDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CarDashboardPage(), // Start the app with CarDashboardPage from home.dart

    );
  }
}

