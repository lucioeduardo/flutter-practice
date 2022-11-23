// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'remote_configs_key.dart';

class RemoteConfigHelper {
  final FirebaseRemoteConfig remoteConfig;

  RemoteConfigHelper({
    required this.remoteConfig,
  });

  Future<void> setup() async {
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 15),
          minimumFetchInterval: const Duration(seconds: 30)),
    );

    await remoteConfig.fetchAndActivate();
  }

  String getString({required RemoteConfigKey key}) {
    return remoteConfig.getString(key.name);
  }

  bool getBoolean({required RemoteConfigKey key}) {
    return remoteConfig.getBool(key.name);
  }

  int getInt({required RemoteConfigKey key}) {
    return remoteConfig.getInt(key.name);
  }
}
