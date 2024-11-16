import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class AsyncStorageManager {
  // Private constructor to prevent direct instantiation
  AsyncStorageManager._privateConstructor();

  // Singleton instance
  static final AsyncStorageManager _instance = AsyncStorageManager._privateConstructor();

  factory AsyncStorageManager() {
    return _instance;
  }
// static Future<AsyncStorageManager> getInstance() async {
//     final result =  await AsyncStorageManager._privateConstructor();
//     return result;
//   }
  // Instance of SharedPreferences
  Future<SharedPreferences> _getPreferences() async {
    return await SharedPreferences.getInstance();
  }

  // Save data of any type to shared preferences
  Future<void> save(String key, dynamic value) async {
    final prefs = await _getPreferences();
    
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw UnsupportedError('Unsupported value type');
    }
  }

  // Get data by key
  Future<T?> get<T>(String key) async {
    final prefs = await _getPreferences();
    
    if (T == String) {
      return prefs.getString(key) as T?;
    } else if (T == int) {
      return prefs.getInt(key) as T?;
    } else if (T == bool) {
      return prefs.getBool(key) as T?;
    } else if (T == double) {
      return prefs.getDouble(key) as T?;
    } else if (T == List<String>) {
      return prefs.getStringList(key) as T?;
    }
    return null; // Return null if type is unsupported
  }

  // Remove a key-value pair
  Future<void> remove(String key) async {
    final prefs = await _getPreferences();
    await prefs.remove(key);
  }

  // Clear all data
  Future<void> clear() async {
    final prefs = await _getPreferences();
    await prefs.clear();
  }

  // Check if a key exists
  Future<bool> containsKey(String key) async {
    final prefs = await _getPreferences();
    return prefs.containsKey(key);
  }
}
class AsyncStorageKeys {
  static const mobileNumberToLogin = 'mobileNumberToLogin';
}