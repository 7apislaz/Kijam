class Kid {
  final String inf_key;
  final String tag;
  final String name;
  final String gender;
  final String age;
  final String classroom;
  final String picture;
  final String update_datetime;
  final String is_active;

  Kid({required this.inf_key, required this.tag, required this.name, required this.gender, required this.age, required this.classroom, required this.picture, required this.update_datetime, required this.is_active});

  Map<String, dynamic> toMap() {
    return {
      'inf_key': inf_key,
      'tag': tag,
      'name': name,
      'gender': gender,
      'age': age,
      'classroom': classroom,
      'picture': picture,
      'update_datetime': update_datetime,
      'is_active': is_active,
    };
  }

  @override
  String toString() {
    return 'Kid{inf_key: $inf_key, tag: $tag, name: $name, gender: $gender, age: $age, classroom: $classroom, picture: $picture, update_datetime: $update_datetime, is_active: $is_active}';
  }
}