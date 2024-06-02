import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class DarkMode extends _$DarkMode {
  late FlutterSecureStorage storage;

  @override
  bool build() {
    onInit();
    return false;
  }

  onInit() async{
    AndroidOptions androidOptions = AndroidOptions.defaultOptions;
    if (Platform.isAndroid) {
      androidOptions = const AndroidOptions(
        encryptedSharedPreferences: true,
      );
    }
    storage = FlutterSecureStorage(aOptions: androidOptions);

    String? dark = await storage.read(key: 'dark');
    state = dark != null && dark == '1';
  }

  void toggleDarkMode() async{
    state = !state;
    await storage.write(key: 'dark', value: state ? '1' : '0');
  }
}