import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
          MaterialButton(onPressed: () {})
          //get the new habit name
          // save to database
          // pop hte box
          // clear controller
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
      appBar: AppBar(),
      body: Container(),
    );
  }
}
