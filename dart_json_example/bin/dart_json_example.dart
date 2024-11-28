import 'dart:convert';

void main() {
  String jsonString = """
{
	"name": "오상구",
	"age": 7,
	"isMale" : true
}
""";
  Map<String, dynamic> map = jsonDecode(jsonString);
  Pet pet = Pet.fromJson(map);
  print(pet.toJson());
}

class Pet {
  String name;
  int age;
  bool isMale;

  Pet({
    required this.name,
    required this.age,
    required this.isMale,
  });

  Pet.fromJson(Map<String, dynamic> json)
      : this(
          name: json["name"],
          age: json["age"],
          isMale: json["isMale"],
        );

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "age": age,
      "isMale": isMale,
    };
  }
}
