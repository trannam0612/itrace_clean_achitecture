import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:itrace_247/config/dio/dio_interceptor.dart';
import 'package:itrace_247/config/dio/logging_interceptor.dart';
import 'package:itrace_247/config/env/app_env.dart';
import 'package:itrace_247/config/env/network_config.dart';

import '../get_it/getit_config.dart';

class DioConfig {
  DioConfig._();

  static Future<void> initDi() async {
    getIt.registerLazySingleton(() => LoggingInterceptor());
    getIt.registerLazySingleton(() => DioInterceptor());
    final AppEnvironment appEnv = getIt<AppEnvironment>();
    final NetworkConfig networkConfig = appEnv.getConfig().networkConfig;
    Map<String, String> headers = await networkConfig.headers;
    getIt.registerFactory<Dio>(() {
      log('headers123');

      final Dio dio = Dio(
        BaseOptions(
          connectTimeout: networkConfig.connectTimeoutMillis,
          receiveTimeout: networkConfig.receiveTimeoutMillis,
          headers: headers,
        ),
      );
      dio.interceptors.addAll(<Interceptor>[
        getIt<DioInterceptor>(),
      ]);
      // Interceptors
      if (kDebugMode) {
        // dio.interceptors.add(
        //   InterceptorsWrapper(
        //     onRequest: (options, handler) {
        //       log('message1');
        //       options.headers["Authorization"] = "Bearer " + 'token';
        //     },
        //   ),
        // );
        dio.interceptors.addAll(<Interceptor>[
          getIt<LoggingInterceptor>(),
          getIt<DioInterceptor>(),
        ]);
      }

      return dio;
    });
  }
}
