import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  String _username = "";
  bool _isLoggedIn = false;

  String get username => _username;
  bool get isLoggedIn => _isLoggedIn;

  void login(String user) {
    _username = user;
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _username = "";
    _isLoggedIn = false;
    notifyListeners();
  }
}