class User {
  User({
    required this.name,
    required this.age,
  });
  String name;
  int age;

  User.fromJson(Map<String, dynamic> map)
      : this(
          name: map['name'],
          age: map['age'],
        );

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "age": age,
    };
  }
}
