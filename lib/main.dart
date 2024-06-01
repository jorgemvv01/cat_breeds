import 'package:cat_breeds/config/router/app_router.dart';
import 'package:cat_breeds/config/theme/theme.dart';
import 'package:cat_breeds/presentation/general_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{
  runApp(
    const ProviderScope(
      child: MyApp()
    )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final isDarkmode = ref.watch(darkModeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme( isDarkmode: isDarkmode ).getTheme(),
      // theme: ThemeData(
      //   fontFamily: 'Poppins',
      //   textSelectionTheme: const TextSelectionThemeData(
      //     cursorColor: CustomColors.mainColor,
      //     selectionColor: CustomColors.tertiaryColor,
      //     selectionHandleColor: CustomColors.secundaryColor,
      //   )
      // ),
    );
  }
}