import 'package:flutter/material.dart';
import 'package:masakan_ala_anak_kos/helper/storage_manager.dart';

class FavoriteNotifier with ChangeNotifier {
  final String key = 'favorites';
  List<String> _favorites = [];
  List<String> get getFavorites => _favorites;

  FavoriteNotifier() {
    _initFavorite();
  }

  void _initFavorite() async {
    _favorites = await StorageManager.readPrefs(key) ?? [];
  }

  void addFavorite(String id) {
    if (_favorites.contains(id)) {
      return;
    } else {
      _favorites.add(id);
      _updateFavorites();
    }
  }

  void removeFavorite(String id) {
    if (!_favorites.contains(id)) {
      return;
    } else {
      _favorites.remove(id);
      _updateFavorites();
    }
  }

  void _updateFavorites() {
    StorageManager.savePrefs(key, _favorites);
    notifyListeners();
  }
}
