import 'package:flutter/material.dart';

class MyHabitTile extends StatelessWidget {
  const MyHabitTile({super.key, required this.isCompleted, required this.text, this.onChanged});
  final bool isCompleted;
  final String text;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 25,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isCompleted ? Colors.green : Colors.orange,
        ),
        child: ListTile(
          title: Text(text),
          leading: Checkbox(value: isCompleted, onChanged: onChanged),
        ));
  }
}
