import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyHabitTile extends StatelessWidget {
  const MyHabitTile({super.key, required this.isCompleted, required this.text, this.onChanged, this.editHabit, this.deleteHabit});
  final bool isCompleted;
  final String text;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? editHabit;
  final void Function(BuildContext)? deleteHabit;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          // edit option
          SlidableAction(
            onPressed: editHabit,
            backgroundColor: Colors.grey.shade800,
            icon: Icons.settings,
            borderRadius: BorderRadius.circular(8),
          ),
          // delete option
          SlidableAction(
            onPressed: deleteHabit,
            backgroundColor: Colors.red,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(8),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          if (onChanged != null) {
            onChanged!(!isCompleted);
          }
        },
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
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
            )),
      ),
    );
  }
}
