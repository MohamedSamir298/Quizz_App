import 'package:hive/hive.dart';

import '../models/user_model.dart';

class Authentication {
  Future<User?> login(String username) async {
    var box = await Hive.openBox<User>('userBox');
    User? user = box.get(username);
    return user;
  }

  Future<void> signUp(String username) async {
    var box = await Hive.openBox<User>('userBox');
    User user = User(userName: username, highScore: "0");
    await box.put(username, user);
  }

  Future<bool> logout() async {
    var box = await Hive.openBox<User>('userBox');
    bool isDeleted = await box.clear().then((value) => true);
    return isDeleted;
  }
}
