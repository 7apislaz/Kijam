class Kid {
  final int key;
  final String name;
  final int age;

  Kid({required this.key, required this.name, required this.age});

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'Kid{key: $key, name: $name, age: $age}';
  }
}