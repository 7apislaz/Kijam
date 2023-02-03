class MeasuredData {
  final String height;
  final String weight;
  final String measured_datetime;
  final String inf_key;

  MeasuredData({
    required this.height,
    required this.weight,
    required this.measured_datetime,
    required this.inf_key,
  });

  Map<String, dynamic> toMap() {
    return {
      'height': height,
      'weight': weight,
      'measured_datetime': measured_datetime,
      'inf_key': inf_key,
    };
  }

  @override
  String toString() {
    return 'Measured_data{height: $height, weight: $weight, measured_datetime: $measured_datetime, inf_key: $inf_key}';
  }
}