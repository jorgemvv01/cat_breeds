import 'dart:io';

import 'package:cat_breeds/config/router/app_router.dart';
import 'package:cat_breeds/config/theme/theme.dart';
import 'package:cat_breeds/config/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

FlutterSecureStorage? storage;
void main() async{
  await getStorage();
  runApp(
    const ProviderScope(
      child: MyApp()
    )
  );
}

Future<FlutterSecureStorage> getStorage() async{
  if(storage == null){
    await dotenv.load(fileName: ".env");
    AndroidOptions androidOptions = AndroidOptions.defaultOptions;
    if (Platform.isAndroid) {
      androidOptions = const AndroidOptions(
        encryptedSharedPreferences: true,
      );
    }
    storage = FlutterSecureStorage(aOptions: androidOptions);
    storage!.write(key: 'api-key', value: dotenv.env['API_KEY']);
  }
  return storage!;
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final isDarkmode = ref.watch(darkModeProvider);
    return MaterialApp.router(
      localizationsDelegates: const[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const[
        Locale('en'),
        Locale('es'),
      ],
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme( isDarkmode: isDarkmode ).getTheme(),
    );
  }
}