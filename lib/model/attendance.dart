class Attendance {
  final String attendance_type;
  final String emotion;
  final String attendance_datetime;
  final String inf_key;

  Attendance({
    required this.attendance_type,
    required this.emotion,
    required this.attendance_datetime,
    required this.inf_key,
  });


  Map<String, dynamic> toMap() {
    return {
      'attendance_type': attendance_type,
      'emotion': emotion,
      'attendance_datetime': attendance_datetime,
      'inf_key': inf_key,
    };
  }

  @override
String toString() {
    return 'Attendance{attendance_type: $attendance_type, emotion: $emotion, attendance_datetime: $attendance_datetime, inf_key: $inf_key}';
  }
}