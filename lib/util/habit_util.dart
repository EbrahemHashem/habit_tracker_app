bool isHabitCompletedToday(List<DateTime> completedDays) {
  final today = DateTime.now();
  return completedDays.any(
    (data) => data.year == today.year && data.month == today.month && data.day == today.day,
  );
}
