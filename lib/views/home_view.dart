import 'package:flutter/material.dart';
import 'package:habit_tracker_app/database/habit_database.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:habit_tracker_app/util/habit_util.dart';
import 'package:habit_tracker_app/widgets/my_habit_tile.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Provider.of<HabitDatabase>(context, listen: false).readHabits();
    super.initState();
  }

  final TextEditingController textController = TextEditingController();

  // create new habit
  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: "Create a new habit",
          ),
        ),
        actions: [
          // save button
          MaterialButton(
            onPressed: () {
              //get the new habit name
              String newHabitName = textController.text;

              // save to database
              context.read<HabitDatabase>().addHabit(newHabitName);
              // pop  box
              Navigator.pop(context);
              // clear controller
              textController.clear();
            },
            child: const Text('Save'),
          ),
          MaterialButton(
            onPressed: () {
              // pop box
              Navigator.pop(context);
              // clear controller
              textController.clear();
            },
            child: const Text('Cancel'),
          )
        ],
      ),
    );
  }

// check habit on && off
  void checkHabitOnOff(bool? value, Habit habit) {
    if (value != null) {
      context.read<HabitDatabase>().updateHabitCompletion(habit.id, value);
    }
  }

  // edit habit box
  void editHabitBox(Habit habit) {
    textController.text = habit.name;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          // save button
          MaterialButton(
            onPressed: () {
              //get the new habit name
              String newHabitName = textController.text;

              // save to database
              context.read<HabitDatabase>().updateHabitName(habit.id, newHabitName);
              // pop  box
              Navigator.pop(context);
              // clear controller
              textController.clear();
            },
            child: const Text('Save'),
          ),
          MaterialButton(
            onPressed: () {
              // pop box
              Navigator.pop(context);
              // clear controller
              textController.clear();
            },
            child: const Text('Cancel'),
          )
        ],
      ),
    );
  }

  // delete habit box
  void deleteHabitBox(Habit habit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are You sure you want to delete ?'),
        actions: [
          // delete button
          MaterialButton(
            onPressed: () {
              // save to database
              context.read<HabitDatabase>().deleteHabit(habit.id);
              // pop  box
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
          MaterialButton(
            onPressed: () {
              // pop box
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        onPressed: createNewHabit,
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 30,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _buildHabitList(),
    );
  }

  Widget _buildHabitList() {
    // habit database
    final habitDatabase = context.watch<HabitDatabase>();
    // current habits
    List<Habit> currentHabits = habitDatabase.currentHabits;
    // return list of habits ui
    return ListView.builder(
      itemCount: currentHabits.length,
      itemBuilder: (context, index) {
        final habit = currentHabits[index];
        bool isCompletedToday = isHabitCompletedToday(habit.completedDays);

        return MyHabitTile(
          isCompleted: isCompletedToday,
          text: habit.name,
          onChanged: (value) => checkHabitOnOff(value, habit),
          editHabit: (context) => editHabitBox(habit),
          deleteHabit: (contexr) => deleteHabitBox(habit),
        );
      },
    );
  }
}
