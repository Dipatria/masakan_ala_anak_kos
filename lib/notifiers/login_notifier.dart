import 'package:flutter/material.dart';
import 'package:masakan_ala_anak_kos/helper/storage_manager.dart';

class LoginNotifier with ChangeNotifier {
  final String key = 'user';
  String? _user;
  String? get user => _user;

  LoginNotifier() {
    _initLogin();
  }

  void _initLogin() async {
    _user = await StorageManager.readPrefs(key);
  }

  void login(String user) {
    _user = user;
    StorageManager.savePrefs(key, user);
    notifyListeners();
  }

  void logout() {
    _user = null;
    StorageManager.deletePrefs(key);
    notifyListeners();
  }
}
