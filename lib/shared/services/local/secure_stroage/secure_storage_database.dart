import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:clean_arch_kit/clean_arch_kit.dart';

/// Implementation of [SecureStorage] interface wrapping [FlutterSecureStorage].
class SecureStorageDatabase implements SecureStorage {
  final FlutterSecureStorage secureStorage;

  SecureStorageDatabase({required this.secureStorage});

  @override
  Future<String?> read(String key) => secureStorage.read(key: key);

  @override
  Future<void> write(String key, String value) => secureStorage.write(key: key, value: value);

  @override
  Future<void> delete(String key) => secureStorage.delete(key: key);

  @override
  Future<void> deleteAll() => secureStorage.deleteAll();

  /// Save a key-value pair as a string (legacy compatibility).
  Future<void> save(String key, String value) => write(key, value);

  /// Save a map (converted to JSON string) with a specified key.
  Future<void> saveMap(String mapName, Map<String, dynamic> mapData) async {
    final String jsonString = jsonEncode(mapData);
    await write(mapName, jsonString);
  }

  /// Save a list (converted to JSON string) with a specified key.
  Future<void> saveList(String listName, List<dynamic> listData) async {
    final String jsonString = jsonEncode(listData);
    await write(listName, jsonString);
  }

  /// Retrieve a string value by key (legacy compatibility).
  Future<String?> get(String key) => read(key);

  /// Retrieve a map (decoded from JSON string) by key.
  Future<Map<String, dynamic>?> getMap(String mapName) async {
    final String? jsonString = await read(mapName);
    if (jsonString != null) {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    }
    return null;
  }

  /// Retrieve a list (decoded from JSON string) by key.
  Future<List<dynamic>?> getList(String listName) async {
    final String? jsonString = await read(listName);
    if (jsonString != null) {
      return jsonDecode(jsonString) as List<dynamic>;
    }
    return null;
  }

  /// Remove a value by key (legacy compatibility).
  Future<void> remove(String key) => delete(key);

  /// Clear all stored data (legacy compatibility).
  Future<void> clear() => deleteAll();
}
