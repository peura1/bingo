import 'package:shared_preferences/shared_preferences.dart';

class BingoStorage {
  static final BingoStorage _singleton = BingoStorage._internal();

  factory BingoStorage() {
    return _singleton;
  }

  Future<List<String>> getItems() async {
    final prefs = await SharedPreferences.getInstance();
    final items = prefs.getStringList('items');
    return items ?? [];
  }

  Future<void> setItems(List<String> items) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('items', items);
  }

  BingoStorage._internal();
}