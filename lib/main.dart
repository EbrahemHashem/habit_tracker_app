import 'package:flutter/material.dart';
import 'package:habit_tracker_app/views/sign_in_view.dart';

void main() {
  runApp(const HabitTrackerApp());
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Color.fromARGB(251, 251, 251, 255),
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
