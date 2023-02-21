class EmotionData {
  final String selected_play;
  final String measured_datetime;
  final String emotion;
  final String inf_key;

  EmotionData({
    required this.selected_play,
    required this.measured_datetime,
    required this.emotion,
    required this.inf_key,
  });

  Map<String, dynamic> toMap() {
    return {
      'selected_play': selected_play,
      'measured_datetime': measured_datetime,
      'emotion': emotion,
      'inf_key': inf_key,
    };
  }

  @override
  String toString() {
    return 'Emotion_data{selected_play: $selected_play, measured_datetime: $measured_datetime, emotion: $emotion, inf_key: $inf_key}';
  }
}