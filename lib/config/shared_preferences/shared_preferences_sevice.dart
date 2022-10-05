import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  LocalStorageService(this._preferences);

  final SharedPreferences _preferences;

  dynamic _getFromDisk(String key) {
    Object? value = _preferences.get(key);
    log('(TRACE) LocalStorageService:_getFromDisk. key: $key ===> value: $value');
    return value;
  }

  // updated _saveToDisk function that handles all types
  void _saveToDisk<T>(String key, T content) {
    log('(TRACE) LocalStorageService:_saveStringToDisk. key: $key  ===> type: ${content.runtimeType}===> value: $content');
    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }

  void saveToDisk<T>(String key, T content) => _saveToDisk(key, content);
  dynamic getFromDisk<T>(String key) => _getFromDisk(key);
}
