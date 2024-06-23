import 'package:flutter/material.dart';
import 'package:quiz_app/models/user_model.dart';
import 'package:quiz_app/services/auth_services.dart';

class AuthenticationViewModel extends ChangeNotifier {
  Authentication authentication = Authentication();
  User? user;

  Future<void> signUp(String username) async {
    await authentication.signUp(username);
    user = User(userName: username, highScore: "0");
    notifyListeners();
  }

  Future<void> login(String userName) async {
    user = await authentication.login(userName);
    notifyListeners();
  }

  Future<void> logout() async {
    await authentication.logout();
    user = null;
    notifyListeners();
  }
}
