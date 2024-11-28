import 'dart:convert';

import 'package:flutter_riverpod_mvvm/user.dart';

class UserRepository {
  Future<User> getUser() async {
    await Future.delayed(const Duration(seconds: 1));

    String serverResponse = """
{
	"name": "이유준",
	"age": 30
}
""";

    Map<String, dynamic> map = jsonDecode(serverResponse);

    User user = User.fromJson(map);

    return user;
  }
}
