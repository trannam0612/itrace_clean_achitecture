import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:itrace_247/config/storage_sevice.dart/storage_item.dart';

class StorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
//==========Write============

  Future<void> writeSecureData(StorageItem newItem) async {
    await _secureStorage.write(
      key: newItem.key,
      value: newItem.value,
      aOptions: _getAndroidOptions(),
    );
  }

//==========Read============
  Future<String?> readSecureData(String key) async {
    String? readData =
        await _secureStorage.read(key: key, aOptions: _getAndroidOptions());
    return readData;
  }

  // =============Delete==============
  Future<void> deleteSecureData(StorageItem item) async {
    await _secureStorage.delete(key: item.key, aOptions: _getAndroidOptions());
  }

  //=============ReadAll==============
  Future<List<StorageItem>> readAllSecureData() async {
    Map<String, String> allData =
        await _secureStorage.readAll(aOptions: _getAndroidOptions());
    List<StorageItem> list = allData.entries
        .map((MapEntry<String, String> e) => StorageItem(e.key, e.value))
        .toList();
    return list;
  }

  //=============DeleteAll==============
  Future<void> deleteAllSecureData() async {
    await _secureStorage.deleteAll(aOptions: _getAndroidOptions());
  }

  Future<bool> containsKeyInSecureData(String key) async {
    bool containsKey = await _secureStorage.containsKey(
      key: key,
      aOptions: _getAndroidOptions(),
    );
    return containsKey;
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
