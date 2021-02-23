import 'package:flutter/material.dart';

class AuthCredentialsProvider with ChangeNotifier {
  String _authToken;
  String get authToken => _authToken;
  String _userID;
  String get userID => _userID;

  void setAuthToken({String token}) {
    _authToken = token;
    notifyListeners();
  }

  void setUserID({String id}) {
    _userID = id;
    notifyListeners();
  }
}
