import 'dart:developer';

import 'package:itrace_247/config/get_it/getit_config.dart';
import 'package:itrace_247/config/storage_sevice.dart/storage_sevice.dart';

class NetworkConfig {
  NetworkConfig({
    required this.rhBaseUrl,
  });

  final String rhBaseUrl;
  int get connectTimeoutMillis => 30000;
  int get receiveTimeoutMillis => 30000;
  final StorageService storageService = getIt<StorageService>();
  Future<Map<String, String>> get headers async {
    // String? currentToken = await storageService.readSecureData('token');
    return <String, String>{
      'accept': '*/*',
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $currentToken',
    };
  }
}

class StagingNetworkConfig extends NetworkConfig {
  StagingNetworkConfig({
    required super.rhBaseUrl,
  });
}

class ProductionNetworkConfig extends NetworkConfig {
  ProductionNetworkConfig({
    required super.rhBaseUrl,
  });
}
