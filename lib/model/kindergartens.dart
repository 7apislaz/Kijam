class Kindergartens {
  final String key;
  final String name;
  final String updated_datetime;

  Kindergartens({required this.key, required this.name, required this.updated_datetime});

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'name': name,
      'updated_datetime': updated_datetime,
    };
  }

  @override
  String toString() {
    return 'Kindergartens{key: $key, name: $name, updated_datetime: $updated_datetime}';
  }
}