import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:itrace_247/config/get_it/getit_config.dart';
import 'package:itrace_247/config/storage_sevice.dart/storage_sevice.dart';

class DioInterceptor extends InterceptorsWrapper {
  final StorageService storageService = getIt<StorageService>();
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    print('onRequest');
    String? currentToken = await storageService.readSecureData('token');
    print('currentToken:$currentToken');

    options.headers.addAll(<String, String>{
      'Authorization': 'Bearer $currentToken',
    });

    return super.onRequest(options, handler);
  }
}
