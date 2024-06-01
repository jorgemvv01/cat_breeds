

import 'package:cat_breeds/utils/color/custom_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {

  final bool isDarkmode;

  AppTheme({ required this.isDarkmode });


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkmode ? Brightness.dark : Brightness.light,
    fontFamily: 'Poppins',
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: CustomColors.mainColor,
      selectionColor: CustomColors.tertiaryColor,
      selectionHandleColor: CustomColors.mainColor,
    )
  );

}