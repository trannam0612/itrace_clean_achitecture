import 'dart:developer';

import 'package:itrace_247/config/env/network_config.dart';
import 'package:itrace_247/config/utils/enum.dart';

const String envKey = 'env';
const Environment defaultEnv = Environment.staging;

class AppEnvironment {
  Environment currentEnv = defaultEnv;

  EnvConfig? _config;

  EnvConfig getConfig() {
    if (_config != null) return _config!;

    final String env = String.fromEnvironment(
      envKey,
      defaultValue: defaultEnv.name,
    );

    log('[AppEnvironment] Launching in $env');
    currentEnv = Environment.values.byName(env);

    EnvConfig? currentConfig;
    if (env == Environment.staging.name) {
      currentConfig = StagingConfig();
    } else if (env == Environment.production.name) {
      currentConfig = ProductionConfig();
    }

    _config = currentConfig;
    if (_config != null) {
      return _config!;
    } else {
      return throw Exception('No such environment=$env');
    }
  }
}

abstract class EnvConfig {
  NetworkConfig get networkConfig;
}

class StagingConfig extends EnvConfig {
  @override
  NetworkConfig get networkConfig => StagingNetworkConfig(
        rhBaseUrl: 'http://itrace247.cssdemoco.com/api',
      );
}

class ProductionConfig extends EnvConfig {
  @override
  NetworkConfig get networkConfig => ProductionNetworkConfig(
        rhBaseUrl: 'http://itrace247.cssdemoco.com/api',
      );
}
