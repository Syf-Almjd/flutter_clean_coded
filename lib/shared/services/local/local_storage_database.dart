import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clean_arch_kit/clean_arch_kit.dart';

/// Implementation of [LocalStorage] interface wrapping [SharedPreferences].
class LocalStorageDatabase implements LocalStorage {
  final SharedPreferences sharedPreferences;

  LocalStorageDatabase({required this.sharedPreferences});

  @override
  String? getString(String key) => sharedPreferences.getString(key);

  @override
  Future<bool> setString(String key, String value) => sharedPreferences.setString(key, value);

  @override
  bool? getBool(String key) => sharedPreferences.getBool(key);

  @override
  Future<bool> setBool(String key, bool value) => sharedPreferences.setBool(key, value);

  @override
  int? getInt(String key) => sharedPreferences.getInt(key);

  @override
  Future<bool> setInt(String key, int value) => sharedPreferences.setInt(key, value);

  /// Save a key-value pair as a string (legacy compatibility).
  Future<bool> save(String key, String value) => setString(key, value);

  /// Save a map (converted to JSON string) with a specified key.
  Future<bool> saveMap(String mapName, Map<String, dynamic> mapData) async {
    final String jsonString = jsonEncode(mapData);
    return await setString(mapName, jsonString);
  }

  /// Save a list (converted to JSON string) with a specified key.
  Future<bool> saveList(String listName, List<dynamic> listData) async {
    final String jsonString = jsonEncode(listData);
    return await setString(listName, jsonString);
  }

  /// Retrieve a string value by key (legacy compatibility).
  String? get(String key) => getString(key);

  /// Retrieve a map (decoded from JSON string) by key.
  Map<String, dynamic>? getMap(String mapName) {
    final String? jsonString = getString(mapName);
    if (jsonString != null) {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    }
    return null;
  }

  /// Retrieve a list (decoded from JSON string) by key.
  List<dynamic>? getList(String listName) {
    final String? jsonString = getString(listName);
    if (jsonString != null) {
      return jsonDecode(jsonString) as List<dynamic>;
    }
    return null;
  }

  @override
  Future<bool> remove(String key) => sharedPreferences.remove(key);

  @override
  Future<bool> clear() => sharedPreferences.clear();
}
