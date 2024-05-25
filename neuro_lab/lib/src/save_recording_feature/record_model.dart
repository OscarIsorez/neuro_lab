class RecordModel {
  final DateTime date;
  final String path;
  final List<int> durationHighAmplitudeList;

  RecordModel({
    required this.date,
    required this.path,
    required this.durationHighAmplitudeList,
  });

  String get dateStr =>
      '${_getWeekday(date)} ${_getFormattedDate(date)} à ${_getFormattedTime(date)}';

  String _getWeekday(DateTime dateTime) {
    final weekdays = [
      'Lundi',
      'Mardi',
      'Mercredi',
      'Jeudi',
      'Vendredi',
      'Samedi',
      'Dimanche'
    ];
    return weekdays[dateTime.weekday - 1];
  }

  String _getFormattedDate(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString();
    return '$day-$month-$year';
  }

  String _getFormattedTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final second = dateTime.second.toString().padLeft(2, '0');
    return '$hour:$minute:$second';
  }

  RecordModel copyWith({
    DateTime? date,
    String? path,
    List<int>? durationHighAmplitudeList,
  }) {
    return RecordModel(
      date: date ?? this.date,
      path: path ?? this.path,
      durationHighAmplitudeList:
          durationHighAmplitudeList ?? this.durationHighAmplitudeList,
    );
  }

  get props => [date, path];
}
