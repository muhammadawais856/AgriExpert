import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? _name;
  String? _email;
  String? _profilePicture;

  // Getters
  String? get name => _name;
  String? get email => _email;
  String? get profilePicture => _profilePicture;

  // Setters
  void setUserDetails(String name, String email) {
    _name = name;
    _email = email;
    notifyListeners();
  }

  void setProfilePicture(String profilePic) {
    _profilePicture = profilePic;
    notifyListeners();
  }

  void clearUser() {
    _name = null;
    _email = null;
    _profilePicture = null;
    notifyListeners();
  }
}
