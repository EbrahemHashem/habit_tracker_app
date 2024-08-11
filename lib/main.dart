import 'package:flutter/material.dart';
import 'package:habit_tracker_app/database/habit_database.dart';
import 'package:habit_tracker_app/views/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize database
  await HabitDatabase.initialize();
  await HabitDatabase.saveFirstLaunchData();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HabitDatabase()),
      ],
      child: const HabitTrackerApp(),
    ),
  );
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Color.fromARGB(251, 251, 251, 255),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
